import 'package:mobx/mobx.dart';

part 'income_controller.g.dart';

class IncomeController = IncomeControllerBase with _$IncomeController;

abstract class IncomeControllerBase with Store {
  @observable
  String income = '';

  @observable
  String value = '';

  @action
  void function() {}

  void setIncome(String data) {
    income = data;
  }

  void setValue(String data) {
    value = data;
  }
}
