import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class SettingDropdown<T> extends StatelessWidget {
  final T value;
  final void Function(T) onChange;
  final List<DropdownMenuItem<T>> items;

  const SettingDropdown({super.key, required this.value, required this.items, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      underline: const SizedBox(),
      enableFeedback: true,
      style: context.titleMedium,
      value: value,
      icon: Icon(Icons.keyboard_arrow_down, size: context.largeIconSize, color: context.onBackground),
      items: items,
      onChanged: (v) {
        if (v != null) {
          onChange(v);
        }
      },
    );
  }
}
