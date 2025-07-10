import 'dart:async';
import 'dart:convert';
import 'package:driver_tracker/core/widgets/show_dialog.dart';
import 'package:driver_tracker/features/trip_list/provider/trip_provider.dart';
import 'package:driver_tracker/features/trip_list/view_model/trip_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class TripMapScreen extends ConsumerStatefulWidget {
  final int tripId;
  final String trangThai;
  final LatLng pickup;
  final LatLng dropoff;
  bool? checkDaDon;
  TripMapScreen({super.key, required this.tripId, required this.trangThai, required this.pickup, required this.dropoff, this.checkDaDon=false});

  @override
  ConsumerState<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends ConsumerState<TripMapScreen> {
  final MapController mapController = MapController();
  LatLng? currentLocation;
  List<LatLng> routePoints = [];
  StreamSubscription<Position>? positionStream;
  double? currentHeading;
  bool isLoadingRoute = true;
  bool daDonKhach = false;
  Timer? locationUploadTimer;

  @override
  void dispose() {
    positionStream?.cancel();
    locationUploadTimer?.cancel();
    mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    daDonKhach = widget.checkDaDon!;
    super.initState();
    final vm = ref.read(tripProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMapData(vm);
      if(widget.trangThai != 'Đang đi đón khách'){
        daDonKhach = true;
        vm.updateStatusTrip(widget.tripId, 'Đang đi đón khách');
      }

    });
  }
  Future<void> _startLiveTracking(TripVM vm) async {
    bool hasPermission = await _checkLocationPermission();
    if (!hasPermission) return;

    await positionStream?.cancel();
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 15,
      ),
    ).listen((Position position) {
      if (!mounted) return;

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
        currentHeading = position.heading;
      });

      mapController.move(currentLocation!, mapController.camera.zoom);
      locationUploadTimer = Timer.periodic(const Duration(seconds: 100), (_) {
        if (currentLocation != null) {
          vm.updateLocationLogin(loading: false);
          print('📤 Vị trí gửi lúc: ${DateTime.now()}');
        }
      });

      Future.microtask(() {
        if (currentLocation != null) {
          vm.updateLocationLogin(loading: false);
        }
      });
    });
  }
  Future<bool> _checkLocationPermission() async {
    final status = await Geolocator.checkPermission();
    if (status == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    return status == LocationPermission.always || status == LocationPermission.whileInUse;
  }

  Future<void> _loadMapData(TripVM vm) async {
    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(pos.latitude, pos.longitude);
    });
    if(widget.trangThai == 'Đang đi đón khách')
    {
        final points = await fetchRoute(currentLocation!, widget.pickup);
        setState(() {
          routePoints = points;
          isLoadingRoute = false;
        });
    }
    else{
      final points = await fetchRoute(currentLocation!, widget.dropoff);
      setState(() {
        routePoints = points;
        isLoadingRoute = false;
      });
    }
    _startLiveTracking(vm);
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
    final state = ref.watch(tripProvider);
    final vm = ref.read(tripProvider.notifier);
    if(state.isLoading){
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (currentLocation == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Đi đón khách')),
      body: Column(
        children: [
          Expanded(child: FlutterMap(
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
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'letienit.driver_tracker.driver_tracker',
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
          )),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  if(!daDonKhach){
                    setState(() {
                      isLoadingRoute = true;
                    });

                    final points = await fetchRoute(currentLocation!, widget.dropoff);
                    setState(() {
                      routePoints..clear()..addAll(points);
                      isLoadingRoute = false;
                    });

                    daDonKhach = true;

                    await vm.updateStatusTrip(widget.tripId, 'Đang đưa khách đến nơi');
                  }
                  else{
                    final rs = await CustomDialog.showConfirmDialog(
                        context: context,
                        title: 'Xác nhận',
                        message: 'Xác nhận đã đưa khách hàng đến nơi'
                    );
                    if(rs){
                      await vm.updateStatusTrip(widget.tripId, 'Hoàn thành hành trình');
                      Navigator.pushNamedAndRemoveUntil(context, '/trip-list', (router)=>false);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  daDonKhach ? "Hoàn thành hành trình" : "Đã đón được khách",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),),
            ),
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
