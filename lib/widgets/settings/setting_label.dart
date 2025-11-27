import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class SettingLabel extends StatelessWidget {
  final double? maxWidth;
  final String text;
  final IconData icon;
  final Color iconBackground;

  const SettingLabel({super.key, required this.text, required this.icon, required this.iconBackground, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth != null ? maxWidth! : context.percentWidth(50)),
      child: Row(
        children: <Widget>[
          Ink(
            width: context.largeIconSize + 10,
            height: context.largeIconSize + 10,
            child: Container(
              decoration: ShapeDecoration(
                color: iconBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(context.borderRadius, context.borderRadius)),
                ),
              ),
              child: Icon(icon, size: context.largeIconSize, color: context.onSuccess),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              context.t(text),
              style: context.titleMedium?.merge(TextStyle(color: context.onBackground, fontWeight: FontWeight.normal)),
            ),
          ),
        ],
      ),
    );
  }
}
