import 'package:flutter/material.dart';

class AppConfigService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?>? pushNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  static Future<T?>? offNamed<T>(
    String route, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  static void back<T>({
    T? result,
  }) {
    navigatorKey.currentState?.pop(result);
  }

  static Future<T?>? offAllNamed<T>(
    String route, {
    RoutePredicate? predicate,
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      route,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static void successSnackBar(String message) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        elevation: 0.0,
        margin: const EdgeInsets.all(20),
        backgroundColor: hexToColor("#494FB1"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void errorSnackBar(String message, {int? duration}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        elevation: 0.0,
        margin: const EdgeInsets.all(20),
        backgroundColor: hexToColor("#ea001e"),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
