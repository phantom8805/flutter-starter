import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';

class GlobalLoader extends StatelessWidget {
  final Widget child;

  const GlobalLoader({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Observer(
    builder: (_) {
      return Stack(
        children: [
          child,
          if (context.store.isLoading) ModalBarrier(color: Colors.black12.withValues(alpha: 0.3)),
          if (context.store.isLoading) const Center(child: CircularProgressIndicator()),
        ],
      );
    },
  );
}
