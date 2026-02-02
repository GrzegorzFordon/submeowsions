import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:submeowsions/providers/theme_provider.dart';
import 'package:window_manager/window_manager.dart';

class MainScreen extends HookConsumerWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    var tabController = useTabController(initialLength: 3);

    PieTheme pieTheme = PieTheme(
      overlayColor: Colors.transparent,
      angleOffset: 120,
      customAngleDiff: 72,
      radius: 35,
      buttonTheme: PieButtonTheme(
        backgroundColor: themeData.colorScheme.secondaryContainer,
        iconColor: themeData.colorScheme.onSecondaryContainer,
        decoration: null,
      ),
      buttonThemeHovered: PieButtonTheme(
        backgroundColor: themeData.colorScheme.secondaryContainer,
        iconColor: themeData.colorScheme.onSecondaryContainer,
        decoration: null,
      ),
      childBounceEnabled: false,
      regularPressShowsMenu: true,
      pieBounceDuration: Duration(milliseconds: 150),
      menuAlignment: Alignment.center,
      customAngleAnchor: PieAnchor.center,
      buttonSize: 38,
    );

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: DragToMoveArea(child: Text("Submeowsions")),
        // centerTitle: true,
        titleTextStyle: GoogleFonts.ebGaramond(fontSize: 46, color: themeData.colorScheme.primary),
        actions: [
          SystemButton(
            hoverColor: themeData.colorScheme.primary,
            icon: Icons.remove_rounded,
            callback: () => windowManager.minimize(),
          ),
          SystemButton(hoverColor: themeData.colorScheme.primary, icon: Icons.close_rounded, callback: () => exit(0)),
        ],
        bottom: TabBar(
          onTap: (value) {
            switch (value) {
              case 0:
                context.go("/search");
              case 1:
                context.go("/list");
              case 2:
                context.go("/stats");
            }
            ;
          },
          controller: tabController,
          tabs: [
            Tab(child: Text("Search")),
            Tab(child: Text("List")),
            Tab(child: Text("Stats")),
          ],
        ),
      ),
      body: PieCanvas(
        theme: pieTheme,
        child: Stack(
          children: [
            // Image.asset(
            //         "assets/grunge1.jpg",
            //         opacity: AlwaysStoppedAnimation(0.15),
            //         scale: 0.1,
            //         fit: BoxFit.contain,
            //         repeat: ImageRepeat.repeat,
            //         height: double.infinity,
            //         width: double.infinity,
            //       ),
            child,
            Align(
              alignment: Alignment.bottomCenter,
              child: ResizeWidget(themeData: themeData),
            ),
          ],
        ),
      ),
    );
  }
}

class SystemButton extends HookWidget {
  final IconData icon;
  final VoidCallback callback;
  final Color hoverColor;
  const SystemButton({super.key, required this.hoverColor, required this.icon, required this.callback});

  @override
  Widget build(BuildContext context) {
    var isHover = useState<bool>(false);

    return AnimatedRotation(
      duration: Duration(milliseconds: 150),
      turns: isHover.value ? 0.05 : 0,
      child: IconButton(
        hoverColor: Colors.transparent,
        onPressed: callback,
        icon: Icon(icon, color: isHover.value ? hoverColor : Colors.grey),
        onHover: (value) => isHover.value = value,
      ),
    );
  }
}

class ResizeWidget extends StatelessWidget {
  final ThemeData themeData;

  const ResizeWidget({super.key, required this.themeData});
  @override
  Widget build(BuildContext context) {
    return DragToResizeArea(
      enableResizeEdges: [ResizeEdge.bottomRight],
      resizeEdgeSize: 30,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.all(4.0),
          width: 20,
          height: 20,
          child: Image.asset(
            "assets/corner_resize.png",
            color: themeData.colorScheme.secondaryContainer.withAlpha(150),
          ),
        ),
      ),
    );
  }
}
