import 'package:flutter/cupertino.dart';

class UserModel1 extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  static UserModel1 instace = UserModel1();

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
