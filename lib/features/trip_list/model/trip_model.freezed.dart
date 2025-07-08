// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TripModel {

 String get nameKH; String get sdt; String get diemDon; String get diemDen; String get moTa; String get trangThai;
/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripModelCopyWith<TripModel> get copyWith => _$TripModelCopyWithImpl<TripModel>(this as TripModel, _$identity);

  /// Serializes this TripModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripModel&&(identical(other.nameKH, nameKH) || other.nameKH == nameKH)&&(identical(other.sdt, sdt) || other.sdt == sdt)&&(identical(other.diemDon, diemDon) || other.diemDon == diemDon)&&(identical(other.diemDen, diemDen) || other.diemDen == diemDen)&&(identical(other.moTa, moTa) || other.moTa == moTa)&&(identical(other.trangThai, trangThai) || other.trangThai == trangThai));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nameKH,sdt,diemDon,diemDen,moTa,trangThai);

@override
String toString() {
  return 'TripModel(nameKH: $nameKH, sdt: $sdt, diemDon: $diemDon, diemDen: $diemDen, moTa: $moTa, trangThai: $trangThai)';
}


}

/// @nodoc
abstract mixin class $TripModelCopyWith<$Res>  {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) _then) = _$TripModelCopyWithImpl;
@useResult
$Res call({
 String nameKH, String sdt, String diemDon, String diemDen, String moTa, String trangThai
});




}
/// @nodoc
class _$TripModelCopyWithImpl<$Res>
    implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._self, this._then);

  final TripModel _self;
  final $Res Function(TripModel) _then;

/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameKH = null,Object? sdt = null,Object? diemDon = null,Object? diemDen = null,Object? moTa = null,Object? trangThai = null,}) {
  return _then(_self.copyWith(
nameKH: null == nameKH ? _self.nameKH : nameKH // ignore: cast_nullable_to_non_nullable
as String,sdt: null == sdt ? _self.sdt : sdt // ignore: cast_nullable_to_non_nullable
as String,diemDon: null == diemDon ? _self.diemDon : diemDon // ignore: cast_nullable_to_non_nullable
as String,diemDen: null == diemDen ? _self.diemDen : diemDen // ignore: cast_nullable_to_non_nullable
as String,moTa: null == moTa ? _self.moTa : moTa // ignore: cast_nullable_to_non_nullable
as String,trangThai: null == trangThai ? _self.trangThai : trangThai // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TripModel].
extension TripModelPatterns on TripModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripModel value)  $default,){
final _that = this;
switch (_that) {
case _TripModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripModel value)?  $default,){
final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nameKH,  String sdt,  String diemDon,  String diemDen,  String moTa,  String trangThai)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that.nameKH,_that.sdt,_that.diemDon,_that.diemDen,_that.moTa,_that.trangThai);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nameKH,  String sdt,  String diemDon,  String diemDen,  String moTa,  String trangThai)  $default,) {final _that = this;
switch (_that) {
case _TripModel():
return $default(_that.nameKH,_that.sdt,_that.diemDon,_that.diemDen,_that.moTa,_that.trangThai);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nameKH,  String sdt,  String diemDon,  String diemDen,  String moTa,  String trangThai)?  $default,) {final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that.nameKH,_that.sdt,_that.diemDon,_that.diemDen,_that.moTa,_that.trangThai);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripModel implements TripModel {
  const _TripModel({required this.nameKH, required this.sdt, required this.diemDon, required this.diemDen, required this.moTa, required this.trangThai});
  factory _TripModel.fromJson(Map<String, dynamic> json) => _$TripModelFromJson(json);

@override final  String nameKH;
@override final  String sdt;
@override final  String diemDon;
@override final  String diemDen;
@override final  String moTa;
@override final  String trangThai;

/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripModelCopyWith<_TripModel> get copyWith => __$TripModelCopyWithImpl<_TripModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TripModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripModel&&(identical(other.nameKH, nameKH) || other.nameKH == nameKH)&&(identical(other.sdt, sdt) || other.sdt == sdt)&&(identical(other.diemDon, diemDon) || other.diemDon == diemDon)&&(identical(other.diemDen, diemDen) || other.diemDen == diemDen)&&(identical(other.moTa, moTa) || other.moTa == moTa)&&(identical(other.trangThai, trangThai) || other.trangThai == trangThai));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nameKH,sdt,diemDon,diemDen,moTa,trangThai);

@override
String toString() {
  return 'TripModel(nameKH: $nameKH, sdt: $sdt, diemDon: $diemDon, diemDen: $diemDen, moTa: $moTa, trangThai: $trangThai)';
}


}

/// @nodoc
abstract mixin class _$TripModelCopyWith<$Res> implements $TripModelCopyWith<$Res> {
  factory _$TripModelCopyWith(_TripModel value, $Res Function(_TripModel) _then) = __$TripModelCopyWithImpl;
@override @useResult
$Res call({
 String nameKH, String sdt, String diemDon, String diemDen, String moTa, String trangThai
});




}
/// @nodoc
class __$TripModelCopyWithImpl<$Res>
    implements _$TripModelCopyWith<$Res> {
  __$TripModelCopyWithImpl(this._self, this._then);

  final _TripModel _self;
  final $Res Function(_TripModel) _then;

/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameKH = null,Object? sdt = null,Object? diemDon = null,Object? diemDen = null,Object? moTa = null,Object? trangThai = null,}) {
  return _then(_TripModel(
nameKH: null == nameKH ? _self.nameKH : nameKH // ignore: cast_nullable_to_non_nullable
as String,sdt: null == sdt ? _self.sdt : sdt // ignore: cast_nullable_to_non_nullable
as String,diemDon: null == diemDon ? _self.diemDon : diemDon // ignore: cast_nullable_to_non_nullable
as String,diemDen: null == diemDen ? _self.diemDen : diemDen // ignore: cast_nullable_to_non_nullable
as String,moTa: null == moTa ? _self.moTa : moTa // ignore: cast_nullable_to_non_nullable
as String,trangThai: null == trangThai ? _self.trangThai : trangThai // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
