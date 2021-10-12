import 'package:mobx/mobx.dart';

part 'add_or_edit.g.dart';

class AddOrEditController = _AddOrEditControllerBase with _$AddOrEditController;

abstract class _AddOrEditControllerBase with Store {
  /// field listImage
  ObservableList listImage = ObservableList();

  /// field city
  @observable
  String? city;

  @action
  void setCity(String value) => city = value;

  @computed
  bool get cityValid => city != null && city!.length >= 3;

  String? get nameError {
    if (city == null || cityValid) {
      return null;
    } else if (city!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field district
  @observable
  String? district;

  @action
  void setDistrict(String value) => district = value;

  @computed
  bool get districtValid => district != null && district!.length >= 3;

  String? get districtError {
    if (district == null || districtValid) {
      return null;
    } else if (district!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field road
  @observable
  String? road;

  @action
  void setRoad(String value) => road = value;

  @computed
  bool get roadValid => road != null && road!.length >= 3;

  String? get roadError {
    if (road == null || roadValid) {
      return null;
    } else if (road!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field name Occurrence
  @observable
  String? nameOccurrence;

  @action
  void setNameOccurrence(String value) => nameOccurrence = value;

  @computed
  bool get nameOccurrenceValid =>
      nameOccurrence != null && nameOccurrence!.length >= 3;

  String? get nameOccurrenceError {
    if (nameOccurrence == null || nameOccurrenceValid) {
      return null;
    } else if (nameOccurrence!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field discretion

  @observable
  String? discretion;

  @action
  void setDiscretion(String value) => discretion = value;

  @computed
  bool get discretionValid => discretion != null && discretion!.length >= 3;

  String? get discretionError {
    if (discretion == null || discretionValid) {
      return null;
    } else if (discretion!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///button
  @computed
  dynamic get loginPressed => districtValid ? _addOrEditOccurrence : null;

  @action
  Future<void> _addOrEditOccurrence() async {}
}
