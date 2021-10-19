class FeedBackModel {
  String? nameUser;
  String? faultName;
  String? description;

  FeedBackModel({
    this.nameUser,
    this.faultName,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      "nomeUsuario": nameUser,
      "ondeFalhar": faultName,
      "descricaoFalhar": description,
    };
  }
}
