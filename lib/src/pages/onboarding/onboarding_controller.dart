import 'package:mobx/mobx.dart';
import 'package:personal_finances/src/pages/onboarding/onboarding_service.dart';

part 'onboarding_controller.g.dart';

class OnboardinglController = OnboardinglControllerBase
    with _$OnboardinglController;

abstract class OnboardinglControllerBase with Store {
  final OnboardingService _onboardingService = OnboardingService();

  @observable
  int currentIndex = 0;

  @action
  void setIndex(int index) {
    currentIndex = index;
  }

  @action
  void finisheOnboardingShow() {
    _onboardingService.finisheOnboardingShow();
  }
}
