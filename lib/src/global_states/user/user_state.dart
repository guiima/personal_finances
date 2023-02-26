import 'package:flutter/cupertino.dart';
import 'package:personal_finances/src/global_states/user/user_model.dart';

class UserState extends ChangeNotifier {
  final UserModel _userModel = UserModel(
    email: '',
  );

  UserModel get userModel => _userModel;

  bool get isEmpity =>
      _userModel.name == null &&
      _userModel.email.isEmpty &&
      _userModel.incomes.isEmpty &&
      _userModel.expenses.isEmpty &&
      _userModel.investments.isEmpty &&
      _userModel.debts.isEmpty &&
      _userModel.goals.isEmpty &&
      _userModel.emergencyReserves.isEmpty &&
      _userModel.opportunities.isEmpty;

  static UserState instace = UserState();

  void updateUserModel({required UserModel userModel}) {
    _userModel.copyWith(
      name: userModel.name,
      email: userModel.email,
      incomes: userModel.incomes,
      expenses: userModel.expenses,
      investments: userModel.investments,
      debts: userModel.debts,
      goals: userModel.goals,
      emergencyReserves: userModel.emergencyReserves,
      opportunities: userModel.opportunities,
    );

    notifyListeners();
  }
}
