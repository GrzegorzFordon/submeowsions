// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:submeowsions/models/theme_model.dart';
// import 'package:submeowsions/providers/theme_data_provider.dart';
// import 'package:submeowsions/providers/theme_provider.dart';

// class ThemeVariantPickerWidget extends HookConsumerWidget {
//   ThemeVariantPickerWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ThemeModel themeModel = ref.watch(themeDataProvider);
//     return SizedBox(
//       height: 50,
//       width: 200,
//       child: DropdownButton(
//         value: themeModel.dynamicSchemeVariant,
//         menuMaxHeight: 200,
//         items: DynamicSchemeVariant.values
//             .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
//             .toList(),
//         onChanged: (value) {
//           ref
//               .read(themeDataProvider.notifier)
//               .update(dynamicSchemeVariant: value);
//         },
//       ),
//     );
//   }
// }

// class BrightnessToggle extends HookConsumerWidget {
//   const BrightnessToggle({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text("Dark Mode:"),
//         Checkbox(
//           value: ref.watch(themeDataProvider).brightness == Brightness.dark,
//           onChanged: (value) {
//             ref
//                 .read(themeDataProvider.notifier)
//                 .update(
//                   brightness:
//                       ref.watch(themeDataProvider).brightness ==
//                           Brightness.light
//                       ? Brightness.dark
//                       : Brightness.light,
//                 );
//           },
//         ),
//       ],
//     );
//   }
// }

// class ColorPickerWidget extends HookConsumerWidget {
//   const ColorPickerWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return SlidePicker(
//       enableAlpha: false,
//       colorModel: ColorModel.hsl,
//       // labelTypes: [],
//       pickerColor: ref.read(themeDataProvider).seed,
//       onColorChanged: (value) =>
//           ref.read(themeDataProvider.notifier).update(seed: value),
//     );
//   }
// }
