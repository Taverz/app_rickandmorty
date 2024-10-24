import 'package:app_rickandmorty/src/feature/character_info/character_info_page.dart';
import 'package:app_rickandmorty/src/feature/characters_list/characters_list_page.dart';
import 'package:app_rickandmorty/src/feature/launch_app/launch_app.dart';
import 'package:flutter/material.dart';


class AppRouterCustom {
  final _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<T?>? pushNamed<T>(String routeName, {Object? argument}) {
    return _navigatorKey.currentState?.push(
      createRoute(routeName, argument: argument),
    );
  }

  Future<T?>? pushNamedReplacement<T>(String routeName, {Object? argument}) {
    return _navigatorKey.currentState?.pushReplacement(
      createRoute(routeName, argument: argument),
    );
  }

  Future<T?>? pushNamedAndRemoveUntil<T>(
    String routeName,
    RoutePredicate predicate, {
    Object? argument,
  }) {
    return _navigatorKey.currentState?.pushAndRemoveUntil(
      createRoute(routeName, argument: argument),
      predicate,
    );
  }

  void pop<T>({T? result}) {
    _navigatorKey.currentState?.pop(result);
  }

  void popUntil(RoutePredicate predicate) {
    _navigatorKey.currentState?.popUntil(predicate);
  }



  Route<T> createRoute<T>(String routeName, {Object? argument}) {
    return PageRouteBuilder<T>(
      settings: RouteSettings(
        name: routeName,
        arguments: argument,
      ),
      pageBuilder: (context, animation, secondaryAnimation) {
        return AppRoutes.getScreen(routeName);
      },
      transitionsBuilder: _slideTransition,
    );
  }

  Widget _slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1, 0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

}

class AppRoutes {
  static const String run_aoo = 'launch_app';
  static const String characters_list = 'characters_list';
  static const String character_description = 'character_description';

  static final Map<String, Route Function(RouteSettings rs)> routes = {
    AppRoutes.run_aoo: (rs) => AppLaunchRoute(),
    AppRoutes.characters_list: (rs) => CharacterListRoute(),
    AppRoutes.character_description: (rs) => CharacterInfoRoute(),
  };

  static Widget getScreen(String routeName) {
    switch (routeName) {
      case '/launch_app':
        return const LaunchApp();
      case '/characters_list':
        return const CharactersListPage();
      case '/character_description':
        return const CharacterInfoPage();
      default:
        return const LaunchApp();
    }
  }
}

class AppLaunchRoute extends MaterialPageRoute {
  AppLaunchRoute() : super(builder: (context) => const LaunchApp());
}

class CharacterListRoute extends MaterialPageRoute {
  CharacterListRoute() : super(builder: (context) => const CharactersListPage());
}
class CharacterInfoRoute extends MaterialPageRoute {
  CharacterInfoRoute() : super(builder: (context) => const CharacterInfoPage());
}

class MyNavigatorObserver extends NavigatorObserver {}
