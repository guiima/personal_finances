// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigin_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SiginUpController on SiginUpControllerBase, Store {
  late final _$emailAtom =
      Atom(name: 'SiginUpControllerBase.email', context: context);

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
      Atom(name: 'SiginUpControllerBase.password', context: context);

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

  late final _$confirmPasswordAtom =
      Atom(name: 'SiginUpControllerBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: 'SiginUpControllerBase.hasError', context: context);

  @override
  Option<Exception> get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(Option<Exception> value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$messageErrorAtom =
      Atom(name: 'SiginUpControllerBase.messageError', context: context);

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  late final _$userCreatedAtom =
      Atom(name: 'SiginUpControllerBase.userCreated', context: context);

  @override
  bool get userCreated {
    _$userCreatedAtom.reportRead();
    return super.userCreated;
  }

  @override
  set userCreated(bool value) {
    _$userCreatedAtom.reportWrite(value, super.userCreated, () {
      super.userCreated = value;
    });
  }

  late final _$SiginUpControllerBaseActionController =
      ActionController(name: 'SiginUpControllerBase', context: context);

  @override
  void setEmail({required String value}) {
    final _$actionInfo = _$SiginUpControllerBaseActionController.startAction(
        name: 'SiginUpControllerBase.setEmail');
    try {
      return super.setEmail(value: value);
    } finally {
      _$SiginUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword({required String value}) {
    final _$actionInfo = _$SiginUpControllerBaseActionController.startAction(
        name: 'SiginUpControllerBase.setPassword');
    try {
      return super.setPassword(value: value);
    } finally {
      _$SiginUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword({required String value}) {
    final _$actionInfo = _$SiginUpControllerBaseActionController.startAction(
        name: 'SiginUpControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value: value);
    } finally {
      _$SiginUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessageError({required String message}) {
    final _$actionInfo = _$SiginUpControllerBaseActionController.startAction(
        name: 'SiginUpControllerBase.setMessageError');
    try {
      return super.setMessageError(message: message);
    } finally {
      _$SiginUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
hasError: ${hasError},
messageError: ${messageError},
userCreated: ${userCreated}
    ''';
  }
}
