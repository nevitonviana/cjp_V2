import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String id = "";
  String name = "";
  String district = "";
  String city = "";
  String photoUrl = "";
  bool admin = false;
  String isLogin = "";
  String photoReference = "";
  String email = "";

  Usuario({
    this.id = "",
    this.name = "",
    this.district = "",
    this.city = "",
    this.photoUrl = "",
    this.isLogin = "",
    this.admin = false,
    this.photoReference = "",
    this.email = "",
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": name,
      "bairro": district,
      "cidade": city,
      "fotoURL": photoUrl,
      "admin": admin,
      "isLogin": isLogin,
      "referenciaFoto": photoReference,
    };
  }

  Usuario.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    name = snapshot.get("nome");
    district = snapshot.get("bairro");
    city = snapshot.get("cidade");
    photoUrl = snapshot.get("fotoURL");
    isLogin = snapshot.get("isLogin");
    admin = snapshot.get("admin");
    photoReference = snapshot.get("referenciaFoto");
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map["id"],
      name: map["nome"],
      district: map["bairro"],
      city: map["cidade"],
      photoUrl: map["fotoURL"],
      admin: map["admin"],
      isLogin: map["isLogin"],
      photoReference: map["referenciaFoto"],
    );
  }
}
