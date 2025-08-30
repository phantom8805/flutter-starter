import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/widgets/login/form.dart';
import 'package:flutterstarter/widgets/shared/scaffold_wrapper.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: ListView(children: [
        SizedBox(
          width: context.mediaQuery.size.width,
          height: context.mediaQuery.size.height - 50,
          child: const Center(
            child: AuthForm(),
          ),
        ),
      ]),
    );
  }
}
