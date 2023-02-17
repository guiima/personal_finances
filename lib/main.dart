import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_finances/firebase_options.dart';
import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:personal_finances/src/routes/routes.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String initialScreen = await verifyOnboardingShown();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MyApp(initialScreen: initialScreen),
  );
}

Future<String> verifyOnboardingShown() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool onboardingShown = prefs.getBool('onboarding_shown') ?? false;

  return onboardingShown ? AppRoutes.widgetTree : AppRoutes.onboarding;
}

class MyApp extends StatelessWidget {
  final String initialScreen;

  const MyApp({
    super.key,
    required this.initialScreen,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.primaryColor,
      ),
      title: 'Flutter Demo',
      initialRoute: initialScreen,
      routes: routes,
    );
  }
}
