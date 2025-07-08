import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
abstract class TripModel with _$TripModel {
  const factory TripModel({
    required String nameKH,
    required String sdt,
    required String diemDon,
    required String diemDen,
    required String moTa,
    required String trangThai,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, Object?> json) => _$TripModelFromJson(json);
}