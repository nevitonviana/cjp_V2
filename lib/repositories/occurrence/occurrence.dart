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
    Reference _rootFolder = firebaseStorage.ref();
    List<String> listReference = [];
    List<String> listUrl = [];
    try {
      for (var _image in listImage) {
        String _nameImage = DateTime.now().millisecondsSinceEpoch.toString();

        if (_image.runtimeType != String) {
          Reference _file = _rootFolder
              .child("imagens_Ocorrencias")
              .child(idOccurrence)
              .child(_nameImage);

          UploadTask uploadTask = _file.putFile(_image as File);

          uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
            if (taskSnapshot.state == TaskState.success) {}
          });

          final get = await uploadTask.whenComplete(() {});

          String url = await get.ref.getDownloadURL();

          listReference.add(_nameImage);

          listUrl.add(url);
        }
      }
      return {"listReference": listReference, "listUrl": listUrl};
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> getOccurrence() async {}

  Future<void> deleteOccurrence({required OccurrenceModel occurrence}) async {
    try {
      if (await deletePhotoOccurrence(
          id: occurrence.id!, photoReference: occurrence.photoReference!)) {
        await _db.doc(occurrence.id).delete();
      }
      return;
    } catch (e) {
      return;
    }
  }

  deletePhotoOccurrence(
      {required List photoReference, required String id}) async {
    Reference _rootFolder = _storage.ref();
    try {
      for (var image in photoReference) {
        Reference _file =
            _rootFolder.child("imagens_Ocorrencias").child(id).child(image);
        _file.delete();
      }
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }
}
