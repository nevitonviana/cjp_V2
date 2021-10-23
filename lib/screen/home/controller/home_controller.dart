import 'package:mobx/mobx.dart';

import '/model/occurrence/occurrence_model.dart';
import '/repositories/occurrence/occurrence.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ///massage error
  @observable
  String? massageError;

  @action
  void setMassageError(String value) => massageError = value;

  /// delete my occurrence
  @action
  Future<void> deleteMyOccurrence(
      {required OccurrenceModel occurrenceModel}) async {
    final FirebaseOccurrence _firebaseOccurrence = FirebaseOccurrence();
    try {
      await _firebaseOccurrence.deleteOccurrence(occurrence: occurrenceModel);
    } catch (e) {
      setMassageError(e.toString());
    }
  }
}
