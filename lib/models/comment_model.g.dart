// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: (json['id'] as num).toInt(),
      body: json['body'] as String,
      type: $enumDecode(_$TypeEnumMap, json['type']),
      parentID: (json['parentID'] as num).toInt(),
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'type': _$TypeEnumMap[instance.type]!,
      'parentID': instance.parentID,
    };

const _$TypeEnumMap = {Type.work: 'work', Type.publisher: 'publisher'};
