import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class IconWithBg extends StatelessWidget {
  final Icon icon;
  final Color? bgColor;
  final EdgeInsets? padding;

  const IconWithBg({
    required this.icon,
    this.bgColor,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: ShapeDecoration(
          color: bgColor ?? context.primary,
          shape: const CircleBorder(),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: icon,
        ),
      ),
    );
  }
}
