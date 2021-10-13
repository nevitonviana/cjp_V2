import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '/model/occurrence/occurrence.dart';

class FirebaseOccurrence {
  final FirebaseFirestore _db1 = FirebaseFirestore.instance;
  final CollectionReference _db =
      FirebaseFirestore.instance.collection('users');
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final _collectionPath = "ocorrencias";

  Future<void> saveOccurrence({required Occurrence occurrence}) async {
    try {
      await _db.doc(occurrence.id).set(occurrence.toMap());
      return;
    } catch (e) {
      return;
    }
  }

  Future savaImageStorage({
    required List listImage,
    required String idOccurrence,
  }) async {
    Reference pastaRaiz = _storage.ref();
    List _images = [];
    try {
      for (var _imagem in listImage) {
        String _nomeDaImagem = DateTime.now().millisecondsSinceEpoch.toString();
        Reference arquivo = pastaRaiz
            .child("imagensDeOcorrencias")
            .child(idOccurrence)
            .child(_nomeDaImagem);
        UploadTask uploadTask = arquivo.putFile(_imagem);
        uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
          if (taskSnapshot.state == TaskState.success) {}
        });
        final get = await uploadTask.whenComplete(() {});
        String url = await get.ref.getDownloadURL();
        _images.add(url);
      }
      return _images;
    } catch (error) {
      return null;
    }
  }

  Future<void> updateOccurrence({required Occurrence occurrence}) async {
    try {
      await _db.doc(occurrence.id).set(occurrence.toMap());
      return;
    } catch (e) {
      return;
    }
  }

  Future<void> getOccurrence() async {}

  Future<void> deleteOccurrence({required Occurrence occurrence}) async {
    try {
      if (await deletePhotoOccurrence(occurrence: occurrence)) {
        await _db.doc(occurrence.id).delete();
      }
      return;
    } catch (e) {
      return;
    }
  }

  deletePhotoOccurrence({required Occurrence occurrence}) async {
    Reference pastaRaiz = _storage.ref();
    try {
      for (var image in occurrence.photoReference!) {
        Reference arquivo = pastaRaiz
            .child("imagens_Ocorrencias")
            .child(occurrence.id!)
            .child(image);
        arquivo.delete();
      }
      return true;
    } catch (erro) {
      return false;
    }
  }
}
