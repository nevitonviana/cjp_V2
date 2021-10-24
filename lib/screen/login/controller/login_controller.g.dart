// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginControllerBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_LoginControllerBase.passwordValid'))
          .value;
  Computed<dynamic>? _$pressedComputed;

  @override
  dynamic get pressed =>
      (_$pressedComputed ??= Computed<dynamic>(() => super.pressed,
              name: '_LoginControllerBase.pressed'))
          .value;

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$visibilityPasswordAtom =
      Atom(name: '_LoginControllerBase.visibilityPassword');

  @override
  bool get visibilityPassword {
    _$visibilityPasswordAtom.reportRead();
    return super.visibilityPassword;
  }

  @override
  set visibilityPassword(bool value) {
    _$visibilityPasswordAtom.reportWrite(value, super.visibilityPassword, () {
      super.visibilityPassword = value;
    });
  }

  final _$loginConfirmedAtom =
      Atom(name: '_LoginControllerBase.loginConfirmed');

  @override
  bool get loginConfirmed {
    _$loginConfirmedAtom.reportRead();
    return super.loginConfirmed;
  }

  @override
  set loginConfirmed(bool value) {
    _$loginConfirmedAtom.reportWrite(value, super.loginConfirmed, () {
      super.loginConfirmed = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_LoginControllerBase.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$emailSuccessfullySentAtom =
      Atom(name: '_LoginControllerBase.emailSuccessfullySent');

  @override
  bool get emailSuccessfullySent {
    _$emailSuccessfullySentAtom.reportRead();
    return super.emailSuccessfullySent;
  }

  @override
  set emailSuccessfullySent(bool value) {
    _$emailSuccessfullySentAtom.reportWrite(value, super.emailSuccessfullySent,
        () {
      super.emailSuccessfullySent = value;
    });
  }

  final _$_loginAsyncAction = AsyncAction('_LoginControllerBase._login');

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  final _$passwordResetAsyncAction =
      AsyncAction('_LoginControllerBase.passwordReset');

  @override
  Future<void> passwordReset() {
    return _$passwordResetAsyncAction.run(() => super.passwordReset());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

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
  void setVisibilityPassword(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setVisibilityPassword');
    try {
      return super.setVisibilityPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoginConfirmed(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setLoginConfirmed');
    try {
      return super.setLoginConfirmed(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailSuccessfullySent(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmailSuccessfullySent');
    try {
      return super.setEmailSuccessfullySent(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
visibilityPassword: ${visibilityPassword},
loginConfirmed: ${loginConfirmed},
loading: ${loading},
error: ${error},
emailSuccessfullySent: ${emailSuccessfullySent},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
pressed: ${pressed}
    ''';
  }
}
