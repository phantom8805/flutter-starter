import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class IconWithBgButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? bgColor;
  final double? iconSize;
  final EdgeInsets? padding;

  const IconWithBgButton({
    required this.icon,
    this.onPressed,
    this.color,
    this.bgColor,
    this.iconSize,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Ink(
        decoration: ShapeDecoration(color: bgColor ?? context.primary, shape: const CircleBorder()),
        child: IconButton(
          icon: icon,
          iconSize: iconSize ?? context.defaultIconSize,
          color: color ?? context.onPrimary,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
