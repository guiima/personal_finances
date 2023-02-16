import 'package:mobx/mobx.dart';

part 'text_form_field_controller.g.dart';

class TextFormFieldController = TextFormFieldControllerBase
    with _$TextFormFieldController;

abstract class TextFormFieldControllerBase with Store {
  @observable
  bool passwordShown = false;

  @action
  void showPassword() {
    passwordShown = true;
  }

  @action
  void hidePassword() {
    passwordShown = false;
  }
}
