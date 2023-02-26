import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:personal_finances/src/global_states/user/user.dart';
import 'package:personal_finances/src/pages/income/income_controller.dart';
import 'package:personal_finances/src/styles/app_colors.dart';
import 'package:personal_finances/src/widgets/app_bar/app_bar_component.dart';
import 'package:personal_finances/src/utils/extensions/padding.dart';
import 'package:personal_finances/src/widgets/bottom_navigation_bar/bottom_navigation_bar_component.dart';
import 'package:personal_finances/src/widgets/card/card_component.dart';
import 'package:personal_finances/src/widgets/elevated_button/elevated_button_component.dart';
import 'package:personal_finances/src/widgets/text_form_field/text_form_field_component.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final IncomeController _controller = IncomeController();
  final UserModel1 _userModel = UserModel1.instace;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarComponent(
          title: 'Receitas',
          haveArrowBAck: true,
        ),
        body: AnimatedBuilder(
          animation: _userModel,
          builder: (BuildContext context, Widget? child) {
            return Container(
              color: AppColors.backgroundColor,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('somar'),
                    // onPressed: () => _controller.signOut(),
                    onPressed: () => _userModel.incrementCounter(),
                  ).paddingAll(8),
                  Text(
                    'Fevereiro ${_userModel.counter}',
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
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _mostrarDialogo(context);
          },
          tooltip: 'Increment',
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.secondaryColor,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Nova Receita',
              style: TextStyle(
                color: AppColors.primaryTitle,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormFieldComponent(
                labelText: 'Receita',
                onChanged: (String value) => _controller.setIncome(value),
              ).paddingBottom(7),
              TextFormFieldComponent(
                labelText: 'Valor',
                onChanged: (String value) => _controller.setValue(value),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButtonComponent(
              buttonText: 'Salvar',
              onPressed: () => Navigator.of(context).pop(),
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: AppColors.primaryTitle,
                  ),
                ),
                // onPressed: () =>
                //     Navigator.of(context).pushNamed(AppRoutes.siginUp),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        );
      },
    );
  }
}
