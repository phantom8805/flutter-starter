import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/widgets/shared/icon_with_bg_button.dart';

class AppBarButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const AppBarButton({
    required this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconWithBgButton(
      padding: EdgeInsets.only(right: context.horizontalPadding),
      bgColor: context.onPrimary,
      color: context.primary,
      iconSize: context.appBarIconSize,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
