import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/model/user/user.dart';
import '../firebase_error.dart';

class FirebaseUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return Future.error(FirebaseError.getDescription(e.hashCode).toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> createUser({required Usuario user}) async {
    try {
      _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Usuario> getInfoUser() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('usuarios')
          .doc(_auth.currentUser!.uid)
          .get();
      return Usuario.fromDocumentSnapshot(snapshot);
    } catch (e) {
      return Future.error(
          "Não foi possível buscar suas informações no banco de dados");
    }
  }

  //TODO credential
  Future<UserCredential?> signInCredential(
      {required AuthCredential credential}) async {
    try {
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      return Future.error(
          "Já existe uma conta com o mesmo endereço de e-mail, mas com credenciais de login diferentes");
    }
  }
}
