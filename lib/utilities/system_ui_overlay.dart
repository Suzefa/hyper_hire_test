import 'package:flutter/services.dart';

import 'color_manager.dart';

class SystemUiOverlay {
  SystemUiOverlay._();

  static void changeUiOverLay() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: ColorManager.kTransparentColor,
        systemNavigationBarDividerColor: ColorManager.kTransparentColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: ColorManager.kTransparentColor,
      ),
    );  }
}