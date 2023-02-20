import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_finances/src/routes/app_routes.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({super.key});

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  final BottomNavigationBarController _controller =
      BottomNavigationBarController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return BottomNavigationBar(
          onTap: (int index) {
            if (index != _controller.currentIndex) {
              _controller.setCurrentIndex(index: index);
              goToRoute(index: index);
            }
          },
          currentIndex: _controller.currentIndex,
          backgroundColor: AppColors.tertiaryColor,
          selectedIconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.equalizer,
                color: AppColors.primaryColor,
              ),
              label: 'Estatística',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppColors.primaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: AppColors.primaryColor,
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }

  void goToRoute({required int index}) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(AppRoutes.home);
        break;
      case 1:
        Navigator.of(context).pushNamed(AppRoutes.home);
        break;
      case 2:
        Navigator.of(context).pushNamed(AppRoutes.income);
        break;
      default:
        Navigator.of(context).pushNamed(AppRoutes.home);
    }
  }
}
