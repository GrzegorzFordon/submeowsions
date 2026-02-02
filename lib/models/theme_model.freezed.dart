// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeModel {

 Color get seed; Brightness get brightness; DynamicSchemeVariant get dynamicSchemeVariant;
/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<ThemeModel> get copyWith => _$ThemeModelCopyWithImpl<ThemeModel>(this as ThemeModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeModel&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.dynamicSchemeVariant, dynamicSchemeVariant) || other.dynamicSchemeVariant == dynamicSchemeVariant));
}


@override
int get hashCode => Object.hash(runtimeType,seed,brightness,dynamicSchemeVariant);

@override
String toString() {
  return 'ThemeModel(seed: $seed, brightness: $brightness, dynamicSchemeVariant: $dynamicSchemeVariant)';
}


}

/// @nodoc
abstract mixin class $ThemeModelCopyWith<$Res>  {
  factory $ThemeModelCopyWith(ThemeModel value, $Res Function(ThemeModel) _then) = _$ThemeModelCopyWithImpl;
@useResult
$Res call({
 Color seed, Brightness brightness, DynamicSchemeVariant dynamicSchemeVariant
});




}
/// @nodoc
class _$ThemeModelCopyWithImpl<$Res>
    implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._self, this._then);

  final ThemeModel _self;
  final $Res Function(ThemeModel) _then;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seed = null,Object? brightness = null,Object? dynamicSchemeVariant = null,}) {
  return _then(_self.copyWith(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Color,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,dynamicSchemeVariant: null == dynamicSchemeVariant ? _self.dynamicSchemeVariant : dynamicSchemeVariant // ignore: cast_nullable_to_non_nullable
as DynamicSchemeVariant,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeModel].
extension ThemeModelPatterns on ThemeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeModel value)  $default,){
final _that = this;
switch (_that) {
case _ThemeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color seed,  Brightness brightness,  DynamicSchemeVariant dynamicSchemeVariant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
return $default(_that.seed,_that.brightness,_that.dynamicSchemeVariant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color seed,  Brightness brightness,  DynamicSchemeVariant dynamicSchemeVariant)  $default,) {final _that = this;
switch (_that) {
case _ThemeModel():
return $default(_that.seed,_that.brightness,_that.dynamicSchemeVariant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color seed,  Brightness brightness,  DynamicSchemeVariant dynamicSchemeVariant)?  $default,) {final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
return $default(_that.seed,_that.brightness,_that.dynamicSchemeVariant);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeModel implements ThemeModel {
  const _ThemeModel({this.seed = Colors.orange, this.brightness = Brightness.dark, this.dynamicSchemeVariant = DynamicSchemeVariant.tonalSpot});
  

@override@JsonKey() final  Color seed;
@override@JsonKey() final  Brightness brightness;
@override@JsonKey() final  DynamicSchemeVariant dynamicSchemeVariant;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeModelCopyWith<_ThemeModel> get copyWith => __$ThemeModelCopyWithImpl<_ThemeModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeModel&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.dynamicSchemeVariant, dynamicSchemeVariant) || other.dynamicSchemeVariant == dynamicSchemeVariant));
}


@override
int get hashCode => Object.hash(runtimeType,seed,brightness,dynamicSchemeVariant);

@override
String toString() {
  return 'ThemeModel(seed: $seed, brightness: $brightness, dynamicSchemeVariant: $dynamicSchemeVariant)';
}


}

/// @nodoc
abstract mixin class _$ThemeModelCopyWith<$Res> implements $ThemeModelCopyWith<$Res> {
  factory _$ThemeModelCopyWith(_ThemeModel value, $Res Function(_ThemeModel) _then) = __$ThemeModelCopyWithImpl;
@override @useResult
$Res call({
 Color seed, Brightness brightness, DynamicSchemeVariant dynamicSchemeVariant
});




}
/// @nodoc
class __$ThemeModelCopyWithImpl<$Res>
    implements _$ThemeModelCopyWith<$Res> {
  __$ThemeModelCopyWithImpl(this._self, this._then);

  final _ThemeModel _self;
  final $Res Function(_ThemeModel) _then;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seed = null,Object? brightness = null,Object? dynamicSchemeVariant = null,}) {
  return _then(_ThemeModel(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Color,brightness: null == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness,dynamicSchemeVariant: null == dynamicSchemeVariant ? _self.dynamicSchemeVariant : dynamicSchemeVariant // ignore: cast_nullable_to_non_nullable
as DynamicSchemeVariant,
  ));
}


}

// dart format on
