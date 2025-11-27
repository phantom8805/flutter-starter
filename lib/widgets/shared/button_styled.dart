import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class ButtonStyled extends StatelessWidget {
  final String text;
  final Function(BuildContext context) onBtnClick;
  final bool isDisabled;
  final bool? isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final Size? size;

  const ButtonStyled({
    super.key,
    required this.onBtnClick,
    required this.text,
    required this.isDisabled,
    this.isLoading,
    this.backgroundColor,
    this.textColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : () => onBtnClick(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.borderRadius)),
        minimumSize: size ?? Size(context.mediaQuery.size.width - 60, 60),
      ),
      child: isLoading == true
          ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator())
          : Text(
              context.t(text),
              style: context.titleLarge?.merge(
                TextStyle(fontWeight: FontWeight.bold, color: textColor ?? context.onPrimary),
              ),
            ),
    );
  }
}
