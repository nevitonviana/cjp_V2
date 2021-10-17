import 'package:cjp_v2/model/user/user_model.dart';
import 'package:mobx/mobx.dart';

import '/components/extensions/extensions.dart';
import '/components/shared_preferences_user/shared_preferences_user.dart';
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

  //login confirmed
  @observable
  bool loginConfirmed = false;

  @action
  void setLoginConfirmed(bool value) => loginConfirmed = value;

  //button
  @computed
  dynamic get pressed => emailValid && passwordValid ? _login : null;

  @action
  Future<void> _login() async {
    loading = true;
    try {
      await FirebaseUser()
          .signIn(email: email!.trim(), password: password!.trim())
          .then((value) async {
        await SharedPreferencesUser()
            .save(usuario: await FirebaseUser().getInfoUser());
      });
      setLoginConfirmed(true);
    } catch (e) {
      setError(e.toString());
    }
    loading = false;
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
    Usuario usuario = Usuario();
    try {
      final result = await Facebook().signIn();
      if (result?.user != null) {
        usuario.email = result!.user!.email!;
        usuario.name = result.user!.displayName!;
        usuario.photoUrl = result.user!.photoURL!;
        usuario.isLogin = "facebook";
        await SharedPreferencesUser().save(usuario: usuario);
        setLoginConfirmed(true);
      }
    } catch (e) {
      setError(e.toString());
      await Facebook().logOut();
      return;
    }
  }

  //signInGoogle
  Future signInGoogle() async {
    Usuario usuario = Usuario();
    try {
      final result = await Google().signIn();
      usuario.email = result!.user!.email!;
      usuario.name = result.user!.displayName!;
      usuario.photoUrl = result.user!.photoURL!;
      usuario.isLogin = "google";
      await SharedPreferencesUser().save(usuario: usuario);
      setLoginConfirmed(true);
    } catch (e) {
      setError(e.toString());
      await Google().signOut();
      return;
    }
  }
}
