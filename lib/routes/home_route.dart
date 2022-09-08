part of 'routes.dart';

class HomeRoute {
  static const homeLeading = '/home';
  static const homeScreen = homeLeading + '/home-screen';
  static const myBag = homeLeading + '/my-bag';
  static final homeRoutes = <String>{homeScreen};

  static Widget getPage(String currentRoute, Object? args) {
    Widget child;
    switch (currentRoute) {
      case HomeRoute.homeScreen:
        // child = RouteArguments.misTypedArgsRoute<homeHomeArgs>(args);
        child = HomeScreen();
        break;
      case HomeRoute.myBag:
        // child = RouteArguments.misTypedArgsRoute<homeHomeArgs>(args);
        child = const MyBag();
        break;
      default:
        child = const PageNotFoundScreen();
    }
    return child;
  }
}
