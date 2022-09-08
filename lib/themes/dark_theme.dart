part of 'themes.dart';

class _DarkTheme {
  // ignore: unused_field
  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Gilroy',
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.credIndigo,
      secondary: AppColors.credPinkCottonCandy,
    ),
    toggleableActiveColor: AppColors.credGrass,
    appBarTheme: AppBarTheme(color: AppColors.darkBackground),
    scaffoldBackgroundColor: AppColors.darkBackground,
    errorColor: AppColors.credWaterMellon,
    focusColor: AppColors.credMausmi,
    hoverColor: AppColors.credIndigo,
    disabledColor: AppColors.credPollutedSky,
    primaryColorLight: AppColors.darkBackground,
    backgroundColor: AppColors.darkBackground,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.credIndigo),
    ),
  );
}
