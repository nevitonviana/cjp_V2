import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '/components/controller/user_controller.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final UserController _userController = GetIt.I<UserController>();

  _ProfileControllerBase() {
    name = _userController.usuario!.name;
    district = _userController.usuario!.district;
    city = _userController.usuario!.city;
    image =
        "https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg";
  }

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
  dynamic image;

  @action
  void setImage(dynamic value) => image = value;

  @computed
  bool get imageValid => image != null;

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
  dynamic get profilePressed =>
      districtValid && cityValid && nameValid && imageValid
          ? _saveProfile
          : null;

  @action
  Future<void> _saveProfile() async {}
}
