import 'package:mobx/mobx.dart';

part 'onboarding_controller.g.dart';

class OnboardinglController = OnboardinglControllerBase
    with _$OnboardinglController;

abstract class OnboardinglControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void setIndex(int index) {
    currentIndex = index;
  }
}
