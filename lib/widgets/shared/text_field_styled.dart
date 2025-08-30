import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class TextFieldStyled extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? message;
  final String? placeholder;
  final IconData? iconData;
  final bool? obscureText;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;

  const TextFieldStyled({
    super.key,
    required this.controller,
    this.label,
    this.placeholder,
    this.iconData,
    this.message,
    this.obscureText,
    this.autofillHints,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final focusedColor = context.primary;

    return Column(children: <Widget>[
      label != null
          ? Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.t(label),
                style: context.titleLarge?.merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
            )
          : const SizedBox.shrink(),
      TextField(
        autofillHints: kIsWeb ? null : autofillHints,
        obscureText: obscureText ?? false,
        controller: controller,
        textInputAction: textInputAction,
        style: TextStyle(color: context.onBackgroundDarker),
        decoration: InputDecoration(
          hintText: context.t(placeholder),
          hintStyle: context.titleMedium,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: context.onBackground),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: context.borderWidth, color: focusedColor),
            borderRadius: BorderRadius.circular(context.borderRadius),
          ),
          focusColor: focusedColor,
          suffixIcon: iconData != null ? Icon(iconData) : null,
          suffixIconColor: WidgetStateColor.resolveWith(
              (states) => states.contains(WidgetState.focused) ? focusedColor : context.onBackground),
        ),
      ),
      message != null
          ? Align(
              alignment: Alignment.centerLeft,
              child: Text(context.t(message), style: context.titleMedium),
            )
          : const SizedBox.shrink()
    ]);
  }
}
