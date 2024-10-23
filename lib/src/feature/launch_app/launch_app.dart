import 'package:app_rickandmorty/src/common/dependence/global_data.dart';
import 'package:flutter/material.dart';

class LaunchApp extends StatelessWidget {
  const LaunchApp({super.key});

  Future<void> loadAppRun(BuildContext context) async {
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));
    // ignore: inference_failure_on_function_invocation, use_build_context_synchronously
    // await ServiceLocatorApp.exemplar(context)
    // ignore: inference_failure_on_function_invocation
    GlobalData.appRouter.pushNamedReplacement('/characters_list');
  }

  @override
  Widget build(BuildContext context) {
    loadAppRun(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SplashScreenApp extends StatelessWidget {
  final String? errorMessage;
  const SplashScreenApp({
    this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: errorMessage != null
          ? Text(
              errorMessage!,
              style: const TextStyle(color: Colors.black),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
