import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:submeowsions/providers/theme_provider.dart';

class ThemeBrightnessToggle extends ConsumerWidget {
  const ThemeBrightnessToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    IconData iconData = themeData.brightness == Brightness.light
        ? Symbols.light_mode_rounded
        : Symbols.dark_mode_rounded;
    return IconButton(onPressed: () => ref.watch(themeProvider.notifier).toggleBrightness(), icon: Icon(iconData));
  }
}
