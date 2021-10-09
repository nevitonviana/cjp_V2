import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '/repositories/user/user.dart';

class Facebook {
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]);
    final userData = await FacebookAuth.instance.getUserData();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    switch (loginResult.status) {
      case LoginStatus.operationInProgress:
        break;
      case LoginStatus.success:
        FirebaseUser().signInCredential(credential: facebookAuthCredential);
        break;
      case LoginStatus.cancelled:
        break;
      case LoginStatus.failed:
        break;
    }
    return null;
  }

  Future<void> logOut() async {
    await FacebookAuth.i.logOut();
  }
}
