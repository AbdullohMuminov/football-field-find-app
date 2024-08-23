import 'package:flutter/material.dart' show ColorScheme, Brightness, Color;

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: Color.fromRGBO(42, 166, 76, 1), ///For main components on UI!
  onPrimary: Color.fromRGBO(255, 255, 255, 1), ///For items ex. icons, texts on main components on UI!
  primaryContainer: Color.fromRGBO(0, 170, 91, 1),
  secondary: Color.fromRGBO(24, 23, 37, 1),
  secondaryContainer: Color.fromRGBO(118, 118, 128, 0.12), ///767680 12%
  surface: Color.fromRGBO(255, 255, 255, 1), ///For backgrounds of (Scaffold, app, ...).
  onSurface: Color(0xff000000), ///For items on background!
  surfaceBright: Color.fromRGBO(178, 178, 178, 1),
  outline: Color.fromRGBO(0, 0, 0, 0.04), ///For outlines!
  shadow: Color.fromRGBO(96, 132, 118, 0.2), ///For shadows

  ///Don't need ones!!!
  surfaceDim: Color(0xFF000000), ///000000 Always darkest at the dark and light mode!
  inverseSurface: Color.fromRGBO(0, 0, 0, 1), /// When components take up like popups or dropdowns!
  onErrorContainer: Color(0xFFFFE1E7), ///FFE1E7
  errorContainer: Color(0xFFFD3654), ///FD3654
  onSecondary: Color(0xFF000000),
  error: Color(0xFF000000),
  onError: Color(0xFF000000),
  // brightness: Brightness.light,
  // primary: AppColors.white,
  // onPrimary: AppColors.mainLight,
  // primaryContainer: Color(0xff141311),
  // onPrimaryContainer: Color(0xff141311),
  // secondary: Color(0xff141311),
  // onSecondary: Color(0xff141311),
  // secondaryContainer: Color(0xffffffff),
  // onSecondaryContainer: Color(0xff141414),
  // tertiary: Color(0xff141311),
  // onTertiary: Color(0xff000000),
  // tertiaryContainer: Color(0xffEDEDED),
  // onTertiaryContainer: Color(0xff141413),
  // error: Color(0xffb00020),
  // onError: Color(0xffffffff),
  // errorContainer: Color(0xfffcd8df),
  // onErrorContainer: Color(0xff141213),
  // surface: Color(0xfffffbf9),
  // onSurface: Color(0xff141311),
  // surfaceContainerHighest: Color(0xffeee8e3),
  // onSurfaceVariant: Color(0xff121211),
  // outline: Color(0xff837676),
  // outlineVariant: Color(0xffccc6c6),
  // scrim: Color(0xff000000),
  // inverseSurface: Color(0xff171411),
  // onInverseSurface: Color(0xfff5f5f5),
  // inversePrimary: Color(0xfffff8c0),
  // surfaceTint: Color(0xff3F3F3F),
);

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: Color(0xFF2ec866), ///2ec866 For main components on UI!
  onPrimary: Color(0xFF121418), ///121418 For items ex. icons, texts on main components on UI!
  secondary: Color(0xFFa47618), ///a47618
  secondaryContainer: Color(0xFFFFAD30), ///FFAD30
  surface: Color(0xFF121418), ///121418 For backgrounds of (Scaffold, app, ...).
  onSurface: Color(0xffeceded),

  ///Don't need ones!!!
  onSecondary: Color(0xff141210),
  error: Color(0xFF000000),
  onError: Color(0xFF000000),
  // brightness: Brightness.dark,
  // primary: AppColors.black,
  // onPrimary: AppColors.mainNight,
  // primaryContainer: Color(0xff141311),
  // onPrimaryContainer: Color(0xffe9ecf1),
  // secondary: Color(0xff5EB4F6),
  // onSecondary: Color(0xff141210),
  // secondaryContainer: Color(0xff6C7882),
  // onSecondaryContainer: Color(0xfff3e6e2),
  // tertiary: Color(0xff141311),
  // onTertiary: Color(0xff131414),
  // tertiaryContainer: Color(0xff6C7882),
  // onTertiaryContainer: Color(0xffeaf7fb),
  // error: Color(0xffcf6679),
  // onError: Color(0xff140c0d),
  // errorContainer: Color(0xffb1384e),
  // onErrorContainer: Color(0xfffbe8ec),
  // surface: Color(0xff181a1d),
  // onSurface: Color(0xffeceded),
  // surfaceContainerHighest: Color(0xff3d4146),
  // onSurfaceVariant: Color(0xffe0e1e1),
  // outline: Color(0xff767d7d),
  // outlineVariant: Color(0xff2c2e2e),
  // shadow: Color(0xff000000),
  // scrim: Color(0xff000000),
  // inverseSurface: Color(0xfffafcff),
  // onInverseSurface: Color(0xff131314),
  // inversePrimary: Color(0xff536577),
  // surfaceTint: Color(0xffffffff),
);
