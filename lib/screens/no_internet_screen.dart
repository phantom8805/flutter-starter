import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/theme.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(context),
      builder: (context, mainStore) {
        return Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                color: context.danger,
                size: 150,
              ),
              Text(
                context.t('No active internet connection'),
                textAlign: TextAlign.center,
                style: context.titleLarge,
              )
            ],
          ),
        ));
      },
    );
  }
}
