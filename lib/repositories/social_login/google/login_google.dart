import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google {
  final GoogleSignIn _googleUser = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  Future<OAuthCredential> signIn() async {
    try {
      final _user = await _googleUser.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await _user?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return credential;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> signOut() async {
    await _googleUser.signOut();
  }
}
