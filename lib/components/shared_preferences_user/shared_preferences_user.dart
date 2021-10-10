import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '/model/user/user.dart';

class SharedPreferencesUser {
  preferences() async {}

  save({required Usuario usuario}) async {
    final _preferences = await SharedPreferences.getInstance();
    try {
      await _preferences.setString("user", jsonEncode(usuario.toMap()));
    } catch (e) {
      return;
    }
  }

  getInfoSharedUser() async {
    final _preferences = await SharedPreferences.getInstance();
    final json = await jsonDecode(_preferences.get("user").toString());
    return Usuario.fromMap(json);
  }

  remove() async {
    final _preferences = await SharedPreferences.getInstance();
    _preferences.remove("user");
    _preferences.clear();
  }
}
