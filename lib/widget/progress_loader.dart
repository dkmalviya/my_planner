import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';

class ProgressLoader {
  static void show(BuildContext context) {
    Loader.show(context,
        isSafeAreaOverlay: true,
        isAppbarOverlay: true,
        isBottomBarOverlay: true,
        progressIndicator: const CircularProgressIndicator(
          backgroundColor: Colors.grey,
        ),
        themeData: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: HouseTheme.textTheme,
          platform: TargetPlatform.iOS,
        ),
        overlayColor: const Color(0x99E8EAF6));
  }

  static void hide() {
    Loader.hide();
  }
}
