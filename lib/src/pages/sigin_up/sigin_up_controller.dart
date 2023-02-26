import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/global_states/user/user_model.dart';
import 'package:personal_finances/src/global_states/user/user_service.dart';
import 'package:personal_finances/src/pages/sigin_up/sigin_up_errors.dart';
import 'package:personal_finances/src/pages/sigin_up/sigin_up_service.dart';

part 'sigin_up_controller.g.dart';

class SiginUpController = SiginUpControllerBase with _$SiginUpController;

abstract class SiginUpControllerBase with Store {
  final SiginUpService siginUpService = SiginUpService();
  final UserService userService = UserService();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @computed
  bool get isNotEmptyFields =>
      email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty;

  @observable
  Option<Exception> hasError = none();

  @observable
  String messageError = '';

  @observable
  bool userCreated = false;

  @action
  Future<void> createUserWithEmailAndPasswordUsecase() async {
    _clearError();

    if (password == confirmPassword) {
      final Either<Exception, Unit> response =
          await siginUpService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      response.fold(
        (Exception l) => _setError(fail: l),
        (Unit r) => _setNewUser(),
      );
    } else {
      _setError(fail: DifferentPasswordsError());
    }
  }

  @action
  void setEmail({required String value}) {
    email = value;
  }

  @action
  void setPassword({required String value}) {
    password = value;
  }

  @action
  void setConfirmPassword({required String value}) {
    confirmPassword = value;
  }

  @action
  void setMessageError({required String message}) {
    messageError = message;
  }

  void _setError({required Exception fail}) {
    hasError = optionOf(fail);
  }

  void _clearError() {
    hasError = none();
  }

  void _setNewUser() async {
    try {
      final UserModel userModel = UserModel(email: email);

      await userService.setUser(
        userModel: userModel,
      );

      _setUserCreated();
    } catch (e) {
      _setError(fail: Exception());
    }
  }

  void _setUserCreated() {
    userCreated = true;
  }
}
