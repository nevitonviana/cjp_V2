// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  Usuario? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Usuario? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loadingSingOutAtom = Atom(name: '_UserControllerBase.loadingSingOut');

  @override
  bool get loadingSingOut {
    _$loadingSingOutAtom.reportRead();
    return super.loadingSingOut;
  }

  @override
  set loadingSingOut(bool value) {
    _$loadingSingOutAtom.reportWrite(value, super.loadingSingOut, () {
      super.loadingSingOut = value;
    });
  }

  final _$saveInfoUserSharedPreferencesAsyncAction =
      AsyncAction('_UserControllerBase.saveInfoUserSharedPreferences');

  @override
  Future<void> saveInfoUserSharedPreferences({required Usuario user}) {
    return _$saveInfoUserSharedPreferencesAsyncAction
        .run(() => super.saveInfoUserSharedPreferences(user: user));
  }

  final _$deleteInfoUserSharedPreferencesAsyncAction =
      AsyncAction('_UserControllerBase.deleteInfoUserSharedPreferences');

  @override
  Future<void> deleteInfoUserSharedPreferences() {
    return _$deleteInfoUserSharedPreferencesAsyncAction
        .run(() => super.deleteInfoUserSharedPreferences());
  }

  final _$signOutAsyncAction = AsyncAction('_UserControllerBase.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  void _setUser(Usuario? value) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase._setUser');
    try {
      return super._setUser(value);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingSingOut(bool value) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.setLoadingSingOut');
    try {
      return super.setLoadingSingOut(value);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
loadingSingOut: ${loadingSingOut}
    ''';
  }
}
