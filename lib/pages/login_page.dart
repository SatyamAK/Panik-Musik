import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panik_musik/components/buttons.dart';
import 'package:panik_musik/components/text_form.dart';
import 'package:panik_musik/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void login() async {
      if (!_key.currentState!.validate()) {
        return;
      }
      AuthService().loginUsingEmailAndPassword(
          emailController.text, passwordController.text, context);
    }

    void register() async {
      if (!_key.currentState!.validate()) {
        return;
      }
      AuthService()
          .register(emailController.text, passwordController.text, context);
    }

    void googleLogin() async {
      await AuthService().loginUsingGoogle(context);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text('Welcome to Panik Musik',
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center),
                ),
                Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textFormField(emailController, 'email', false, context),
                        textFormField(
                            passwordController, 'password', true, context),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              button(Theme.of(context).primaryColor, '  Login',
                                  FontAwesomeIcons.signInAlt, login, context),
                              button(
                                  Theme.of(context).primaryColor,
                                  '  Register',
                                  Icons.person_add_alt_rounded,
                                  register,
                                  context)
                            ],
                          ),
                        ),
                        Text(
                          'OR',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: button(Colors.red, 'Sign in with Google',
                              FontAwesomeIcons.google, googleLogin, context),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
