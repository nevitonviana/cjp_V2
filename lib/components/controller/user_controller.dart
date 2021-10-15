import 'package:mobx/mobx.dart';

import '/model/user/user.dart';
import '../shared_preferences_user/shared_preferences_user.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final SharedPreferencesUser _preferencesUser = SharedPreferencesUser();

  _UserControllerBase() {
    _getInfoUserSharedPreferences();
  }

  _getInfoUserSharedPreferences() async {
    final result = await _preferencesUser.getInfoSharedUser();
    user = result;
  }

  @observable
  Usuario? user;

  @action
  void _setUser(Usuario? value) => user = value;

  @action
  Future<void> saveInfoUserSharedPreferences({required Usuario user}) async {
    _setUser(user);
    await _preferencesUser.save(usuario: user);
  }

  Future<void> deleteInfoUserSharedPreferences() async {
    _setUser(null);
    await _preferencesUser.remove();
  }
}
