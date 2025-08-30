import 'package:flutter/material.dart';
import 'package:flutterstarter/widgets/shared/global_loader.dart';
import 'package:flutterstarter/widgets/shared/notification_modal.dart';
import 'package:flutterstarter/widgets/shared/snack_bar_messages.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool asMainScreen;

  const ScaffoldWrapper(
      {super.key,
      this.appBar,
      required this.body,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.asMainScreen = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: asMainScreen
          ? Stack(children: [
              const NotificationModal(),
              const SnackBarMessages(),
              GlobalLoader(child: body),
            ])
          : GlobalLoader(child: body),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
