import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '/repositories/user/user.dart';

class Facebook {
  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);

      switch (loginResult.status) {
        case LoginStatus.success:
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(loginResult.accessToken!.token);
          return await FirebaseUser()
              .signInCredential(credential: facebookAuthCredential);
        case LoginStatus.cancelled:
          return null;
        case LoginStatus.failed:
          return Future.error("login error with facebook");
        case LoginStatus.operationInProgress:
          break;
      }
    } catch (e) {
      return Future.error("unexpected failure");
    }
  }

  Future<void> logOut() async {
    await FacebookAuth.i.logOut();
  }

  Future getInfoUser() async {
    return await FacebookAuth.instance.getUserData();
  }
}
