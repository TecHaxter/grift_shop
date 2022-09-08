// import 'package:grift_shop/routes/route_arguments.dart';
import 'package:flutter/material.dart';
import 'package:grift_shop/routes/route_arguments.dart';
import 'package:grift_shop/views/splash/success_splash.dart';
import 'package:grift_shop/views/views.dart';

part 'auth_route.dart';
part 'home_route.dart';
part 'splash_route.dart';

class Routes {
  static String intro = SplashRoute.intro;
  static String currentRoute = HomeRoute.homeLeading;

  static final routes = <String>{
    currentRoute,
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    currentRoute = settings.name ?? '/';
    Widget child;
    print(currentRoute);
    if (currentRoute.startsWith(AuthRoute.authLeading)) {
      child = AuthRoute.getPage(currentRoute, args);
    } else if (currentRoute.startsWith(HomeRoute.homeLeading)) {
      child = HomeRoute.getPage(currentRoute, args);
    } else if (currentRoute.startsWith(SplashRoute.splashLeading)) {
      child = SplashRoute.getPage(currentRoute, args);
    } else {
      child = const PageNotFoundScreen();
    }
    return MaterialPageRoute(
      builder: (_) => child,
      settings: settings,
    );
  }
}
