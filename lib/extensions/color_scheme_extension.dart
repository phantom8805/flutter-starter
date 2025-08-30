import 'package:flutter/material.dart';
import 'package:flutterstarter/theme.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get success => brightness == Brightness.light ? MainColor.success : MainColor.success;

  Color get onSuccess => brightness == Brightness.light ? MainColor.onSuccess : MainColor.onSuccess;

  Color get danger => brightness == Brightness.light ? MainColor.danger : MainColor.danger;

  Color get warning => brightness == Brightness.light ? MainColor.warning : MainColor.warning;

  Color get onWarning => brightness == Brightness.light ? MainColor.onWarning : MainColor.onWarning;

  Color get onDanger => brightness == Brightness.light ? MainColor.onDanger : MainColor.onDanger;

  Color get disabled => brightness == Brightness.light ? MainColor.disabled : MainColor.disabled;

  Color get onDisabled => brightness == Brightness.light ? MainColor.onDisabled : MainColor.onDisabled;

  Color get onBackgroundDarker =>
      brightness == Brightness.light ? MainColor.onBackgroundDarker : MainColor.onBackgroundDarker;

  Color get backgroundItem => brightness == Brightness.light ? MainColor.backgroundItem : MainColor.backgroundItem;
}
