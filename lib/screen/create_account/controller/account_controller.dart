import 'package:mobx/mobx.dart';

import '/components/extensions/extensions.dart';
import '/components/shared_preferences_user/shared_preferences_user.dart';
import '/model/user/user.dart';
import '/repositories/user/user.dart';

part 'account_controller.g.dart';

class AccountController = _AccountControllerBase with _$AccountController;

abstract class _AccountControllerBase with Store {
  final _field = 'Este campo é obrigatório';

  ///name
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length >= 3;

  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///district
  @observable
  String? district;

  @action
  void setDistrict(String value) => district = value;

  @computed
  bool get districtValid => district != null && district!.length >= 3;

  String? get districtError {
    if (district == null || districtValid) {
      return null;
    } else if (district!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///city
  @observable
  String? city;

  @action
  void setCity(String value) => city = value;

  @computed
  bool get cityValid => city != null && city!.length >= 3;

  String? get cityError {
    if (city == null || cityValid) {
      return null;
    } else if (city!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///email
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get errorEmail =>
      email == null || emailValid ? null : "E-mail invalido";

  ///password
  @observable
  String? password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;

  String? get passwordError {
    if (passwordValid || password == null) {
      return null;
    } else if (password!.isEmpty) {
      return "Senha muito curto";
    } else {
      return _field;
    }
  }

  ///repastPassword
  @observable
  String? repeatPassword;

  @action
  void setRepeatPassword(String value) => repeatPassword = value;

  @computed
  bool get repeatPasswordValid =>
      repeatPassword != null && repeatPassword == password;

  String? get repeatPasswordError {
    if (repeatPasswordValid || repeatPassword == null) {
      return null;
    } else {
      return "Repetir a mesmo senha informada acima";
    }
  }

  ///obscureText
  @observable
  bool obscureText = true;

  @action
  void setObscureText(bool value) => obscureText = value;

  ///loading
  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  ///button
  @computed
  dynamic get pressed => emailValid &&
          passwordValid &&
          nameValid &&
          cityValid &&
          districtValid &&
          repeatPasswordValid
      ? _createAccount
      : null;

  @observable
  String? errorMessage;

  @action
  void setErrorMessage(String value) => errorMessage = value;

  @action
  Future<void> _createAccount() async {
    Usuario _usuario = Usuario(
      name: name!,
      district: district!,
      city: city!,
      isLogin: "firebase",
      email: email!,
    );
    try {
      await FirebaseUser()
          .createUser(email: email!, password: password!)
          .then((value) async {
        Usuario? _result = await FirebaseUser().saveInfoUser(usuario: _usuario);
        await SharedPreferencesUser().save(usuario: _result!);
      });
    } catch (e) {
      setErrorMessage(e.toString());
      return;
    }
  }
}
