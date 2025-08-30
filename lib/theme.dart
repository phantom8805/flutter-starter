import 'package:flutter/material.dart';

abstract class MainColor {
  static const mainColor = Colors.white;

  static const primary = Color(0xFF36618e);
  static const onPrimary = Colors.white;

  static const background = Color(0xFFF8F9FF);
  static const onBackground = Color(0xFF757575);
  static const onBackgroundDarker = Colors.black;

  static const backgroundItem = Colors.white;

  static const secondaryColor = Color(0xFFA0CAFD);
  static const onSecondaryColor = Colors.white;

  static const tertiaryColor = Color(0xFFD9E4F5);
  static const onTertiaryColor = Colors.white;

  static const success = Color(0xFF5EB663);
  static const onSuccess = Colors.white;

  static const danger = Color(0xFFFF5252);
  static const onDanger = Colors.white;

  static const warning = Color(0xFFFFAB40);
  static const onWarning = Colors.white;

  static const disabled = Color(0xFFD8D8E0);
  static const onDisabled = Colors.black;
}

class Sizes {
  static const tabletBreakpoint = 500;

  double get appbarHeight => 55;

  ///

  double get borderWidth => 1;

  double get borderRadius => 5;

  double get borderRadiusLarge => 10;

  double get appBarIconSize => 30;

  double get defaultIconSize => 35;

  ///

  double get largeIconSize => 30;

  ///

  double get edgeAllPadding => 10;

  double get edgeAllSmallPadding => 5;

  ///

  double get horizontalPageOuterPadding => 5;

  double get horizontalPageInnerPadding => 5;

  double get horizontalPadding => 10;

  double get horizontalSmallPadding => 5;

  ///

  double get verticalPageInnerPadding => 10;

  double get verticalPadding => 10;

  double get verticalPaddingLarge => 20;

  double get verticalSmallPadding => 5;
}

class TabletSizes extends Sizes {
  @override
  double get horizontalPageOuterPadding => 5;

  @override
  double get horizontalPageInnerPadding => 8;

  @override
  double get horizontalPadding => 20;

  @override
  double get horizontalSmallPadding => 7;
}

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    // https://m3.material.io/styles/color/roles
    colorScheme: ColorScheme.fromSeed(
      primary: MainColor.primary,
      onPrimary: MainColor.onPrimary,
      secondary: MainColor.secondaryColor,
      onSecondary: MainColor.onSecondaryColor,
      tertiary: MainColor.tertiaryColor,
      onTertiary: MainColor.onTertiaryColor,
      surface: MainColor.background,
      onSurface: MainColor.onBackground,
      seedColor: MainColor.mainColor,
      brightness: Brightness.light,
    ),
    textTheme: Theme.of(context).textTheme.apply(bodyColor: MainColor.onBackground),
  );
}
