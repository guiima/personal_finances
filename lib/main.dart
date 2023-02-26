import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_finances/firebase_options.dart';
import 'package:personal_finances/src/pages/onboarding/onboarding_service.dart';
import 'package:personal_finances/src/routes/routes.dart';
import 'package:personal_finances/src/styles/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OnboardingService onboardingService = OnboardingService();

  String initialScreen = await onboardingService.verifyOnboardingShown();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MyApp(initialScreen: initialScreen),
  );
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
        appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
          foregroundColor: AppColors.secondaryColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: initialScreen,
      routes: routes,
    );
  }
}
