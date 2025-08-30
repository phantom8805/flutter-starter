import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class SettingSection extends StatelessWidget {
  final Widget headline;
  final List<Widget> items;

  const SettingSection({super.key, required this.headline, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.verticalPadding),
      child: Column(
        children: [
          headline,
          Column(children: items),
        ],
      ),
    );
  }
}
