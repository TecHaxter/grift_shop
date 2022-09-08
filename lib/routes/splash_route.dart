part of 'routes.dart';

class SplashRoute {
  static const splashLeading = '/splash';
  static const intro = splashLeading + '/intro';
  static const success = splashLeading + '/success';
  static final splashRoutes = <String>{
    intro,
    success,
  };

  static Widget getPage(String currentRoute, Object? args) {
    Widget child;
    switch (currentRoute) {
      case SplashRoute.intro:
        child = const IntroSplash();
        break;
      case SplashRoute.success:
        if (RouteArguments.hasInvalidArgs<SuccessSplashViewArgs>(args!)) {
          child = RouteArguments.misTypedArgsRoute<SuccessSplashViewArgs>(args);
        } else {
          child = SuccessSplash(
            args: args as SuccessSplashViewArgs,
          );
        }
        break;
      default:
        child = const PageNotFoundScreen();
    }
    return child;
  }
}
