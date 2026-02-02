import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submeowsions/providers/theme_provider.dart';
import 'package:submeowsions/router.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final Offset windowPos = Offset(
    prefs.getDouble("windowPosX") ?? 0,
    prefs.getDouble("windowPosY") ?? 0,
  );
  WindowOptions windowOptions = WindowOptions(
    size: Size(400, 500),
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
    minimumSize: Size(400, 500),
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setPosition(windowPos);
    await windowManager.setAsFrameless();
    await windowManager.show();
    await windowManager.focus();
  });
  CustomMouseCursor customMouseCursor = await CustomMouseCursor.asset(
    "assets/paw_cursor.png",
    hotX: 5,
    hotY: 5,
    nativeDevicePixelRatio: 3,
  );
  runApp(ProviderScope(child: MainApp(customMouseCursor: customMouseCursor)));
}

class MainApp extends ConsumerWidget with WindowListener {
  final CustomMouseCursor customMouseCursor;

  MainApp({super.key, required this.customMouseCursor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var wm = WindowManager.instance;
    wm.addListener(this);

    ThemeData themeData = ref.watch(themeProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: MaterialApp.router(
        routerConfig: router,
        theme: themeData,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  @override
  Future<void> onWindowMoved() async {
    var pos = await WindowManager.instance.getPosition();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("windowPosX", pos.dx.toDouble());
    await prefs.setDouble("windowPosY", pos.dy.toDouble());
  }
}
