import 'package:app_rickandmorty/src/app_init.dart';
import 'package:app_rickandmorty/src/common/dependence/global_data.dart';
import 'package:app_rickandmorty/src/common/screen_launch_app.dart';
import 'package:app_rickandmorty/src/feature/launch_app/launch_app.dart';
import 'package:app_runner/app_runner.dart';
import 'package:core_app/core_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  final widgetConfiguration = WidgetConfiguration(
    child: AppBuilder<List>(
      preInitialize: (WidgetsBinding binding) async {
        WidgetsFlutterBinding.ensureInitialized();

        final envManager = EnvManager();
        final globalData = GlobalData();

        await Future.value([
          globalData.init(),
          envManager.onStart(),
        ]).timeout(const Duration(seconds: 30));

        return [
          envManager,
          globalData,
        ];
      },
      builder: (
        BuildContext context,
        AsyncSnapshot<List?> snapshot,
        Widget? child,
      ) {
        late final Widget child;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            child = const LaunchApp(); // show Splash
            continue display;
          case ConnectionState.done:
            final data = snapshot.data; // data from preInitialize
            if (data == null) {
              child = const LaunchApp(
                  // text: 'Error launch config app',
                  );
              continue display;
            }
            child = AppInit(
              envManager: data[0] as EnvManager,
              globalData: data[1] as GlobalData,
            );
            continue display;
          // ignore: no_default_cases
          display:
          default:
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: child,
            );
        }
      },
    ),
    errorBuilder: (BuildContext context, FlutterErrorDetails errorDetails) =>
        MyErrorScreen(
      errorMessage: FlutterErrorDetails(
        exception: Exception('Error run app'),
      ),
    ).createRenderObject(
      context,
    ),
    releaseErrorBuilder: (BuildContext context) => MyErrorScreen(
      errorMessage: FlutterErrorDetails(
        exception: Exception('Error run app'),
      ),
    ).createRenderObject(context),
    onFlutterError: (FlutterErrorDetails errorDetails) async {
      FlutterError.dumpErrorToConsole(errorDetails);
    },
    // ignore: unnecessary_lambdas
    initializeBinding: () => CustomWidgetsFlutterBinding(),
  );

  final zoneConfiguration = ZoneConfiguration(
    onZoneError: (Object error, StackTrace stackTrace) async {},
    // zoneValues: ..., // Your zone parameters
    // zoneSpecification: ..., // Your zone specifications
  );

  appRunner(
    kIsWeb
        ? RunnerConfiguration(
            widgetConfig: widgetConfiguration,
            onPlatformError: (Object exception, StackTrace stackTrace) {
              return false;
            },
          )
        : RunnerConfiguration.guarded(
            widgetConfig: widgetConfiguration,
            zoneConfig: zoneConfiguration,
          ),
  );
}
