import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:football_field_find/src/core/style/text_style.dart";
import "color_schema.dart";

@immutable
final class AppThemes {
  final ThemeMode mode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  AppThemes({required this.mode})
      : darkTheme = ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkColorScheme,
          scaffoldBackgroundColor: darkColorScheme.surface,
          textTheme: const AppTextStyle(),
        ),
        lightTheme = ThemeData(
          brightness: Brightness.light,
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: lightColorScheme.surface,
          textTheme: const AppTextStyle(),
        );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: darkColorScheme.surface,
          surfaceTintColor: lightColorScheme.surface,
          shadowColor: lightColorScheme.shadow,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightColorScheme.surface,
          selectedLabelStyle: TextStyle(
            fontFamily: "gilroy",
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: lightColorScheme.primary,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: "gilroy",
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: lightColorScheme.onSurface,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(lightColorScheme.surface),
            shadowColor: WidgetStateProperty.all<Color>(lightColorScheme.shadow),
          ),
        ),
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: darkColorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: darkColorScheme.surface,
          surfaceTintColor: darkColorScheme.surface,
          shadowColor: darkColorScheme.shadow,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkColorScheme.surface,
          selectedLabelStyle: TextStyle(
            fontFamily: "gilroy",
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: darkColorScheme.primary,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: "gilroy",
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: darkColorScheme.onSurface,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(darkColorScheme.surface),
            shadowColor: WidgetStateProperty.all<Color>(darkColorScheme.shadow),
          ),
        ),
      );

  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark ? darkTheme : lightTheme;
    }
  }
}
