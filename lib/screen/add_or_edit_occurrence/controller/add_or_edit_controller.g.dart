// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddOrEditController on _AddOrEditControllerBase, Store {
  Computed<bool>? _$imageValidComputed;

  @override
  bool get imageValid =>
      (_$imageValidComputed ??= Computed<bool>(() => super.imageValid,
              name: '_AddOrEditControllerBase.imageValid'))
          .value;
  Computed<bool>? _$cityValidComputed;

  @override
  bool get cityValid =>
      (_$cityValidComputed ??= Computed<bool>(() => super.cityValid,
              name: '_AddOrEditControllerBase.cityValid'))
          .value;
  Computed<bool>? _$districtValidComputed;

  @override
  bool get districtValid =>
      (_$districtValidComputed ??= Computed<bool>(() => super.districtValid,
              name: '_AddOrEditControllerBase.districtValid'))
          .value;
  Computed<bool>? _$roadValidComputed;

  @override
  bool get roadValid =>
      (_$roadValidComputed ??= Computed<bool>(() => super.roadValid,
              name: '_AddOrEditControllerBase.roadValid'))
          .value;
  Computed<bool>? _$nameOccurrenceValidComputed;

  @override
  bool get nameOccurrenceValid => (_$nameOccurrenceValidComputed ??=
          Computed<bool>(() => super.nameOccurrenceValid,
              name: '_AddOrEditControllerBase.nameOccurrenceValid'))
      .value;
  Computed<bool>? _$discretionValidComputed;

  @override
  bool get discretionValid =>
      (_$discretionValidComputed ??= Computed<bool>(() => super.discretionValid,
              name: '_AddOrEditControllerBase.discretionValid'))
          .value;
  Computed<dynamic>? _$addEditPressedComputed;

  @override
  dynamic get addEditPressed => (_$addEditPressedComputed ??= Computed<dynamic>(
          () => super.addEditPressed,
          name: '_AddOrEditControllerBase.addEditPressed'))
      .value;

  final _$cityAtom = Atom(name: '_AddOrEditControllerBase.city');

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

  final _$districtAtom = Atom(name: '_AddOrEditControllerBase.district');

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

  final _$roadAtom = Atom(name: '_AddOrEditControllerBase.road');

  @override
  String get road {
    _$roadAtom.reportRead();
    return super.road;
  }

  @override
  set road(String value) {
    _$roadAtom.reportWrite(value, super.road, () {
      super.road = value;
    });
  }

  final _$nameOccurrenceAtom =
      Atom(name: '_AddOrEditControllerBase.nameOccurrence');

  @override
  String get nameOccurrence {
    _$nameOccurrenceAtom.reportRead();
    return super.nameOccurrence;
  }

  @override
  set nameOccurrence(String value) {
    _$nameOccurrenceAtom.reportWrite(value, super.nameOccurrence, () {
      super.nameOccurrence = value;
    });
  }

  final _$discretionAtom = Atom(name: '_AddOrEditControllerBase.discretion');

  @override
  String get discretion {
    _$discretionAtom.reportRead();
    return super.discretion;
  }

  @override
  set discretion(String value) {
    _$discretionAtom.reportWrite(value, super.discretion, () {
      super.discretion = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_AddOrEditControllerBase.showErrors');

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

  final _$loadingAtom = Atom(name: '_AddOrEditControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$massageErrorAtom =
      Atom(name: '_AddOrEditControllerBase.massageError');

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

  final _$saveAtom = Atom(name: '_AddOrEditControllerBase.save');

  @override
  bool get save {
    _$saveAtom.reportRead();
    return super.save;
  }

  @override
  set save(bool value) {
    _$saveAtom.reportWrite(value, super.save, () {
      super.save = value;
    });
  }

  final _$imageModificationAtom =
      Atom(name: '_AddOrEditControllerBase.imageModification');

  @override
  bool get imageModification {
    _$imageModificationAtom.reportRead();
    return super.imageModification;
  }

  @override
  set imageModification(bool value) {
    _$imageModificationAtom.reportWrite(value, super.imageModification, () {
      super.imageModification = value;
    });
  }

  final _$getImageGalleryAsyncAction =
      AsyncAction('_AddOrEditControllerBase.getImageGallery');

  @override
  Future<void> getImageGallery() {
    return _$getImageGalleryAsyncAction.run(() => super.getImageGallery());
  }

  final _$getImageCameraAsyncAction =
      AsyncAction('_AddOrEditControllerBase.getImageCamera');

  @override
  Future<void> getImageCamera() {
    return _$getImageCameraAsyncAction.run(() => super.getImageCamera());
  }

  final _$deleteImageInFirebaseAsyncAction =
      AsyncAction('_AddOrEditControllerBase.deleteImageInFirebase');

  @override
  Future<void> deleteImageInFirebase({required int index}) {
    return _$deleteImageInFirebaseAsyncAction
        .run(() => super.deleteImageInFirebase(index: index));
  }

  final _$addOrEditOccurrenceAsyncAction =
      AsyncAction('_AddOrEditControllerBase.addOrEditOccurrence');

  @override
  Future<void> addOrEditOccurrence() {
    return _$addOrEditOccurrenceAsyncAction
        .run(() => super.addOrEditOccurrence());
  }

  final _$_AddOrEditControllerBaseActionController =
      ActionController(name: '_AddOrEditControllerBase');

  @override
  void setCity(String value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRoad(String value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setRoad');
    try {
      return super.setRoad(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameOccurrence(String value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setNameOccurrence');
    try {
      return super.setNameOccurrence(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDiscretion(String value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setDiscretion');
    try {
      return super.setDiscretion(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMassageError(String value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setMassageError');
    try {
      return super.setMassageError(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSave(bool value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setSave');
    try {
      return super.setSave(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageModification(bool value) {
    final _$actionInfo = _$_AddOrEditControllerBaseActionController.startAction(
        name: '_AddOrEditControllerBase.setImageModification');
    try {
      return super.setImageModification(value);
    } finally {
      _$_AddOrEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
city: ${city},
district: ${district},
road: ${road},
nameOccurrence: ${nameOccurrence},
discretion: ${discretion},
showErrors: ${showErrors},
loading: ${loading},
massageError: ${massageError},
save: ${save},
imageModification: ${imageModification},
imageValid: ${imageValid},
cityValid: ${cityValid},
districtValid: ${districtValid},
roadValid: ${roadValid},
nameOccurrenceValid: ${nameOccurrenceValid},
discretionValid: ${discretionValid},
addEditPressed: ${addEditPressed}
    ''';
  }
}
