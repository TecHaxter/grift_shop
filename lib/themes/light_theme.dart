part of 'themes.dart';

class _LightTheme {
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.almaraiTextTheme(),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      },
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.credWhite,
      secondary: AppColors.credPinkCottonCandy,
    ),
    toggleableActiveColor: AppColors.credGrass,
    appBarTheme: AppBarTheme(color: AppColors.credWhite),
    scaffoldBackgroundColor: AppColors.credWhite,
    errorColor: AppColors.credWaterMellon,
    focusColor: AppColors.credMausmi,
    hoverColor: AppColors.credIndigo,
    disabledColor: AppColors.credPollutedSky,
    primaryColorLight: AppColors.credWhite,
    backgroundColor: AppColors.credWhite,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.credIndigo),
    ),
  );
}
