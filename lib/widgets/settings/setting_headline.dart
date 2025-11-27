import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class SettingHeadline extends StatelessWidget {
  final String text;

  const SettingHeadline({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(maxWidth: context.percentWidth(90)),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  context.t(text).toUpperCase(),
                  style: context.titleLarge?.merge(TextStyle(color: context.onDisabled, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
