import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '/model/occurrence/occurrence_model.dart';

class FirebaseOccurrence {
  // final FirebaseFirestore _db1 = FirebaseFirestore.instance;
  final CollectionReference _db =
      FirebaseFirestore.instance.collection('ocorrencias');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // final _collectionPath = "ocorrencias";

  Future<void> saveOccurrence({required OccurrenceModel occurrence}) async {
    try {
      await _db.doc(occurrence.id).set(occurrence.toMap());
      return;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future savaImageStorage({
    required List listImage,
    required String idOccurrence,
  }) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference folderSource = firebaseStorage.ref();
    List<String> listReference = [];
    List<String> listUrl = [];
    try {
      for (var _image in listImage) {
        String _nameImage = DateTime.now().millisecondsSinceEpoch.toString();

        Reference folder = folderSource
            .child("imagens_Ocorrencias")
            .child(idOccurrence)
            .child(_nameImage);

        UploadTask uploadTask = folder.putFile(_image as File);

        uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
          if (taskSnapshot.state == TaskState.success) {}
        });

        final get = await uploadTask.whenComplete(() {});

        String url = await get.ref.getDownloadURL();

        listReference.add(_nameImage);

        listUrl.add(url);
      }
      return {"listReference": listReference, "listUrl": listUrl};
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> updateOccurrence({required OccurrenceModel occurrence}) async {
    try {
      await _db.doc(occurrence.id).set(occurrence.toMap());
      return;
    } catch (e) {
      return;
    }
  }

  Future<void> getOccurrence() async {}

  Future<void> deleteOccurrence({required OccurrenceModel occurrence}) async {
    try {
      if (await deletePhotoOccurrence(occurrence: occurrence)) {
        await _db.doc(occurrence.id).delete();
      }
      return;
    } catch (e) {
      return;
    }
  }

  deletePhotoOccurrence({required OccurrenceModel occurrence}) async {
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
