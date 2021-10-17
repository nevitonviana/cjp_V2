import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '/components/controller/user_controller.dart';
import '/model/user/user_model.dart';
import '/repositories/user/user.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final UserController _userController = GetIt.I<UserController>();
  Usuario _user = Usuario();

  _ProfileControllerBase() {
    _userController.user!.photoUrl =
        "https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg";
    name = _userController.user!.name;
    district = _userController.user!.district;
    city = _userController.user!.city;
    image = _userController.user?.photoUrl;
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

  @observable
  String? imageError;

  @action
  void setImageError(String value) => imageError = value;

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

  /// confirm if saved
  @observable
  bool saveInfo = false;

  @action
  void setSaveInfo(bool value) => saveInfo = value;

  /// loading
  /// @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  ///button
  @computed
  dynamic get profilePressed =>
      districtValid && cityValid && nameValid ? _saveProfile : null;

  @action
  Future<void> _saveProfile() async {
    setLoading(true);
    _user = _userController.user!;
    _user.name = name;
    _user.city = city;
    _user.district = district;
    try {
      if (image.runtimeType != String) {
        await FirebaseUser()
            .saveImage(id: _user.id, image: image)
            .then((value) async {
          _user.photoUrl = value;
          await FirebaseUser().saveInfoUser(usuario: _user).then((value) async {
            await _userController.saveInfoUserSharedPreferences(user: _user);
            setSaveInfo(true);
          });
        });
      } else if (_userController.user!.photoUrl.isNotEmpty) {
        await FirebaseUser().saveInfoUser(usuario: _user).then((value) async {
          await _userController.saveInfoUserSharedPreferences(user: _user);
          setSaveInfo(true);
        });
      } else {
        setImageError("[ insira uma imagem de perfil ]");
      }
    } catch (e) {
      setMassageError(e.toString());
      return;
    }
    setLoading(false);
  }
}
