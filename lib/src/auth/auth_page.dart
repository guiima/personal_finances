import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_finances/src/auth/auth_controller.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_page.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/widgets/elevated_button/elevated_button_component.dart';
import 'package:personal_finances/src/widgets/provider_sigin_button/provider_sigin_button.dart';
import 'package:personal_finances/src/widgets/text_form_field/text_form_field_component.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthController _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormFieldComponent(
                    labelText: 'E-mail',
                    onChanged: (String value) =>
                        _controller.setEmail(value: value),
                  ).paddingBottom(24),
                  TextFormFieldComponent(
                    labelText: 'Senha',
                    obscureText: true,
                    onChanged: (String value) =>
                        _controller.setPassword(value: value),
                  ),
                  if (_controller.siginEmailPasswordError)
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'E-mail ou senha estão incorretos',
                        style: TextStyle(
                          color: AppColors.textError,
                        ),
                      ).paddingLeft(16).paddingTop(4),
                    ),
                  ElevatedButtonComponent(
                    buttonText: 'Logar',
                    onPressed: _controller.isNotEmptyFields
                        ? () => _controller.signInWithEmailAndPassword()
                        : null,
                  ).paddingTop(24),
                  Text(
                    'Vincule a uma conta',
                    style: TextStyle(color: AppColors.subTitle),
                  ).paddingTop(42).paddingBottom(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const ProviderSiginComponent(
                        provider: Provider.google,
                      ).paddingRight(16),
                      const ProviderSiginComponent(
                        provider: Provider.facebook,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Não possui cadastro?',
                        style: TextStyle(color: AppColors.subTitle),
                      ),
                      TextButton(
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(color: AppColors.primaryTitle),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<SiginUpPage>(
                              builder: (_) => const SiginUpPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ).paddingTop(12)
                ],
              ).paddingAll(20),
            );
          },
        ),
      ),
    );
  }
}
