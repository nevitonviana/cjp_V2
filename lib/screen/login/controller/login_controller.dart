import 'package:mobx/mobx.dart';

import '/components/extensions/extensions.dart';
import '/repositories/social_login/social_login.dart';
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

  @action
  Future<void> _login() async {
    await FirebaseUser().signIn(email: email!, password: password!);
  }

  //loading
  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  //massage error
  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  //signInFacebook
  Future signInFacebook() async {
    final result = await Facebook().signIn();
    if (result?.user != null) {
    } else if (result == null) {
    } else {}
  }

  //signInGoogle
  Future signInGoogle() async {
    final result = await Google().signIn();
    if (result?.user != null) {
    } else {}
  }
}
