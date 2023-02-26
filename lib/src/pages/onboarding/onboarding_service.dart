import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  Future<String> verifyOnboardingShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool onboardingShown = prefs.getBool('onboarding_shown') ?? false;

    return onboardingShown ? AppRoutes.widgetTree : AppRoutes.onboarding;
  }

  void finisheOnboardingShow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('onboarding_shown', true);
  }
}
