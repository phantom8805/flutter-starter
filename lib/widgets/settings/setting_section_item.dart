import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/widgets/shared/on_background_panel.dart';

class SettingSectionItem extends StatelessWidget {
  final List<Widget> rowItems;
  final void Function()? onTap;

  const SettingSectionItem({super.key, required this.rowItems, this.onTap});

  @override
  Widget build(BuildContext context) {
    /// need for items with same height, because dropdowns ect. can't have height less than 'kMinInteractiveDimension' const
    final minItemHeight = kMinInteractiveDimension + context.verticalPadding;

    final rowWidget = OnBackgroundPanel(
      child: Container(
        constraints: BoxConstraints(minHeight: minItemHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowItems,
        ),
      ),
    );

    return onTap != null
        ? InkWell(
            onTap: () => onTap!(),
            child: rowWidget,
          )
        : rowWidget;
  }
}
