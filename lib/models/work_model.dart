import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_model.freezed.dart';
part 'work_model.g.dart';

@freezed
abstract class WorkModel with _$WorkModel {
  const WorkModel._();
  const factory WorkModel({
    int? id,
    @Default(WorkType.poem) WorkType type,
    @Default("") String title,
  }) = _WorkModel;

  factory WorkModel.fromJson(Map<String, dynamic> json) =>
      _$WorkModelFromJson(json);

  IconData getIcon() {
    switch (type) {
      case WorkType.poem:
        return Icons.history_edu;
      case WorkType.fiction:
        return Icons.book;
      case WorkType.nonfiction:
        return Icons.newspaper;
      case WorkType.visual:
        return Icons.brush;
      case WorkType.audio:
        return Icons.audio_file;
      case WorkType.hybrid:
        return Icons.blender;
    }
  }
}

enum WorkType { poem, fiction, nonfiction, visual, audio, hybrid }
