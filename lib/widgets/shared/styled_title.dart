import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class StyledTitle extends StatelessWidget {
  final String data;
  final Color? color;

  const StyledTitle(this.data, {this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.t(data),
      style: context.titleMediumLarge!.merge(TextStyle(
        color: color ?? context.primary,
        fontWeight: FontWeight.bold,
      )),
    );
  }
}
