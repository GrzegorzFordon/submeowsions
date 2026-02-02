import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_model.freezed.dart';
part 'submission_model.g.dart';

@freezed
abstract class SubmissionModel with _$SubmissionModel {
  const factory SubmissionModel({
    int? id,
    required int workId,
    required int publisherId,
    @Default(SubmissionStatus.pending) SubmissionStatus status,
    required DateTime submissionDate,
  }) = _SubmissionModel;

  factory SubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionModelFromJson(json);
}

enum SubmissionStatus { pending, rejected, withdrawn, accepted }
