import 'package:mobx/mobx.dart';

part 'bottom_navigation_bar_controller.g.dart';

class BottomNavigationBarController = BottomNavigationBarControllerBase
    with _$BottomNavigationBarController;

abstract class BottomNavigationBarControllerBase with Store {
  @observable
  int currentIndex = 1;

  @action
  void setCurrentIndex({required int index}) {
    currentIndex = index;
  }
}
