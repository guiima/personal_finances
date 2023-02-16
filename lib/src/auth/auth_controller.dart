import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/auth/auth_service.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  AuthService service = AuthService();
  @observable
  bool siginEmailPasswordError = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @computed
  bool get isNotEmptyFields => email.isNotEmpty && password.isNotEmpty;

  @action
  Future<void> signInWithEmailAndPassword() async {
    final Either<Exception, Unit> response =
        await service.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    response.fold(
      (Exception l) => setSiginEmailPasswordError(),
      (Unit r) => clearSiginEmailPasswordError(),
    );
  }

  @action
  void setEmail({required String value}) {
    email = value;
  }

  @action
  void setPassword({required String value}) {
    password = value;
  }

  void setSiginEmailPasswordError() {
    siginEmailPasswordError = true;
  }

  void clearSiginEmailPasswordError() {
    siginEmailPasswordError = false;
  }
}
