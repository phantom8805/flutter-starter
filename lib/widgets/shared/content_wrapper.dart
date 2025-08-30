import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class ContentWrapper extends StatelessWidget {
  final Widget child;

  const ContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.background,
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPageOuterPadding),
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPageInnerPadding,
          ),
          child: child),
    );
  }
}
