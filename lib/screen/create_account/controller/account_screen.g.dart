// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountController on _AccountControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_AccountControllerBase.nameValid'))
          .value;
  Computed<bool>? _$districtValidComputed;

  @override
  bool get districtValid =>
      (_$districtValidComputed ??= Computed<bool>(() => super.districtValid,
              name: '_AccountControllerBase.districtValid'))
          .value;
  Computed<bool>? _$cityValidComputed;

  @override
  bool get cityValid =>
      (_$cityValidComputed ??= Computed<bool>(() => super.cityValid,
              name: '_AccountControllerBase.cityValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_AccountControllerBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_AccountControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$repeatPasswordValidComputed;

  @override
  bool get repeatPasswordValid => (_$repeatPasswordValidComputed ??=
          Computed<bool>(() => super.repeatPasswordValid,
              name: '_AccountControllerBase.repeatPasswordValid'))
      .value;

  final _$nameAtom = Atom(name: '_AccountControllerBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$districtAtom = Atom(name: '_AccountControllerBase.district');

  @override
  String? get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(String? value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  final _$cityAtom = Atom(name: '_AccountControllerBase.city');

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$emailAtom = Atom(name: '_AccountControllerBase.email');

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

  final _$passwordAtom = Atom(name: '_AccountControllerBase.password');

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

  final _$repeatPasswordAtom =
      Atom(name: '_AccountControllerBase.repeatPassword');

  @override
  String? get repeatPassword {
    _$repeatPasswordAtom.reportRead();
    return super.repeatPassword;
  }

  @override
  set repeatPassword(String? value) {
    _$repeatPasswordAtom.reportWrite(value, super.repeatPassword, () {
      super.repeatPassword = value;
    });
  }

  final _$obscureTextAtom = Atom(name: '_AccountControllerBase.obscureText');

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  final _$_AccountControllerBaseActionController =
      ActionController(name: '_AccountControllerBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRepeatPassword(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setRepeatPassword');
    try {
      return super.setRepeatPassword(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureText(bool value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setObscureText');
    try {
      return super.setObscureText(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
district: ${district},
city: ${city},
email: ${email},
password: ${password},
repeatPassword: ${repeatPassword},
obscureText: ${obscureText},
nameValid: ${nameValid},
districtValid: ${districtValid},
cityValid: ${cityValid},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
repeatPasswordValid: ${repeatPasswordValid}
    ''';
  }
}
