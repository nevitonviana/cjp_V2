import 'package:cjp_v2/repositories/occurrence/occurrence.dart';
import 'package:mobx/mobx.dart';

import '/model/occurrence/occurrence_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  Future<void> deleteMyOccurrence(
      {required OccurrenceModel occurrenceModel}) async {
    final FirebaseOccurrence _firebaseOccurrence = FirebaseOccurrence();
    try {
      await _firebaseOccurrence.deleteOccurrence(occurrence: occurrenceModel);
    } catch (e) {
      return;
    }
  }
}
