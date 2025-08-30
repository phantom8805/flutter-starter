import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class OnBackgroundPanel extends StatelessWidget {
  final Widget child;
  final bool highlighted;

  const OnBackgroundPanel({super.key, required this.child, this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: context.verticalSmallPadding / 2,
        top: context.verticalSmallPadding / 2,
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.verticalPadding,
        horizontal: context.horizontalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.borderRadiusLarge),
        border: highlighted ? Border.all(color: context.primary) : null,
        boxShadow: [
          BoxShadow(
            spreadRadius: highlighted ? 5 : 0,
            color: context.onBackground,
            blurRadius: 5,
            offset: const Offset(
              0, // Move to right 10  horizontally
              3, // Move to bottom 10 Vertically
            ),
          ),
        ],
        color: context.backgroundItem,
      ),
      child: child,
    );
  }
}
