import 'package:flutter/material.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:grift_shop/data/constants/constants.dart';
import 'package:grift_shop/routes/routes.dart';
import 'package:grift_shop/themes/themes.dart';
import 'package:grift_shop/utils/utils.dart';

class GriftShopApp extends StatefulWidget {
  const GriftShopApp({Key? key}) : super(key: key);

  @override
  State<GriftShopApp> createState() => _GriftShopAppState();
}

class _GriftShopAppState extends State<GriftShopApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppEnvironment.appTheme,
      builder: (_, __, ___) {
        print(AppEnvironment.appTheme);
        return ValueListenableBuilder(
          valueListenable: AppEnvironment.swipeWidth,
          builder: (_, double swipeWidth, ___) {
            return BackGestureWidthTheme(
              backGestureWidth: BackGestureWidth.fraction(swipeWidth),
              child: MaterialApp(
                color: AppColors.isDark
                    ? AppColors.darkBackground
                    : AppColors.credWhite,
                builder: (context, child) {
                  final mediaQueryData = MediaQuery.of(context);
                  var ch = MediaQuery(
                    // Set the default textScaleFactor to 1.0 for
                    // the whole subtree.
                    data: mediaQueryData.copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                  return ScrollConfiguration(
                    behavior: const ScrollBehaviorImpl(),
                    child: ch,
                  );
                },
                debugShowCheckedModeBanner: false,
                onGenerateRoute: Routes.onGenerateRoute,
                navigatorKey: AppEnvironment.rootNavigationKey,
                navigatorObservers: [
                  AppEnvironment.routeObserver,
                ],
                theme: themeData,
                initialRoute: Routes.intro,
              ),
            );
          },
        );
      },
    );
  }
}
