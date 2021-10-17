import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/components/controller/user_controller.dart';
import '/components/extensions/extensions.dart';
import '/model/user/user_model.dart';
import '/repositories/social_login/social_login.dart';
import '/repositories/user/user.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserController _userController = GetIt.I<UserController>();

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
        await FirebaseUser().getInfoUser().then((value) async =>
            await _userController.saveInfoUserSharedPreferences(user: value));
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
    try {
      final credential = await Facebook().signIn();

      if (credential != null) {
        await FirebaseUser().signInCredential(credential: credential);
        final _user = await Facebook().getInfoUser();
        await _userController.saveInfoUserSharedPreferences(user: _user);

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
      final credential = await Google().signIn();

      final result =
          await FirebaseUser().signInCredential(credential: credential);

      usuario.email = result!.user!.email!;
      usuario.name = result.user!.displayName!;
      usuario.photoUrl = result.user!.photoURL!;
      usuario.isLogin = "google";

      await _userController.saveInfoUserSharedPreferences(user: usuario);

      setLoginConfirmed(true);
    } catch (e) {
      setError(e.toString());
      await Google().signOut();
      return;
    }
  }
}
