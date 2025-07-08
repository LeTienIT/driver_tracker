// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripModel _$TripModelFromJson(Map<String, dynamic> json) => _TripModel(
  nameKH: json['nameKH'] as String,
  sdt: json['sdt'] as String,
  diemDon: json['diemDon'] as String,
  diemDen: json['diemDen'] as String,
  moTa: json['moTa'] as String,
  trangThai: json['trangThai'] as String,
);

Map<String, dynamic> _$TripModelToJson(_TripModel instance) =>
    <String, dynamic>{
      'nameKH': instance.nameKH,
      'sdt': instance.sdt,
      'diemDon': instance.diemDon,
      'diemDen': instance.diemDen,
      'moTa': instance.moTa,
      'trangThai': instance.trangThai,
    };
