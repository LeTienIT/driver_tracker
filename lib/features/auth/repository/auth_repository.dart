import '../../../core/services/dio_client.dart';
import '../../../core/services/auth_service.dart';
import '../model/driver_user.dart';

class AuthRepository {
  final DioClient _client = DioClient();

  Future<(bool success, DriverUser? user)> login(String email, String password) async {
    try {
      final res = await _client.dio.post(
        'api_lt.driver_tracker.login.auth.login_driver',
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = res.data['message'];
      if (data['success'] == true) {
        await AuthService.instance.saveToken(data['token']);
        final userJson = data['user'];
        final user = DriverUser.fromJson(userJson);

        return (true, user);
      } else {
        return (false, null);
      }
    } catch (e) {
      print(e);
      throw Exception("Lỗi kết nối hoặc server: $e");
    }
  }
}
