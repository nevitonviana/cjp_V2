import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '/model/user/user_model.dart';

class SharedPreferencesUser {
  preferences() async {}

  Future<void> save({required Usuario usuario}) async {
    final _preferences = await SharedPreferences.getInstance();
    try {
      await _preferences.setString("user", jsonEncode(usuario.toMap()));
    } catch (e) {
      return Future.error("Erro ao salva seus dados no seu dispositivo ");
    }
  }

  Future<Usuario> getInfoSharedUser() async {
    try {
      final _preferences = await SharedPreferences.getInstance();
      final json = await jsonDecode(_preferences.get("user").toString());
      return Usuario.fromMap(json);
    } catch (e) {
      return Future.error("Erro ao busca suas informações");
    }
  }

  Future<void> remove() async {
    try {
      final _preferences = await SharedPreferences.getInstance();
      _preferences.remove("user");
      _preferences.clear();
    } catch (e) {
      return Future.error("Erro ao remove suas informações ");
    }
  }
}
