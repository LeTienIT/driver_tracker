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

 int get name; String get customTenKhach; String get customSdt; String? get customTtk; String get customTenDiemDon; String get customTenDiemDen; String get customMoTa; String get customTrangThai;
/// Create a copy of TripModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripModelCopyWith<TripModel> get copyWith => _$TripModelCopyWithImpl<TripModel>(this as TripModel, _$identity);

  /// Serializes this TripModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripModel&&(identical(other.name, name) || other.name == name)&&(identical(other.customTenKhach, customTenKhach) || other.customTenKhach == customTenKhach)&&(identical(other.customSdt, customSdt) || other.customSdt == customSdt)&&(identical(other.customTtk, customTtk) || other.customTtk == customTtk)&&(identical(other.customTenDiemDon, customTenDiemDon) || other.customTenDiemDon == customTenDiemDon)&&(identical(other.customTenDiemDen, customTenDiemDen) || other.customTenDiemDen == customTenDiemDen)&&(identical(other.customMoTa, customMoTa) || other.customMoTa == customMoTa)&&(identical(other.customTrangThai, customTrangThai) || other.customTrangThai == customTrangThai));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,customTenKhach,customSdt,customTtk,customTenDiemDon,customTenDiemDen,customMoTa,customTrangThai);

@override
String toString() {
  return 'TripModel(name: $name, customTenKhach: $customTenKhach, customSdt: $customSdt, customTtk: $customTtk, customTenDiemDon: $customTenDiemDon, customTenDiemDen: $customTenDiemDen, customMoTa: $customMoTa, customTrangThai: $customTrangThai)';
}


}

/// @nodoc
abstract mixin class $TripModelCopyWith<$Res>  {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) _then) = _$TripModelCopyWithImpl;
@useResult
$Res call({
 int name, String customTenKhach, String customSdt, String? customTtk, String customTenDiemDon, String customTenDiemDen, String customMoTa, String customTrangThai
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? customTenKhach = null,Object? customSdt = null,Object? customTtk = freezed,Object? customTenDiemDon = null,Object? customTenDiemDen = null,Object? customMoTa = null,Object? customTrangThai = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as int,customTenKhach: null == customTenKhach ? _self.customTenKhach : customTenKhach // ignore: cast_nullable_to_non_nullable
as String,customSdt: null == customSdt ? _self.customSdt : customSdt // ignore: cast_nullable_to_non_nullable
as String,customTtk: freezed == customTtk ? _self.customTtk : customTtk // ignore: cast_nullable_to_non_nullable
as String?,customTenDiemDon: null == customTenDiemDon ? _self.customTenDiemDon : customTenDiemDon // ignore: cast_nullable_to_non_nullable
as String,customTenDiemDen: null == customTenDiemDen ? _self.customTenDiemDen : customTenDiemDen // ignore: cast_nullable_to_non_nullable
as String,customMoTa: null == customMoTa ? _self.customMoTa : customMoTa // ignore: cast_nullable_to_non_nullable
as String,customTrangThai: null == customTrangThai ? _self.customTrangThai : customTrangThai // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int name,  String customTenKhach,  String customSdt,  String? customTtk,  String customTenDiemDon,  String customTenDiemDen,  String customMoTa,  String customTrangThai)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that.name,_that.customTenKhach,_that.customSdt,_that.customTtk,_that.customTenDiemDon,_that.customTenDiemDen,_that.customMoTa,_that.customTrangThai);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int name,  String customTenKhach,  String customSdt,  String? customTtk,  String customTenDiemDon,  String customTenDiemDen,  String customMoTa,  String customTrangThai)  $default,) {final _that = this;
switch (_that) {
case _TripModel():
return $default(_that.name,_that.customTenKhach,_that.customSdt,_that.customTtk,_that.customTenDiemDon,_that.customTenDiemDen,_that.customMoTa,_that.customTrangThai);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int name,  String customTenKhach,  String customSdt,  String? customTtk,  String customTenDiemDon,  String customTenDiemDen,  String customMoTa,  String customTrangThai)?  $default,) {final _that = this;
switch (_that) {
case _TripModel() when $default != null:
return $default(_that.name,_that.customTenKhach,_that.customSdt,_that.customTtk,_that.customTenDiemDon,_that.customTenDiemDen,_that.customMoTa,_that.customTrangThai);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TripModel implements TripModel {
  const _TripModel({required this.name, required this.customTenKhach, required this.customSdt, this.customTtk, required this.customTenDiemDon, required this.customTenDiemDen, required this.customMoTa, required this.customTrangThai});
  factory _TripModel.fromJson(Map<String, dynamic> json) => _$TripModelFromJson(json);

@override final  int name;
@override final  String customTenKhach;
@override final  String customSdt;
@override final  String? customTtk;
@override final  String customTenDiemDon;
@override final  String customTenDiemDen;
@override final  String customMoTa;
@override final  String customTrangThai;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripModel&&(identical(other.name, name) || other.name == name)&&(identical(other.customTenKhach, customTenKhach) || other.customTenKhach == customTenKhach)&&(identical(other.customSdt, customSdt) || other.customSdt == customSdt)&&(identical(other.customTtk, customTtk) || other.customTtk == customTtk)&&(identical(other.customTenDiemDon, customTenDiemDon) || other.customTenDiemDon == customTenDiemDon)&&(identical(other.customTenDiemDen, customTenDiemDen) || other.customTenDiemDen == customTenDiemDen)&&(identical(other.customMoTa, customMoTa) || other.customMoTa == customMoTa)&&(identical(other.customTrangThai, customTrangThai) || other.customTrangThai == customTrangThai));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,customTenKhach,customSdt,customTtk,customTenDiemDon,customTenDiemDen,customMoTa,customTrangThai);

@override
String toString() {
  return 'TripModel(name: $name, customTenKhach: $customTenKhach, customSdt: $customSdt, customTtk: $customTtk, customTenDiemDon: $customTenDiemDon, customTenDiemDen: $customTenDiemDen, customMoTa: $customMoTa, customTrangThai: $customTrangThai)';
}


}

/// @nodoc
abstract mixin class _$TripModelCopyWith<$Res> implements $TripModelCopyWith<$Res> {
  factory _$TripModelCopyWith(_TripModel value, $Res Function(_TripModel) _then) = __$TripModelCopyWithImpl;
@override @useResult
$Res call({
 int name, String customTenKhach, String customSdt, String? customTtk, String customTenDiemDon, String customTenDiemDen, String customMoTa, String customTrangThai
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? customTenKhach = null,Object? customSdt = null,Object? customTtk = freezed,Object? customTenDiemDon = null,Object? customTenDiemDen = null,Object? customMoTa = null,Object? customTrangThai = null,}) {
  return _then(_TripModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as int,customTenKhach: null == customTenKhach ? _self.customTenKhach : customTenKhach // ignore: cast_nullable_to_non_nullable
as String,customSdt: null == customSdt ? _self.customSdt : customSdt // ignore: cast_nullable_to_non_nullable
as String,customTtk: freezed == customTtk ? _self.customTtk : customTtk // ignore: cast_nullable_to_non_nullable
as String?,customTenDiemDon: null == customTenDiemDon ? _self.customTenDiemDon : customTenDiemDon // ignore: cast_nullable_to_non_nullable
as String,customTenDiemDen: null == customTenDiemDen ? _self.customTenDiemDen : customTenDiemDen // ignore: cast_nullable_to_non_nullable
as String,customMoTa: null == customMoTa ? _self.customMoTa : customMoTa // ignore: cast_nullable_to_non_nullable
as String,customTrangThai: null == customTrangThai ? _self.customTrangThai : customTrangThai // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
