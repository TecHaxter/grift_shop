part of 'routes.dart';

class AuthRoute {
  static const authLeading = '/auth';
  static const signIn = authLeading + '/sign-in';
  static final authRoutes = <String>{signIn};

  static Widget getPage(String currentRoute, Object? args) {
    Widget child;
    switch (currentRoute) {
      case AuthRoute.signIn:
        // child = RouteArguments.misTypedArgsRoute<homeHomeArgs>(args);
        child = const SignInScreen();
        break;
      default:
        print("hi");
        child = const PageNotFoundScreen();
    }
    return child;
  }
}
