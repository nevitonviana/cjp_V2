// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$massageErrorAtom = Atom(name: '_HomeControllerBase.massageError');

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

  final _$deleteMyOccurrenceAsyncAction =
      AsyncAction('_HomeControllerBase.deleteMyOccurrence');

  @override
  Future<void> deleteMyOccurrence({required OccurrenceModel occurrenceModel}) {
    return _$deleteMyOccurrenceAsyncAction
        .run(() => super.deleteMyOccurrence(occurrenceModel: occurrenceModel));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setMassageError(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMassageError');
    try {
      return super.setMassageError(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
massageError: ${massageError}
    ''';
  }
}
