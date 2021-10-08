import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../user/user.dart';

class Google {
  final GoogleSignIn _googleUser = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  //TODO credential
  Future<UserCredential?> signInWithGoogle() async {
    // final GoogleSignInAccount? _googleUser = await GoogleSignIn().signIn();
    try {
      final _user = await _googleUser.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await _user?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseUser().signInCredential(credential: credential);
      //FirebaseAuth.instance.signInWithCredential(credential);}
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> signOut() async {
    await _googleUser.signOut();
  }
}
