import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:submeowsions/models/theme_model.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeData build() {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
        brightness: Brightness.dark,
        dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
      ),
    );
  }

  void set({Color? seedColor, Brightness? brightness, DynamicSchemeVariant? dynamicSchemeVariant}) {
    state = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness ?? state.brightness,
        seedColor: seedColor ?? Colors.orange,
        dynamicSchemeVariant: dynamicSchemeVariant ?? DynamicSchemeVariant.tonalSpot,
      ),
    );
  }

  void toggleBrightness() => set(brightness: state.brightness == Brightness.light ? Brightness.dark : Brightness.light);
  // state = state.copyWith(brightness: state.brightness == Brightness.light ? Brightness.dark : Brightness.light);
}
