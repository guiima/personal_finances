import 'package:flutter/material.dart';
import 'package:personal_finances/src/pages/home/home_controller.dart';
import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:personal_finances/src/widgets/app_bar/app_bar_component.dart';
import 'package:personal_finances/src/widgets/bottom_navigation_bar/bottom_navigation_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

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
                const Text('Bem vindo ao Agro'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Sair'),
                    // onPressed: () => _controller.signOut(),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.income),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarComponent(),
      ),
    );
  }
}
