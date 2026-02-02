// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmissionModel _$SubmissionModelFromJson(Map<String, dynamic> json) =>
    _SubmissionModel(
      id: (json['id'] as num?)?.toInt(),
      workId: (json['workId'] as num).toInt(),
      publisherId: (json['publisherId'] as num).toInt(),
      status:
          $enumDecodeNullable(_$SubmissionStatusEnumMap, json['status']) ??
          SubmissionStatus.pending,
      submissionDate: DateTime.parse(json['submissionDate'] as String),
    );

Map<String, dynamic> _$SubmissionModelToJson(_SubmissionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workId': instance.workId,
      'publisherId': instance.publisherId,
      'status': _$SubmissionStatusEnumMap[instance.status]!,
      'submissionDate': instance.submissionDate.toIso8601String(),
    };

const _$SubmissionStatusEnumMap = {
  SubmissionStatus.pending: 'pending',
  SubmissionStatus.rejected: 'rejected',
  SubmissionStatus.withdrawn: 'withdrawn',
  SubmissionStatus.accepted: 'accepted',
};
