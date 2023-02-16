// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_form_field_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextFormFieldController on TextFormFieldControllerBase, Store {
  late final _$passwordShownAtom =
      Atom(name: 'TextFormFieldControllerBase.passwordShown', context: context);

  @override
  bool get passwordShown {
    _$passwordShownAtom.reportRead();
    return super.passwordShown;
  }

  @override
  set passwordShown(bool value) {
    _$passwordShownAtom.reportWrite(value, super.passwordShown, () {
      super.passwordShown = value;
    });
  }

  late final _$TextFormFieldControllerBaseActionController =
      ActionController(name: 'TextFormFieldControllerBase', context: context);

  @override
  void showPassword() {
    final _$actionInfo = _$TextFormFieldControllerBaseActionController
        .startAction(name: 'TextFormFieldControllerBase.showPassword');
    try {
      return super.showPassword();
    } finally {
      _$TextFormFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hidePassword() {
    final _$actionInfo = _$TextFormFieldControllerBaseActionController
        .startAction(name: 'TextFormFieldControllerBase.hidePassword');
    try {
      return super.hidePassword();
    } finally {
      _$TextFormFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordShown: ${passwordShown}
    ''';
  }
}
