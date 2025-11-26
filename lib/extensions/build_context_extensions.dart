import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/color_scheme_extension.dart';
import 'package:flutterstarter/stores/main_store.dart';
import 'package:flutterstarter/theme.dart';
import 'package:provider/provider.dart';

extension BuildContextEntension<T> on BuildContext {
  bool get isTablet => screenWidth >= Sizes.tabletBreakpoint;

  Sizes get sizes => isTablet ? TabletSizes() : Sizes();

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// MediaQuery
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double percentWidth(int percent) {
    return screenWidth * (percent / 100) - 1;
  }

  double percentWidthMaxLimit({required int percent, required int maxWidth}) {
    return [maxWidth, percentWidth(percent)].min.toDouble();
  }

  double percentWidthMinLimit({required int percent, required int minWidth}) {
    return [minWidth, percentWidth(percent)].max.toDouble();
  }

  /// End MediaQuery
  ///

  /// TextStyles
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMediumLarge => Theme.of(this).textTheme.titleMedium?.merge(const TextStyle(fontSize: 20));

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  /// End TextStyles
  ///

  /// Default Colors
  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get tertiary => Theme.of(this).colorScheme.tertiary;

  Color get onTertiary => Theme.of(this).colorScheme.onTertiary;

  Color get success => Theme.of(this).colorScheme.success;

  Color get onSuccess => Theme.of(this).colorScheme.onSuccess;

  Color get danger => Theme.of(this).colorScheme.danger;

  Color get onDanger => Theme.of(this).colorScheme.onDanger;

  Color get warning => Theme.of(this).colorScheme.warning;

  Color get onWarning => Theme.of(this).colorScheme.onWarning;

  Color get background => Theme.of(this).colorScheme.surface;

  Color get onBackground => Theme.of(this).colorScheme.onSurface;

  Color get disabled => Theme.of(this).colorScheme.disabled;

  Color get onDisabled => Theme.of(this).colorScheme.onDisabled;

  Color get onBackgroundDarker => Theme.of(this).colorScheme.onBackgroundDarker;

  Color get backgroundItem => Theme.of(this).colorScheme.backgroundItem;

  /// End Default Colors
  ///

  /// End Custom Colors
  ///

  /// Sizes
  double get appbarHeight => sizes.appbarHeight;

  double get borderWidth => sizes.borderWidth;

  double get borderRadius => sizes.borderRadius;

  double get borderRadiusLarge => sizes.borderRadiusLarge;

  ///
  double get edgeAllPadding => sizes.edgeAllPadding;

  double get edgeAllSmallPadding => sizes.edgeAllSmallPadding;

  ///
  double get horizontalPageOuterPadding => sizes.horizontalPageOuterPadding;

  double get horizontalPageInnerPadding => sizes.horizontalPageInnerPadding;

  double get horizontalPadding => sizes.horizontalPadding;

  double get horizontalSmallPadding => sizes.horizontalSmallPadding;

  ///

  double get verticalPadding => sizes.verticalPadding;

  double get verticalPaddingLarge => sizes.verticalPaddingLarge;

  double get verticalSmallPadding => sizes.verticalSmallPadding;

  double get verticalPageInnerPadding => sizes.verticalPageInnerPadding;

  ///

  double get largeIconSize => sizes.largeIconSize;

  double get defaultIconSize => sizes.defaultIconSize;

  double get appBarIconSize => sizes.appBarIconSize;

  /// Sizes
  ///

  /// Stores
  MainStore get store {
    return Provider.of<MainStore>(this);
  }

  MainStore get storeNonListened {
    return Provider.of<MainStore>(this, listen: false);
  }

  ///End Stores
  ///

  void showLoader() {
    storeNonListened.isLoading = true;
  }

  void hideLoader() {
    storeNonListened.isLoading = false;
  }

  String t(String? key) {
    return key ?? '';
  }
}
