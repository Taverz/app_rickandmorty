import 'package:app_rickandmorty/src/common/dependence/global_data.dart';
import 'package:flutter/cupertino.dart';

class ServiceLocatorApp extends InheritedWidget {
  final GlobalData globalData;

  const ServiceLocatorApp({
    required this.globalData,
    required super.child,
    super.key,
  });

  static GlobalData exemplar(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ServiceLocatorApp>()!.globalData;
  }

  @override
  bool updateShouldNotify(ServiceLocatorApp oldWidget) =>
      globalData != oldWidget.globalData;
}
