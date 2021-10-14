import 'package:cloud_firestore/cloud_firestore.dart';

class Occurrence {
  String? id;
  String? idUser;
  String? nameOccurrence;
  String? city;
  String? district;
  String? road;
  String? description;
  List<String>? listPhotos = [];
  String? feedback;
  String? hour;
  bool visible = true;
  bool status = false;
  List<String>? photoReference = [];

  Occurrence({
    this.id,
    this.idUser,
    this.nameOccurrence,
    this.city,
    this.district,
    this.road,
    this.description,
    this.listPhotos,
    this.feedback,
    this.hour,
    this.visible = true,
    this.status = false,
    this.photoReference,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idUser": idUser,
      "nomeOcorrencia": nameOccurrence,
      "cidade": city,
      "bairro": district,
      "ruaAv": road,
      "descricao": description,
      "fotos": listPhotos,
      "feedback": feedback,
      "hora": hour,
      "visivel": visible,
      "status": status,
      "referenciasFotos": photoReference,
    };
  }

  Occurrence.update(Occurrence occurrence) {
    id = occurrence.id;
    idUser = occurrence.idUser;
    nameOccurrence = occurrence.nameOccurrence;
    district = occurrence.district;
    city = occurrence.city;
    road = occurrence.road;
    description = occurrence.description;
    listPhotos = [];
    feedback = occurrence.feedback;
    hour = occurrence.hour;
    visible = occurrence.visible;
    status = occurrence.status;
    photoReference = occurrence.photoReference;
  }

  Occurrence.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    idUser = snapshot.get("idUser");
    nameOccurrence = snapshot.get("nomeOcorrencia");
    district = snapshot.get("bairro");
    city = snapshot.get("cidade");
    road = snapshot.get("ruaAv");
    description = snapshot.get("descricao");
    listPhotos = List<String>.from(snapshot.get("fotos"));
    feedback = snapshot.get("feedback");
    hour = snapshot.get("hora");
    visible = snapshot.get("visivel");
    status = snapshot.get("status");
    photoReference = List<String>.from(snapshot.get("referenciasFotos"));
  }

  Occurrence.geraId() {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    CollectionReference idOccurrence = _db.collection("ocorrencias");
    id = idOccurrence.doc().id;
    listPhotos = [];
    photoReference = [];
  }
}
