import 'package:cjp_v2/repositories/social_login/google/login_google.dart';
import 'package:cjp_v2/repositories/social_login/social_login.dart';
import 'package:cjp_v2/repositories/user/user.dart';
import 'package:mobx/mobx.dart';

import '/model/user/user_model.dart';
import '../shared_preferences_user/shared_preferences_user.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final SharedPreferencesUser _preferencesUser = SharedPreferencesUser();

  _UserControllerBase() {
    _getInfoUserSharedPreferences();
  }

  ///get info user
  _getInfoUserSharedPreferences() async {
    final result = await _preferencesUser.getInfoSharedUser();
    user = result;
  }

  /// user
  @observable
  Usuario? user;

  @action
  void _setUser(Usuario? value) => user = value;

  ///save info user
  @action
  Future<void> saveInfoUserSharedPreferences({required Usuario user}) async {
    _setUser(user);
    await _preferencesUser.save(usuario: user);
  }

  ///delete info user
  @action
  Future<void> deleteInfoUserSharedPreferences() async {
    _setUser(null);
    await _preferencesUser.remove();
  }

  ///
  @observable
  bool? loadingSingOut = false;

  @action
  void setLoadingSingOut(bool value) => loadingSingOut = value;

  /// signOut
  @action
  Future<void> signOut() async {
    setLoadingSingOut(true);
    try {
      if (user!.isLogin == "google") {
        await Google().signOut();
      } else if (user!.isLogin == "facebook") {
        await Facebook().logOut();
      }
      await FirebaseUser().signOut();
      await deleteInfoUserSharedPreferences();
    } catch (e) {
      return;
    }
    setLoadingSingOut(false);
  }
}
