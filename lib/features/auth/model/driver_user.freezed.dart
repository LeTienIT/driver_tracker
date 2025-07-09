// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverUser {

 String get email; int get id; String get name; String get sdt; String? get thongTinKhac;
/// Create a copy of DriverUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverUserCopyWith<DriverUser> get copyWith => _$DriverUserCopyWithImpl<DriverUser>(this as DriverUser, _$identity);

  /// Serializes this DriverUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverUser&&(identical(other.email, email) || other.email == email)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sdt, sdt) || other.sdt == sdt)&&(identical(other.thongTinKhac, thongTinKhac) || other.thongTinKhac == thongTinKhac));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,id,name,sdt,thongTinKhac);

@override
String toString() {
  return 'DriverUser(email: $email, id: $id, name: $name, sdt: $sdt, thongTinKhac: $thongTinKhac)';
}


}

/// @nodoc
abstract mixin class $DriverUserCopyWith<$Res>  {
  factory $DriverUserCopyWith(DriverUser value, $Res Function(DriverUser) _then) = _$DriverUserCopyWithImpl;
@useResult
$Res call({
 String email, int id, String name, String sdt, String? thongTinKhac
});




}
/// @nodoc
class _$DriverUserCopyWithImpl<$Res>
    implements $DriverUserCopyWith<$Res> {
  _$DriverUserCopyWithImpl(this._self, this._then);

  final DriverUser _self;
  final $Res Function(DriverUser) _then;

/// Create a copy of DriverUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? id = null,Object? name = null,Object? sdt = null,Object? thongTinKhac = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sdt: null == sdt ? _self.sdt : sdt // ignore: cast_nullable_to_non_nullable
as String,thongTinKhac: freezed == thongTinKhac ? _self.thongTinKhac : thongTinKhac // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverUser].
extension DriverUserPatterns on DriverUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverUser value)  $default,){
final _that = this;
switch (_that) {
case _DriverUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverUser value)?  $default,){
final _that = this;
switch (_that) {
case _DriverUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  int id,  String name,  String sdt,  String? thongTinKhac)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverUser() when $default != null:
return $default(_that.email,_that.id,_that.name,_that.sdt,_that.thongTinKhac);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  int id,  String name,  String sdt,  String? thongTinKhac)  $default,) {final _that = this;
switch (_that) {
case _DriverUser():
return $default(_that.email,_that.id,_that.name,_that.sdt,_that.thongTinKhac);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  int id,  String name,  String sdt,  String? thongTinKhac)?  $default,) {final _that = this;
switch (_that) {
case _DriverUser() when $default != null:
return $default(_that.email,_that.id,_that.name,_that.sdt,_that.thongTinKhac);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverUser implements DriverUser {
  const _DriverUser({required this.email, required this.id, required this.name, required this.sdt, this.thongTinKhac});
  factory _DriverUser.fromJson(Map<String, dynamic> json) => _$DriverUserFromJson(json);

@override final  String email;
@override final  int id;
@override final  String name;
@override final  String sdt;
@override final  String? thongTinKhac;

/// Create a copy of DriverUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverUserCopyWith<_DriverUser> get copyWith => __$DriverUserCopyWithImpl<_DriverUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverUser&&(identical(other.email, email) || other.email == email)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sdt, sdt) || other.sdt == sdt)&&(identical(other.thongTinKhac, thongTinKhac) || other.thongTinKhac == thongTinKhac));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,id,name,sdt,thongTinKhac);

@override
String toString() {
  return 'DriverUser(email: $email, id: $id, name: $name, sdt: $sdt, thongTinKhac: $thongTinKhac)';
}


}

/// @nodoc
abstract mixin class _$DriverUserCopyWith<$Res> implements $DriverUserCopyWith<$Res> {
  factory _$DriverUserCopyWith(_DriverUser value, $Res Function(_DriverUser) _then) = __$DriverUserCopyWithImpl;
@override @useResult
$Res call({
 String email, int id, String name, String sdt, String? thongTinKhac
});




}
/// @nodoc
class __$DriverUserCopyWithImpl<$Res>
    implements _$DriverUserCopyWith<$Res> {
  __$DriverUserCopyWithImpl(this._self, this._then);

  final _DriverUser _self;
  final $Res Function(_DriverUser) _then;

/// Create a copy of DriverUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? id = null,Object? name = null,Object? sdt = null,Object? thongTinKhac = freezed,}) {
  return _then(_DriverUser(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sdt: null == sdt ? _self.sdt : sdt // ignore: cast_nullable_to_non_nullable
as String,thongTinKhac: freezed == thongTinKhac ? _self.thongTinKhac : thongTinKhac // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
