import 'package:flutter/material.dart';

class AppNavigator {
  static final AppNavigator _instance = AppNavigator._();

  AppNavigator._();

  static AppNavigator get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName) =>
      navigatorKey.currentState?.pushNamed(routeName);

  void removeUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }
}
