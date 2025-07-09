import 'package:driver_tracker/core/services/dio_client.dart';
import 'package:driver_tracker/features/trip_list/model/trip_model.dart';
import 'dart:convert';
import 'package:latlong2/latlong.dart';

class TripRepository{
  final DioClient _client = DioClient();

  Future<List<TripModel>> getAllData(int id) async {
    try {
      final res = await _client.dio.post(
        'api_lt.driver_tracker.get.trips.getTripsByEmail',
        data: {'email': id},
      );

      final data = res.data['message'];
      final success = data['success'] == true;
      final tripsJson = data['data'];
      // print("api: $tripsJson");
      if (success) {
        if(tripsJson != null) {
          final trips = (tripsJson as List)
            .map((e) => TripModel.fromJson(e as Map<String, dynamic>))
            .toList();
          return trips;
        }
        else{
          return [];
        }
      }
      else {
        print('false trip_repository: $data');
        // throw Exception("Lỗi lấy dữ liệu: $data");
        return [];
      }
    } catch (e) {
      print('Lỗi trip repository: $e');
      // throw Exception("Lỗi ngoại lệ: $e");
      return [];
    }
  }

  Future<void> updateLocation(int id, double lat, double lng) async {
    try{
      final res = await _client.dio.post(
          'api_lt.driver_tracker.post.driver_tracker.update_driver_location',
          data: {
            "name": id,
            "lng": lng,
            "lat": lat
          }
      );
      print('updateLocation ${res.data}');
    }catch(e){
      print('Lỗi trip repository -> updateLocation: $e');
    }
  }

  Future<(LatLng?, LatLng?)> getTripDetail(int id) async {
    try {
      final res = await _client.dio.post(
        'api_lt.driver_tracker.get.trips.get_trip_detail',
        data: {"trip_id": id},
      );

      final data = res.data['message']['data'];
      final pickupStr = data['custom_diem_don'];
      final dropoffStr = data['custom_diem_den'];

      final pickupPoint = parseGeoJsonPoint(pickupStr);
      final dropoffPoint = parseGeoJsonPoint(dropoffStr);

      return (pickupPoint, dropoffPoint);
    } catch (e) {
      print('Lỗi trip repository -> getTripDetail: $e');
      return (null, null);
    }
  }

  LatLng? parseGeoJsonPoint(String geoJsonStr) {
    try {
      final data = json.decode(geoJsonStr);
      final coords = data['features'][0]['geometry']['coordinates'];
      return LatLng(coords[1], coords[0]); // lat, lng
    } catch (e) {
      print('Lỗi parse geojson: $e');
      return null;
    }
  }
}