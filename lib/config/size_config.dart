import 'package:flutter/material.dart';

import 'app_config.dart';

class SizeConfig {
  static BuildContext? appContext =
      AppConfigService.navigatorKey.currentContext;
  static MediaQueryData _mediaQueryData =
      MediaQuery.of(AppConfigService.navigatorKey.currentContext!);

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    appContext = context;
  }

  static double height(double height) {
    double screenHeight = _mediaQueryData.size.height / 100;
    return (height * screenHeight).round().toDouble();
  }

  static double width(double width) {
    double screenWidth = _mediaQueryData.size.width / 100;
    return (width * screenWidth).round().toDouble();
  }

  static double textSize(double textSize) {
    double screenWidth = _mediaQueryData.size.width / 100;
    return (textSize * screenWidth).round().toDouble();
  }
}
