import 'package:flutter/material.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/widgets/app_bar/app_bar_component.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';
import 'package:personal_finances/src/widgets/card/card_component.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarComponent(
          title: 'Receitas',
        ),
        body: Container(
          color: AppColors.backgroundColor,
          child: Column(
            children: <Widget>[
              Text(
                'Fevereiro',
                style: TextStyle(
                  color: AppColors.body,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingTop(15.27),
              Text(
                'R\$ 1.000,00',
                style: TextStyle(
                  color: AppColors.subTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ).paddingTop(15),
              Text(
                'Saldo total',
                style: TextStyle(
                  color: AppColors.subTitle,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ).paddingTop(1).paddingBottom(20.73),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return CardComponent(
                      title: 'Salário',
                      content: 'R\$ 1$index,00',
                    ).paddingBottom(5).paddingHorizontal(5).paddingTop(5);
                  },
                ),
              ),
            ],
          ).paddingHorizontal(15),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.secondaryColor,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // onTap: () {},
          currentIndex: 1,
          backgroundColor: AppColors.tertiaryColor,
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
        ),
      ),
    );
  }
}
