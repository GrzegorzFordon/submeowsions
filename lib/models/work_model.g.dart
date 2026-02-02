// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkModel _$WorkModelFromJson(Map<String, dynamic> json) => _WorkModel(
  id: (json['id'] as num?)?.toInt(),
  type: $enumDecodeNullable(_$WorkTypeEnumMap, json['type']) ?? WorkType.poem,
  title: json['title'] as String? ?? "",
);

Map<String, dynamic> _$WorkModelToJson(_WorkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$WorkTypeEnumMap[instance.type]!,
      'title': instance.title,
    };

const _$WorkTypeEnumMap = {
  WorkType.poem: 'poem',
  WorkType.fiction: 'fiction',
  WorkType.nonfiction: 'nonfiction',
  WorkType.visual: 'visual',
  WorkType.audio: 'audio',
  WorkType.hybrid: 'hybrid',
};
