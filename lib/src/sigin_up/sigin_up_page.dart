import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/auth/auth_page.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_controller.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_errors.dart';

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
          appBar: AppBar(
            title: const Text('Agro é tech'),
          ),
          body: Observer(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      autofocus: false,
                      decoration: const InputDecoration(
                        hintText: 'e-mail',
                        contentPadding: EdgeInsets.only(left: 8.0),
                      ),
                      onChanged: (String value) =>
                          _controller.setEmail(value: value),
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'senha',
                        contentPadding: EdgeInsets.only(left: 8.0),
                      ),
                      onChanged: (String value) =>
                          _controller.setPassword(value: value),
                    ),
                    TextFormField(
                      autofocus: false,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'confirme a senha',
                        contentPadding: EdgeInsets.only(left: 8.0),
                      ),
                      onChanged: (String value) =>
                          _controller.setConfirmPassword(value: value),
                    ),
                    if (_controller.hasError.isSome())
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_controller.messageError),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                          child: const Text('Cadastrar'),
                          onPressed: () {
                            _controller.createUserWithEmailAndPasswordUsecase();
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Já possui cadastro?'),
                        TextButton(
                          child: const Text('Volte ao login.'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<AuthPage>(
                                builder: (_) => const AuthPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
