// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

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

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

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

  final _$isSubmitedAtom = Atom(name: '_LoginControllerBase.isSubmited');

  @override
  bool get isSubmited {
    _$isSubmitedAtom.reportRead();
    return super.isSubmited;
  }

  @override
  set isSubmited(bool value) {
    _$isSubmitedAtom.reportWrite(value, super.isSubmited, () {
      super.isSubmited = value;
    });
  }

  final _$isVisibleAtom = Atom(name: '_LoginControllerBase.isVisible');

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  final _$verifyAsyncAction = AsyncAction('_LoginControllerBase.verify');

  @override
  Future<void> verify() {
    return _$verifyAsyncAction.run(() => super.verify());
  }

  final _$faceBookAuthAsyncAction =
      AsyncAction('_LoginControllerBase.faceBookAuth');

  @override
  Future<void> faceBookAuth() {
    return _$faceBookAuthAsyncAction.run(() => super.faceBookAuth());
  }

  final _$googleAuthAsyncAction =
      AsyncAction('_LoginControllerBase.googleAuth');

  @override
  Future<void> googleAuth() {
    return _$googleAuthAsyncAction.run(() => super.googleAuth());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  String? validateEmail() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsVisible() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setIsVisible');
    try {
      return super.setIsVisible();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveUser() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.saveUser');
    try {
      return super.saveUser();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isSubmited: ${isSubmited},
isVisible: ${isVisible}
    ''';
  }
}
