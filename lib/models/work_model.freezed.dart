// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkModel {

 int? get id; WorkType get type; String get title;
/// Create a copy of WorkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkModelCopyWith<WorkModel> get copyWith => _$WorkModelCopyWithImpl<WorkModel>(this as WorkModel, _$identity);

  /// Serializes this WorkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title);

@override
String toString() {
  return 'WorkModel(id: $id, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class $WorkModelCopyWith<$Res>  {
  factory $WorkModelCopyWith(WorkModel value, $Res Function(WorkModel) _then) = _$WorkModelCopyWithImpl;
@useResult
$Res call({
 int? id, WorkType type, String title
});




}
/// @nodoc
class _$WorkModelCopyWithImpl<$Res>
    implements $WorkModelCopyWith<$Res> {
  _$WorkModelCopyWithImpl(this._self, this._then);

  final WorkModel _self;
  final $Res Function(WorkModel) _then;

/// Create a copy of WorkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkModel].
extension WorkModelPatterns on WorkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  WorkType type,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkModel() when $default != null:
return $default(_that.id,_that.type,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  WorkType type,  String title)  $default,) {final _that = this;
switch (_that) {
case _WorkModel():
return $default(_that.id,_that.type,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  WorkType type,  String title)?  $default,) {final _that = this;
switch (_that) {
case _WorkModel() when $default != null:
return $default(_that.id,_that.type,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkModel extends WorkModel {
  const _WorkModel({this.id, this.type = WorkType.poem, this.title = ""}): super._();
  factory _WorkModel.fromJson(Map<String, dynamic> json) => _$WorkModelFromJson(json);

@override final  int? id;
@override@JsonKey() final  WorkType type;
@override@JsonKey() final  String title;

/// Create a copy of WorkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkModelCopyWith<_WorkModel> get copyWith => __$WorkModelCopyWithImpl<_WorkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title);

@override
String toString() {
  return 'WorkModel(id: $id, type: $type, title: $title)';
}


}

/// @nodoc
abstract mixin class _$WorkModelCopyWith<$Res> implements $WorkModelCopyWith<$Res> {
  factory _$WorkModelCopyWith(_WorkModel value, $Res Function(_WorkModel) _then) = __$WorkModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, WorkType type, String title
});




}
/// @nodoc
class __$WorkModelCopyWithImpl<$Res>
    implements _$WorkModelCopyWith<$Res> {
  __$WorkModelCopyWithImpl(this._self, this._then);

  final _WorkModel _self;
  final $Res Function(_WorkModel) _then;

/// Create a copy of WorkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? title = null,}) {
  return _then(_WorkModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
