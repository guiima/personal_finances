import 'package:flutter/material.dart';
import 'package:personal_finances/src/global_states/user/user_state.dart';
import 'package:personal_finances/src/global_states/user/user_service.dart';
import 'package:personal_finances/src/pages/home/home_controller.dart';
import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:personal_finances/src/widgets/app_bar/app_bar_component.dart';
import 'package:personal_finances/src/widgets/bottom_navigation_bar/bottom_navigation_bar_component.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarComponent(
          title: '',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Sair'),
                  onPressed: () => _controller.signOut(),
                ).paddingAll(8),
                ElevatedButton(
                  child: const Text('Ir para Receitas'),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.income),
                ).paddingAll(8),
                ElevatedButton(
                  child: const Text('initialize'),
                  onPressed: () => _controller.initialize(),
                ).paddingTop(20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarComponent(),
      ),
    );
  }
}
