// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmissionModel {

 int? get id; int get workId; int get publisherId; SubmissionStatus get status; DateTime get submissionDate;
/// Create a copy of SubmissionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionModelCopyWith<SubmissionModel> get copyWith => _$SubmissionModelCopyWithImpl<SubmissionModel>(this as SubmissionModel, _$identity);

  /// Serializes this SubmissionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workId, workId) || other.workId == workId)&&(identical(other.publisherId, publisherId) || other.publisherId == publisherId)&&(identical(other.status, status) || other.status == status)&&(identical(other.submissionDate, submissionDate) || other.submissionDate == submissionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workId,publisherId,status,submissionDate);

@override
String toString() {
  return 'SubmissionModel(id: $id, workId: $workId, publisherId: $publisherId, status: $status, submissionDate: $submissionDate)';
}


}

/// @nodoc
abstract mixin class $SubmissionModelCopyWith<$Res>  {
  factory $SubmissionModelCopyWith(SubmissionModel value, $Res Function(SubmissionModel) _then) = _$SubmissionModelCopyWithImpl;
@useResult
$Res call({
 int? id, int workId, int publisherId, SubmissionStatus status, DateTime submissionDate
});




}
/// @nodoc
class _$SubmissionModelCopyWithImpl<$Res>
    implements $SubmissionModelCopyWith<$Res> {
  _$SubmissionModelCopyWithImpl(this._self, this._then);

  final SubmissionModel _self;
  final $Res Function(SubmissionModel) _then;

/// Create a copy of SubmissionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? workId = null,Object? publisherId = null,Object? status = null,Object? submissionDate = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,workId: null == workId ? _self.workId : workId // ignore: cast_nullable_to_non_nullable
as int,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,submissionDate: null == submissionDate ? _self.submissionDate : submissionDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionModel].
extension SubmissionModelPatterns on SubmissionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionModel value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int workId,  int publisherId,  SubmissionStatus status,  DateTime submissionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionModel() when $default != null:
return $default(_that.id,_that.workId,_that.publisherId,_that.status,_that.submissionDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int workId,  int publisherId,  SubmissionStatus status,  DateTime submissionDate)  $default,) {final _that = this;
switch (_that) {
case _SubmissionModel():
return $default(_that.id,_that.workId,_that.publisherId,_that.status,_that.submissionDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int workId,  int publisherId,  SubmissionStatus status,  DateTime submissionDate)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionModel() when $default != null:
return $default(_that.id,_that.workId,_that.publisherId,_that.status,_that.submissionDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmissionModel implements SubmissionModel {
  const _SubmissionModel({this.id, required this.workId, required this.publisherId, this.status = SubmissionStatus.pending, required this.submissionDate});
  factory _SubmissionModel.fromJson(Map<String, dynamic> json) => _$SubmissionModelFromJson(json);

@override final  int? id;
@override final  int workId;
@override final  int publisherId;
@override@JsonKey() final  SubmissionStatus status;
@override final  DateTime submissionDate;

/// Create a copy of SubmissionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionModelCopyWith<_SubmissionModel> get copyWith => __$SubmissionModelCopyWithImpl<_SubmissionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workId, workId) || other.workId == workId)&&(identical(other.publisherId, publisherId) || other.publisherId == publisherId)&&(identical(other.status, status) || other.status == status)&&(identical(other.submissionDate, submissionDate) || other.submissionDate == submissionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workId,publisherId,status,submissionDate);

@override
String toString() {
  return 'SubmissionModel(id: $id, workId: $workId, publisherId: $publisherId, status: $status, submissionDate: $submissionDate)';
}


}

/// @nodoc
abstract mixin class _$SubmissionModelCopyWith<$Res> implements $SubmissionModelCopyWith<$Res> {
  factory _$SubmissionModelCopyWith(_SubmissionModel value, $Res Function(_SubmissionModel) _then) = __$SubmissionModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int workId, int publisherId, SubmissionStatus status, DateTime submissionDate
});




}
/// @nodoc
class __$SubmissionModelCopyWithImpl<$Res>
    implements _$SubmissionModelCopyWith<$Res> {
  __$SubmissionModelCopyWithImpl(this._self, this._then);

  final _SubmissionModel _self;
  final $Res Function(_SubmissionModel) _then;

/// Create a copy of SubmissionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? workId = null,Object? publisherId = null,Object? status = null,Object? submissionDate = null,}) {
  return _then(_SubmissionModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,workId: null == workId ? _self.workId : workId // ignore: cast_nullable_to_non_nullable
as int,publisherId: null == publisherId ? _self.publisherId : publisherId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,submissionDate: null == submissionDate ? _self.submissionDate : submissionDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
