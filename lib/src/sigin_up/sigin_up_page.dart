import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_controller.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_errors.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/widgets/elevated_button/elevated_button_component.dart';
import 'package:personal_finances/src/widgets/text_form_field/text_form_field_component.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';

class SiginUpPage extends StatefulWidget {
  const SiginUpPage({super.key});

  @override
  State<SiginUpPage> createState() => _SiginUpPageState();
}

class _SiginUpPageState extends State<SiginUpPage> {
  final SiginUpController _controller = SiginUpController();

  @override
  void initState() {
    _observeUserCreated();

    super.initState();
  }

  void _observeUserCreated() {
    reaction((_) => _controller.userCreated, (_) {
      Navigator.of(context).pop();
    });

    reaction((_) => _controller.hasError, (_) {
      if (_controller.hasError.isSome()) {
        _controller.hasError.map((Exception failure) {
          if (failure is WeakPasswordError) {
            _controller.setMessageError(
              message: 'A senha deve ter pelo menos 6 caracteres.',
            );
          } else if (failure is EmailAlreadyInUseError) {
            _controller.setMessageError(
              message: 'Esse e-mail já está vinculado a uma conta.',
            );
          } else if (failure is InvalidEmailError) {
            _controller.setMessageError(
              message: 'Insira um e-mail válido.',
            );
          } else if (failure is DifferentPasswordsError) {
            _controller.setMessageError(
              message: 'As senhas devem ser iguais.',
            );
          } else {
            _controller.setMessageError(
              message:
                  'Não foi possível realizar o cadastro, por favor tente novamente.',
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Observer(
            builder: (BuildContext context) {
              return Column(
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
                  ).paddingBottom(24),
                  TextFormFieldComponent(
                    labelText: 'Confirme a senha',
                    obscureText: true,
                    onChanged: (String value) =>
                        _controller.setConfirmPassword(value: value),
                  ),
                  if (_controller.hasError.isSome())
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        _controller.messageError,
                        style: TextStyle(
                          color: AppColors.textError,
                        ),
                      ).paddingLeft(16).paddingTop(4),
                    ),
                  ElevatedButtonComponent(
                    buttonText: 'Cadastrar',
                    onPressed: _controller.isNotEmptyFields
                        ? () =>
                            _controller.createUserWithEmailAndPasswordUsecase()
                        : null,
                  ).paddingTop(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Já possui cadastro?',
                        style: TextStyle(color: AppColors.subTitle),
                      ),
                      TextButton(
                        child: Text(
                          'Faça o login',
                          style: TextStyle(color: AppColors.primaryTitle),
                        ),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(AppRoutes.auth),
                      ),
                    ],
                  ).paddingTop(8),
                ],
              ).paddingAll(20);
            },
          ),
        ),
      ),
    );
  }
}
