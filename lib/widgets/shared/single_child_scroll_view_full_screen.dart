import 'package:flutter/material.dart';

class SingleChildScrollViewFullScreen extends StatelessWidget {
  final Widget child;

  const SingleChildScrollViewFullScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(minHeight: constraints.maxHeight, maxHeight: double.infinity),
            child: child,
          ),
        );
      },
    );
  }
}
