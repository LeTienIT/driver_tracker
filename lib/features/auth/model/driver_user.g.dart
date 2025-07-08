// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverUser _$DriverUserFromJson(Map<String, dynamic> json) => _DriverUser(
  email: json['email'] as String,
  name: json['name'] as String,
  sdt: json['sdt'] as String,
  thongTinKhac: json['thongTinKhac'] as String,
);

Map<String, dynamic> _$DriverUserToJson(_DriverUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'sdt': instance.sdt,
      'thongTinKhac': instance.thongTinKhac,
    };
