import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  static UserModel instace = UserModel();

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
