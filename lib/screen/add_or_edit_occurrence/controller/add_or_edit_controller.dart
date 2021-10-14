import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '/components/shared_preferences_user/shared_preferences_user.dart';
import '/model/occurrence/occurrence.dart';
import '/model/user/user.dart';
import '/repositories/occurrence/occurrence.dart';

part 'add_or_edit_controller.g.dart';

class AddOrEditController = _AddOrEditControllerBase with _$AddOrEditController;

abstract class _AddOrEditControllerBase with Store {
  /// variables
  final SharedPreferencesUser _preferencesUser = SharedPreferencesUser();
  late Occurrence occurrence;

  _AddOrEditControllerBase() {
    _getCity();
    occurrence = Occurrence.geraId();
  }

  late final Usuario _result;

  void _getCity() async {
    _result = await _preferencesUser.getInfoSharedUser();
    if (_result.city.isNotEmpty) {
      setCity(_result.city);
    }
  }

  /// field listImage
  ObservableList listImage = ObservableList();

  @computed
  bool get imageValid => listImage.isNotEmpty;

  String? get imageError {
    if (!showErrors || imageValid) {
      return null;
    } else {
      return "[necessário inserir imagem]";
    }
  }

  /// field city
  @observable
  String city = "";

  @action
  void setCity(String value) => city = value;

  @computed
  bool get cityValid => city.length >= 3;

  String? get cityError {
    if (!showErrors || cityValid) {
      return null;
    } else if (city.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field district
  @observable
  String district = "";

  @action
  void setDistrict(String value) => district = value;

  @computed
  bool get districtValid => district.length >= 3;

  String? get districtError {
    if (!showErrors || districtValid) {
      return null;
    } else if (district.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field road
  @observable
  String road = "";

  @action
  void setRoad(String value) => road = value;

  @computed
  bool get roadValid => road.length >= 3;

  String? get roadError {
    if (!showErrors || roadValid) {
      return null;
    } else if (road.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field name Occurrence
  @observable
  String nameOccurrence = "";

  @action
  void setNameOccurrence(String value) => nameOccurrence = value;

  @computed
  bool get nameOccurrenceValid => nameOccurrence.length >= 3;

  String? get nameOccurrenceError {
    if (!showErrors || nameOccurrenceValid) {
      return null;
    } else if (nameOccurrence.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  ///field discretion

  @observable
  String discretion = "";

  @action
  void setDiscretion(String value) => discretion = value;

  @computed
  bool get discretionValid => discretion.length >= 10;

  String? get discretionError {
    if (!showErrors || discretionValid) {
      return null;
    } else if (discretion.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  ///invalidSendPressed
  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @action
  Future<void> getImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      listImage.add(File(image!.path));
    } catch (e) {
      return;
    }
  }

  @action
  Future<void> getImageCamera() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      listImage.add(File(photo!.path));
    } catch (e) {
      return;
    }
  }

  ///button
  @computed
  dynamic get loginPressed => discretionValid ? _addOrEditOccurrence : null;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  String? massageError;

  @action
  void setMassageError(String value) => massageError = value;

  @observable
  bool save = false;

  @action
  void setSave(bool value) => save = value;

  @action
  Future<void> _addOrEditOccurrence() async {
    loading = true;

    occurrence.idUser = _result.id;
    occurrence.city = city;
    occurrence.district = district;
    occurrence.road = road;
    occurrence.nameOccurrence = nameOccurrence;
    occurrence.description = discretion;
    occurrence.hour = DateTime.now().toString();

    try {
      await FirebaseOccurrence()
          .savaImageStorage(listImage: listImage, idOccurrence: occurrence.id!)
          .then((value) async {
        occurrence.listPhotos = value["listUrl"];
        occurrence.photoReference = value["listReference"];
        await FirebaseOccurrence()
            .saveOccurrence(occurrence: occurrence)
            .then((value) => setSave(true));
      });
    } catch (e) {
      setMassageError(e.toString());
      return;
    }
    loading = false;
  }
}
