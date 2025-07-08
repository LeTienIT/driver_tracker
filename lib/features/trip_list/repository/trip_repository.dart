import 'package:driver_tracker/core/services/dio_client.dart';
import 'package:driver_tracker/features/trip_list/model/trip_model.dart';

class TripRepository{
  final DioClient _client = DioClient();

  Future<List<TripModel>> getAllData(String email) async {
    try {
      final res = await _client.dio.post(
        'api_lt.driver_tracker.get.trips.getTripsByEmail',
        data: {'email': email},
      );

      final data = res.data['message'];
      final success = data['success'] == true;
      final tripsJson = data['Trips'];

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
      } else {
        throw Exception("Lỗi lấy dữ liệu: $data");
      }
    } catch (e) {
      // print('Lỗi lấy trip: $e');
      throw Exception("Lỗi ngoại lệ: $e");
    }
  }

}