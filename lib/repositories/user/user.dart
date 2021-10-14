import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return Future.error(FirebaseError.getDescription(e.hashCode).toString());
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

  Future<Usuario?> saveInfoUser({required Usuario usuario}) async {
    usuario.id = _auth.currentUser!.uid;
    try {
      await _firestore
          .collection('usuarios')
          .doc(usuario.id)
          .set(usuario.toMap());
      return usuario;
    } catch (e) {
      return Future.error(
          "Não foi possível salva suas informações no banco de dados");
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

  Future saveImage({required String id, required File image}) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference folderSource = firebaseStorage.ref();
    try {
      Reference folder = folderSource.child("Foto_De_Perfil").child(id);
      UploadTask uploadTask = folder.putFile(image);
      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        if (taskSnapshot.state == TaskState.success) {}
      });
      final get = await uploadTask.whenComplete(() {});
      String url = await get.ref.getDownloadURL();
      return url;
    } catch (e) {
      return Future.error("Error ao salvar imagem");
    }
  }
}
