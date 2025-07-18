import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_user.freezed.dart';
part 'driver_user.g.dart';

@freezed
abstract class DriverUser with _$DriverUser {
  const factory DriverUser({
    required String email,
    required int id,
    required String name,
    required String sdt,
    String? thongTinKhac,
  }) = _DriverUser;

  factory DriverUser.fromJson(Map<String, Object?> json) => _$DriverUserFromJson(json);
}