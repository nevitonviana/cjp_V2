import 'package:mobx/mobx.dart';

import '/components/extensions/extensions.dart';
import '/repositories/user/user.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  // text field
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get errorEmail =>
      email == null || emailValid ? null : "E-mail Invalido";

  //  password field
  @observable
  String? password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;

  String? get errorPassword => password == null || passwordValid
      ? null
      : "Senha requer mais de 5 caracteres";

  //visibility password
  @observable
  bool visibilityPassword = true;

  @action
  void setVisibilityPassword(bool value) => visibilityPassword = value;

  //button
  @computed
  dynamic get loginPressed => emailValid && passwordValid ? _login : null;

  void _login() async {
    await FirebaseUser().signIn(email: email!, password: password!);
  }
}
