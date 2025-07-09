import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
abstract class TripModel with _$TripModel {
  const factory TripModel({
    required int name,
    required String customTenKhach,
    required String customSdt,
    String? customTtk,
    required String customTenDiemDon,
    required String customTenDiemDen,
    required String customMoTa,
    required String customTrangThai,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, Object?> json) => _$TripModelFromJson(json);

}