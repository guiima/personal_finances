import 'package:flutter/material.dart';
import 'package:personal_finances/src/global_states/user/user.dart';
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
  final UserModel1 _userModel = UserModel1.instace;
  final UserService service = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarComponent(
          title: '',
        ),
        body: AnimatedBuilder(
          animation: _userModel,
          builder: (BuildContext context, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('${_userModel.counter}'),
                    ElevatedButton(
                      child: const Text('somar'),
                      // onPressed: () => _controller.signOut(),
                      onPressed: () => _userModel.incrementCounter(),
                    ).paddingAll(8),
                    ElevatedButton(
                      child: const Text('Ir para Receitas'),
                      // onPressed: () => _controller.signOut(),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRoutes.income),
                    ).paddingAll(8),
                    ElevatedButton(
                      child: const Text('get users'),
                      // onPressed: () => _controller.signOut(),
                      onPressed: () => service.getUserByUid(),
                    ).paddingTop(20),
                    ElevatedButton(
                      child: const Text('set users'),
                      // onPressed: () => _controller.signOut(),
                      onPressed: () => service.addUser(),
                    ).paddingTop(20),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: const BottomNavigationBarComponent(),
      ),
    );
  }
}
