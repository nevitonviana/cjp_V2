import 'package:cloud_firestore/cloud_firestore.dart';

class Occurrence {
  String? id;
  String? idUser;
  String? nameOccurrence;
  String? city;
  String? district;
  String? road;
  String? description;
  List<String>? photos = [];
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
    this.photos,
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
      "fotos": photos,
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
    photos = [];
    feedback = occurrence.feedback;
    hour = occurrence.hour;
    visible = occurrence.visible;
    status = occurrence.status;
    photoReference = occurrence.photoReference;
  }

  Occurrence.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    idUser = snapshot["idUser"];
    nameOccurrence = snapshot["nomeOcorrencia"];
    district = snapshot["bairro"];
    city = snapshot["cidade"];
    road = snapshot["ruaAv"];
    description = snapshot["descricao"];
    photos = List<String>.from(snapshot["fotos"]);
    feedback = snapshot["feedback"];
    hour = snapshot["hora"];
    visible = snapshot["visivel"];
    status = snapshot["status"];
    photoReference = List<String>.from(snapshot["referenciasFotos"]);
  }

  Occurrence.geraId() {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    CollectionReference idOccurrence = _db.collection("ocorrencias");
    id = idOccurrence.doc().id;
    photos = [];
    photoReference = [];
  }
}
