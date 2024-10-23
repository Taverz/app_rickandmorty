import 'package:app_rickandmorty/src/common/dependence/global_data.dart';
import 'package:app_rickandmorty/src/common/dependence/service_locator.dart';
import 'package:app_rickandmorty/src/common/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit_app/ui_kit_app.dart';
import 'package:core_app/core_app.dart';

class AppInit extends StatelessWidget {
  const AppInit({
    required this.envManager,
    required this.globalData,
    super.key,
  });
  final GlobalData globalData;
  final EnvManager envManager;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: envManager.stateStream,
      builder: (context, _) {
        final state = envManager.currentState;
        final navigatorApp = GlobalData.appRouter;
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: ServiceLocatorApp(
            globalData: globalData,
            child: MaterialApp(
              themeMode: state.themeMode,
              locale: state.locale.get,
              theme: createWhiteTheme(),
              darkTheme: createWhiteTheme(),
              navigatorKey: navigatorApp.navigatorKey,
              onGenerateRoute: (settings) {
                return navigatorApp.createRoute(
                  settings.name!,
                  argument: settings.arguments,
                );
              },
              navigatorObservers: [
                MyNavigatorObserver(),
              ],
              initialRoute: AppRoutes.run_aoo,
            ),
          ),
        );
      },
    );
  }
}
