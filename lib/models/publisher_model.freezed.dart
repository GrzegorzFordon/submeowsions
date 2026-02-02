// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publisher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublisherModel {

 int? get id; String get title;
/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublisherModelCopyWith<PublisherModel> get copyWith => _$PublisherModelCopyWithImpl<PublisherModel>(this as PublisherModel, _$identity);

  /// Serializes this PublisherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublisherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'PublisherModel(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $PublisherModelCopyWith<$Res>  {
  factory $PublisherModelCopyWith(PublisherModel value, $Res Function(PublisherModel) _then) = _$PublisherModelCopyWithImpl;
@useResult
$Res call({
 int? id, String title
});




}
/// @nodoc
class _$PublisherModelCopyWithImpl<$Res>
    implements $PublisherModelCopyWith<$Res> {
  _$PublisherModelCopyWithImpl(this._self, this._then);

  final PublisherModel _self;
  final $Res Function(PublisherModel) _then;

/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PublisherModel].
extension PublisherModelPatterns on PublisherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublisherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublisherModel value)  $default,){
final _that = this;
switch (_that) {
case _PublisherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublisherModel value)?  $default,){
final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String title)  $default,) {final _that = this;
switch (_that) {
case _PublisherModel():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String title)?  $default,) {final _that = this;
switch (_that) {
case _PublisherModel() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublisherModel implements PublisherModel {
  const _PublisherModel({this.id, this.title = ""});
  factory _PublisherModel.fromJson(Map<String, dynamic> json) => _$PublisherModelFromJson(json);

@override final  int? id;
@override@JsonKey() final  String title;

/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublisherModelCopyWith<_PublisherModel> get copyWith => __$PublisherModelCopyWithImpl<_PublisherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublisherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublisherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'PublisherModel(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$PublisherModelCopyWith<$Res> implements $PublisherModelCopyWith<$Res> {
  factory _$PublisherModelCopyWith(_PublisherModel value, $Res Function(_PublisherModel) _then) = __$PublisherModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title
});




}
/// @nodoc
class __$PublisherModelCopyWithImpl<$Res>
    implements _$PublisherModelCopyWith<$Res> {
  __$PublisherModelCopyWithImpl(this._self, this._then);

  final _PublisherModel _self;
  final $Res Function(_PublisherModel) _then;

/// Create a copy of PublisherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,}) {
  return _then(_PublisherModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
