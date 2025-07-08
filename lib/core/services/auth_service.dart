import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService{
  static final AuthService instance = AuthService._internal();
  final _storage = const FlutterSecureStorage();
  final _key = 'auth_token';

  AuthService._internal();

  Future<void> saveToken(String token) async {
    await _storage.write(key: _key, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _key);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: _key);
  }
}