import 'package:app_rickandmorty/src/common/router/app_router.dart';

class GlobalData {
  late AppRouterCustom appRouter;
  Future<void> init() async {
    appRouter = AppRouterCustom();
  }
}
