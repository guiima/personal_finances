import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_finances/src/auth/auth_controller.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_page.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/widgets/elevated_button/elevated_button_component.dart';
import 'package:personal_finances/src/widgets/provider_sigin_button/provider_sigin_button.dart';
import 'package:personal_finances/src/widgets/text_form_field/text_form_field_component.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: TextFormFieldComponent(
                        labelText: 'e-mail',
                        onChanged: (String value) =>
                            _controller.setEmail(value: value),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 36),
                      child: TextFormFieldComponent(
                        labelText: 'senha',
                        obscureText: true,
                        onChanged: (String value) =>
                            _controller.setPassword(value: value),
                      ),
                    ),
                    if (_controller.siginEmailPasswordError)
                      const SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('E-mail ou senha estão incorretos!'),
                        ),
                      ),
                    ElevatedButtonComponent(
                      buttonText: 'Logar',
                      onPressed: () => _controller.signInWithEmailAndPassword(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 42, bottom: 12),
                      child: Text(
                        'Vincule a uma conta',
                        style: TextStyle(color: AppColors.subTitle),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: ProviderSiginComponent(
                            provider: Provider.google,
                          ),
                        ),
                        ProviderSiginComponent(
                          provider: Provider.facebook,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
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
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
