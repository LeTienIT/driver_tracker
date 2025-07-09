// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripModel _$TripModelFromJson(Map<String, dynamic> json) => _TripModel(
  name: (json['name'] as num).toInt(),
  customTenKhach: json['customTenKhach'] as String,
  customSdt: json['customSdt'] as String,
  customTtk: json['customTtk'] as String?,
  customTenDiemDon: json['customTenDiemDon'] as String,
  customTenDiemDen: json['customTenDiemDen'] as String,
  customMoTa: json['customMoTa'] as String,
  customTrangThai: json['customTrangThai'] as String,
);

Map<String, dynamic> _$TripModelToJson(_TripModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'customTenKhach': instance.customTenKhach,
      'customSdt': instance.customSdt,
      'customTtk': instance.customTtk,
      'customTenDiemDon': instance.customTenDiemDon,
      'customTenDiemDen': instance.customTenDiemDen,
      'customMoTa': instance.customMoTa,
      'customTrangThai': instance.customTrangThai,
    };
