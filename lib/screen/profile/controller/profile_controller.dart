import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  ///name
  @observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name.isNotEmpty;

  String? get nameError {
    if (!showErrors || nameValid) {
      return null;
    } else {
      return "Compo Obrigatorio";
    }
  }

  ///city
  @observable
  String city = "";

  @action
  void setCity(String value) => city = value;

  @computed
  bool get cityValid => city.isNotEmpty;

  String? get cityError {
    if (!showErrors || cityValid) {
      return null;
    } else {
      return "Compo Obrigatorio";
    }
  }

  ///district
  @observable
  String district = "";

  @action
  void setDistrict(String value) => district = value;

  @computed
  bool get districtValid => district.isNotEmpty;

  String? get districtError {
    if (!showErrors || districtValid) {
      return null;
    } else {
      return "Compo Obrigatorio";
    }
  }

  ///image
  @observable
  var image;

  @action
  void setImage(var value) => image = value;

  @computed
  bool get imageValid => image.isNotEmpty;

  String? get imageError {
    if (!showErrors || imageValid) {
      return null;
    } else {
      return "[necessário inserir imagem]";
    }
  }

  ///invalidSendPressed
  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  ///get image
  @action
  Future<void> getImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
      setImage(File(photo!.path));
    } catch (e) {
      return;
    }
  }

  ///button
  @computed
  dynamic get profilePressed => districtValid ? _saveProfile : null;

  @action
  Future<void> _saveProfile() async {}
}
