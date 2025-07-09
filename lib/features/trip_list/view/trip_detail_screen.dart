import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class TripMapScreen extends StatefulWidget {
  final LatLng pickup;
  final LatLng dropoff;

  const TripMapScreen({super.key, required this.pickup, required this.dropoff});

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen> {
  final MapController mapController = MapController();
  LatLng? currentLocation;
  List<LatLng> routePoints = [];
  StreamSubscription<Position>? positionStream;
  double? currentHeading;
  bool isLoadingRoute = true;

  @override
  void dispose() {
    positionStream?.cancel();
    mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMapData();
    });
  }
  Future<void> _startLiveTracking() async {
    // Kiểm tra quyền
    bool hasPermission = await _checkLocationPermission();
    if (!hasPermission) return;

    // Cấu hình stream
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 15,
      ),
    ).listen((Position position) {
      if (!mounted) return;

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
        currentHeading = position.heading; // Lưu hướng di chuyển
      });

      mapController.move(currentLocation!, mapController.camera.zoom);

    });
  }
  Future<bool> _checkLocationPermission() async {
    final status = await Geolocator.checkPermission();
    if (status == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    return status == LocationPermission.always || status == LocationPermission.whileInUse;
  }

  Future<void> _loadMapData() async {
    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(pos.latitude, pos.longitude);
    });

    final points = await fetchRoute(currentLocation!, widget.pickup);
    setState(() {
      routePoints = points;
      isLoadingRoute = false;
    });
    _startLiveTracking();
  }
  Future<List<LatLng>> fetchRoute(LatLng from, LatLng to) async {
    final url =
        'http://router.project-osrm.org/route/v1/driving/${from.longitude},${from.latitude};${to.longitude},${to.latitude}?overview=full&geometries=geojson';
    final res = await http.get(Uri.parse(url));
    final data = json.decode(res.body);
    final coords = data['routes'][0]['geometry']['coordinates'] as List;
    return coords.map((c) => LatLng(c[1], c[0])).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Đi đón khách')),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
         initialCenter: currentLocation!,
          initialZoom: 15.0,
          minZoom: 5.0,
          maxZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: currentLocation!,
                width: 40,
                height: 40,
                child: Icon(Icons.my_location, color: Colors.blue), // dùng child
              ),
              Marker(
                point: widget.pickup,
                width: 40,
                height: 40,
                child: Icon(Icons.location_on, color: Colors.green),
              ),
              Marker(
                point: widget.dropoff,
                width: 40,
                height: 40,
                child: Icon(Icons.flag, color: Colors.red),
              ),
            ],
          ),
          if (!isLoadingRoute && routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  strokeWidth: 4.0,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          if (isLoadingRoute)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentLocation != null) {
            mapController.move(currentLocation!, 17.0); // Zoom sát khi bấm
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ko co vi tri')));
          }
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
