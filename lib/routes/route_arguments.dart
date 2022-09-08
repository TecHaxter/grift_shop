import 'package:flutter/material.dart';
import 'package:grift_shop/views/views.dart';

class RouteArguments {
  RouteArguments._();

  static Widget misTypedArgsRoute<T>(Object args) {
    return const PageNotFoundScreen();
  }

  static bool hasInvalidArgs<T>(Object args) {
    return (args is! T);
  }
}

class SuccessSplashViewArgs {
  final String route;

  SuccessSplashViewArgs({required this.route});
}
