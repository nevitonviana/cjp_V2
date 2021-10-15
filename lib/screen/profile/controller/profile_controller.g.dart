// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_ProfileControllerBase.nameValid'))
          .value;
  Computed<bool>? _$cityValidComputed;

  @override
  bool get cityValid =>
      (_$cityValidComputed ??= Computed<bool>(() => super.cityValid,
              name: '_ProfileControllerBase.cityValid'))
          .value;
  Computed<bool>? _$districtValidComputed;

  @override
  bool get districtValid =>
      (_$districtValidComputed ??= Computed<bool>(() => super.districtValid,
              name: '_ProfileControllerBase.districtValid'))
          .value;
  Computed<dynamic>? _$profilePressedComputed;

  @override
  dynamic get profilePressed => (_$profilePressedComputed ??= Computed<dynamic>(
          () => super.profilePressed,
          name: '_ProfileControllerBase.profilePressed'))
      .value;

  final _$nameAtom = Atom(name: '_ProfileControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$cityAtom = Atom(name: '_ProfileControllerBase.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$districtAtom = Atom(name: '_ProfileControllerBase.district');

  @override
  String get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(String value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  final _$imageAtom = Atom(name: '_ProfileControllerBase.image');

  @override
  dynamic get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(dynamic value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$imageErrorAtom = Atom(name: '_ProfileControllerBase.imageError');

  @override
  String? get imageError {
    _$imageErrorAtom.reportRead();
    return super.imageError;
  }

  @override
  set imageError(String? value) {
    _$imageErrorAtom.reportWrite(value, super.imageError, () {
      super.imageError = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_ProfileControllerBase.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$massageErrorAtom = Atom(name: '_ProfileControllerBase.massageError');

  @override
  String? get massageError {
    _$massageErrorAtom.reportRead();
    return super.massageError;
  }

  @override
  set massageError(String? value) {
    _$massageErrorAtom.reportWrite(value, super.massageError, () {
      super.massageError = value;
    });
  }

  final _$saveInfoAtom = Atom(name: '_ProfileControllerBase.saveInfo');

  @override
  bool get saveInfo {
    _$saveInfoAtom.reportRead();
    return super.saveInfo;
  }

  @override
  set saveInfo(bool value) {
    _$saveInfoAtom.reportWrite(value, super.saveInfo, () {
      super.saveInfo = value;
    });
  }

  final _$getImageGalleryAsyncAction =
      AsyncAction('_ProfileControllerBase.getImageGallery');

  @override
  Future<void> getImageGallery() {
    return _$getImageGalleryAsyncAction.run(() => super.getImageGallery());
  }

  final _$_saveProfileAsyncAction =
      AsyncAction('_ProfileControllerBase._saveProfile');

  @override
  Future<void> _saveProfile() {
    return _$_saveProfileAsyncAction.run(() => super._saveProfile());
  }

  final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImage(dynamic value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageError(String value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setImageError');
    try {
      return super.setImageError(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMassageError(String value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setMassageError');
    try {
      return super.setMassageError(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSaveInfo(bool value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setSaveInfo');
    try {
      return super.setSaveInfo(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
city: ${city},
district: ${district},
image: ${image},
imageError: ${imageError},
showErrors: ${showErrors},
massageError: ${massageError},
saveInfo: ${saveInfo},
nameValid: ${nameValid},
cityValid: ${cityValid},
districtValid: ${districtValid},
profilePressed: ${profilePressed}
    ''';
  }
}
