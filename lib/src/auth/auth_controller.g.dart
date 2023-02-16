// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  Computed<bool>? _$isNotEmptyFieldsComputed;

  @override
  bool get isNotEmptyFields => (_$isNotEmptyFieldsComputed ??= Computed<bool>(
          () => super.isNotEmptyFields,
          name: 'AuthControllerBase.isNotEmptyFields'))
      .value;

  late final _$siginEmailPasswordErrorAtom = Atom(
      name: 'AuthControllerBase.siginEmailPasswordError', context: context);

  @override
  bool get siginEmailPasswordError {
    _$siginEmailPasswordErrorAtom.reportRead();
    return super.siginEmailPasswordError;
  }

  @override
  set siginEmailPasswordError(bool value) {
    _$siginEmailPasswordErrorAtom
        .reportWrite(value, super.siginEmailPasswordError, () {
      super.siginEmailPasswordError = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'AuthControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'AuthControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$signInWithEmailAndPasswordAsyncAction = AsyncAction(
      'AuthControllerBase.signInWithEmailAndPassword',
      context: context);

  @override
  Future<void> signInWithEmailAndPassword() {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword());
  }

  late final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase', context: context);

  @override
  void setEmail({required String value}) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.setEmail');
    try {
      return super.setEmail(value: value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword({required String value}) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.setPassword');
    try {
      return super.setPassword(value: value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
siginEmailPasswordError: ${siginEmailPasswordError},
email: ${email},
password: ${password},
isNotEmptyFields: ${isNotEmptyFields}
    ''';
  }
}
