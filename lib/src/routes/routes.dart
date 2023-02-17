import 'package:flutter/material.dart';
import 'package:personal_finances/src/auth/auth_page.dart';
import 'package:personal_finances/src/home/home_page.dart';
import 'package:personal_finances/src/onboarding/onboarding_page.dart';
import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_page.dart';
import 'package:personal_finances/src/widgets/widget_tree/widget_tree.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  AppRoutes.home: (BuildContext context) => const HomePage(),
  AppRoutes.onboarding: (BuildContext context) => const OnboardingPage(),
  AppRoutes.auth: (BuildContext context) => const AuthPage(),
  AppRoutes.siginUp: (BuildContext context) => const SiginUpPage(),
  AppRoutes.widgetTree: (BuildContext context) => const WidgetTree(),
};
