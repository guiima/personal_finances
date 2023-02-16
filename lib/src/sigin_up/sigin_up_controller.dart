import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_errors.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_service.dart';

part 'sigin_up_controller.g.dart';

class SiginUpController = SiginUpControllerBase with _$SiginUpController;

abstract class SiginUpControllerBase with Store {
  SiginUpService service = SiginUpService();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  Option<Exception> hasError = none();

  @observable
  String messageError = '';

  @observable
  bool userCreated = false;

  Future<void> createUserWithEmailAndPasswordUsecase() async {
    clearError();

    if (password == confirmPassword) {
      final Either<Exception, Unit> response =
          await service.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      response.fold(
        (Exception l) => setError(fail: l),
        (Unit r) => setUserCreated(),
      );
    } else {
      setError(fail: DifferentPasswordsError());
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

  void setError({required Exception fail}) {
    hasError = optionOf(fail);
  }

  void clearError() {
    hasError = none();
  }

  void setUserCreated() {
    userCreated = true;
  }
}
