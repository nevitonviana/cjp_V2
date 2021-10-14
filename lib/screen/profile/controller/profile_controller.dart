import 'dart:io';

import 'package:cjp_v2/model/user/user.dart';
import 'package:cjp_v2/repositories/user/user.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '/components/controller/user_controller.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final UserController _userController = GetIt.I<UserController>();
  Usuario _usuario = Usuario();

  _ProfileControllerBase() {
    name = _userController.usuario!.name;
    district = _userController.usuario!.district;
    city = _userController.usuario!.city;
    // image = _userController.usuario?.photoUrl;
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

  /// Massage Error
  @observable
  String? massageError;

  @action
  void setMassageError(String value) => massageError = value;

  ///button
  @computed
  dynamic get profilePressed =>
      districtValid && cityValid && nameValid ? _saveProfile : null;

  @action
  Future<void> _saveProfile() async {
    _usuario = _userController.usuario!;
    _usuario.name = name;
    _usuario.city = city;
    _usuario.district = district;
    try {
      image.runtimeType != String
          ? await FirebaseUser()
              .saveImage(id: _usuario.id, image: image)
              .then((value) async {
              _usuario.photoUrl = value;
              await FirebaseUser().saveInfoUser(usuario: _usuario);
            })
          : await FirebaseUser().saveInfoUser(usuario: _usuario);
    } catch (e) {
      setMassageError(e.toString());
      return;
    }
  }
}
