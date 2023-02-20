// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IncomeController on IncomeControllerBase, Store {
  late final _$incomeAtom =
      Atom(name: 'IncomeControllerBase.income', context: context);

  @override
  String get income {
    _$incomeAtom.reportRead();
    return super.income;
  }

  @override
  set income(String value) {
    _$incomeAtom.reportWrite(value, super.income, () {
      super.income = value;
    });
  }

  late final _$valueAtom =
      Atom(name: 'IncomeControllerBase.value', context: context);

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$IncomeControllerBaseActionController =
      ActionController(name: 'IncomeControllerBase', context: context);

  @override
  void function() {
    final _$actionInfo = _$IncomeControllerBaseActionController.startAction(
        name: 'IncomeControllerBase.function');
    try {
      return super.function();
    } finally {
      _$IncomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
income: ${income},
value: ${value}
    ''';
  }
}
