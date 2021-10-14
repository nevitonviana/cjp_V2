import 'package:mobx/mobx.dart';

import '/model/user/user.dart';
import '../shared_preferences_user/shared_preferences_user.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  _UserControllerBase() {
    _getInfoUserSharedPreferences();
  }

  _getInfoUserSharedPreferences() async {
    final SharedPreferencesUser preferencesUser = SharedPreferencesUser();
    final result = await preferencesUser.getInfoSharedUser();
    usuario = result;
  }

  @observable
  Usuario? usuario;
}
