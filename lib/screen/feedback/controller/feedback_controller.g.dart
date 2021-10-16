// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedBackController on _FeedBackControllerBase, Store {
  Computed<bool>? _$faultNameValidComputed;

  @override
  bool get faultNameValid =>
      (_$faultNameValidComputed ??= Computed<bool>(() => super.faultNameValid,
              name: '_FeedBackControllerBase.faultNameValid'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_FeedBackControllerBase.descriptionValid'))
      .value;
  Computed<dynamic>? _$pressedComputed;

  @override
  dynamic get pressed =>
      (_$pressedComputed ??= Computed<dynamic>(() => super.pressed,
              name: '_FeedBackControllerBase.pressed'))
          .value;

  final _$faultNameAtom = Atom(name: '_FeedBackControllerBase.faultName');

  @override
  String? get faultName {
    _$faultNameAtom.reportRead();
    return super.faultName;
  }

  @override
  set faultName(String? value) {
    _$faultNameAtom.reportWrite(value, super.faultName, () {
      super.faultName = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_FeedBackControllerBase.description');

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$loadingAtom = Atom(name: '_FeedBackControllerBase.loading');

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

  final _$_feedbackAsyncAction =
      AsyncAction('_FeedBackControllerBase._feedback');

  @override
  Future<void> _feedback() {
    return _$_feedbackAsyncAction.run(() => super._feedback());
  }

  final _$_FeedBackControllerBaseActionController =
      ActionController(name: '_FeedBackControllerBase');

  @override
  void setFaultName(String value) {
    final _$actionInfo = _$_FeedBackControllerBaseActionController.startAction(
        name: '_FeedBackControllerBase.setFaultName');
    try {
      return super.setFaultName(value);
    } finally {
      _$_FeedBackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_FeedBackControllerBaseActionController.startAction(
        name: '_FeedBackControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_FeedBackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_FeedBackControllerBaseActionController.startAction(
        name: '_FeedBackControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_FeedBackControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
faultName: ${faultName},
description: ${description},
loading: ${loading},
faultNameValid: ${faultNameValid},
descriptionValid: ${descriptionValid},
pressed: ${pressed}
    ''';
  }
}
