import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstarter/services/auth_service.dart';
import 'package:flutterstarter/widgets/shared/button_styled.dart';
import 'package:flutterstarter/widgets/shared/scaffold_wrapper.dart';
import 'package:flutterstarter/widgets/shared/text_field_styled.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isAuthProgress = false;
  String login = '';
  String password = '';

  @override
  void initState() {
    super.initState();

    loginController.addListener(() {
      setState(() {
        login = loginController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void setIsAuthProgress(bool val) {
    setState(() {
      isAuthProgress = val;
    });
  }

  bool isDisabled() {
    return login.length < 3 || password.length < 3;
  }

  Future<void> onAuthBtnClick(BuildContext context) async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusManager.instance.primaryFocus?.unfocus();

    setIsAuthProgress(true);
    await AuthService.login(context: context, login: login, password: password);
    setIsAuthProgress(false);
  }

  List<Widget> formItems() => [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
        AutofillGroup(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldStyled(
                label: 'Login',
                placeholder: 'Your login',
                message: 'at least 8 symbols',
                iconData: Icons.person,
                controller: loginController,
                autofillHints: const [
                  AutofillHints.newUsername,
                  AutofillHints.username,
                  AutofillHints.nickname,
                  AutofillHints.email
                ],
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldStyled(
                label: 'Password',
                placeholder: 'Your password',
                message: 'at least 8 symbols',
                iconData: Icons.password,
                controller: passwordController,
                obscureText: true,
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonStyled(
                isDisabled: isDisabled(),
                isLoading: isAuthProgress,
                onBtnClick: onAuthBtnClick,
                text: 'Login',
              ),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      asMainScreen: true,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: formItems(),
              ),
            );
          }

          return GridView.count(
            semanticChildCount: 2,
            padding: const EdgeInsets.all(30),
            crossAxisCount: 2,
            children: formItems(),
          );
        },
      ),
    );
  }
}
