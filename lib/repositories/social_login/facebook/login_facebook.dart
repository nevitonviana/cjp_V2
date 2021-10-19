import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '/model/user/user_model.dart';

class Facebook {
  Future<OAuthCredential?> signIn() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);

      switch (loginResult.status) {
        case LoginStatus.success:
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(loginResult.accessToken!.token);
          return facebookAuthCredential;
        case LoginStatus.cancelled:
          return null;
        case LoginStatus.failed:
          return Future.error("Error ao entrar com facebook");
        case LoginStatus.operationInProgress:
          break;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> logOut() async {
    await FacebookAuth.i.logOut();
  }

  Future<Usuario> getInfoUser() async {
    Usuario _user = Usuario();
    final result = await FacebookAuth.instance.getUserData();
    _user.name = result['name'];
    _user.email = result['email'];
    _user.photoUrl = result['picture']['data']['url'];
    _user.isLogin = "facebook";
    return _user;
  }
}
