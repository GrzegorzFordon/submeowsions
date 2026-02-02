import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_model.freezed.dart';

@freezed
abstract class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    @Default(Colors.orange) Color seed,
    @Default(Brightness.dark) Brightness brightness,
    @Default(DynamicSchemeVariant.tonalSpot)
    DynamicSchemeVariant dynamicSchemeVariant,
  }) = _ThemeModel;


}
