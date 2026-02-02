// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:submeowsions/models/theme_model.dart';

// part 'theme_data_provider.g.dart';

// @riverpod
// class ThemeData extends _$ThemeData {
//   @override
//   ThemeModel build() {
//     return ThemeModel();
//   }

//   void update({
//     Color? seed,
//     Brightness? brightness,
//     DynamicSchemeVariant? dynamicSchemeVariant,
//   }) {
//     state = state.copyWith(
//       brightness: brightness ?? state.brightness,
//       seed: seed ?? state.seed,
//       dynamicSchemeVariant: dynamicSchemeVariant ?? state.dynamicSchemeVariant,
//     );
//   }
// }
