import 'package:mobx/mobx.dart';

part 'feedback_controller.g.dart';

class FeedBackController = _FeedBackControllerBase with _$FeedBackController;

abstract class _FeedBackControllerBase with Store {
  /// fault Name
  @observable
  String? faultName;

  @action
  void setFaultName(String value) => faultName = value;

  @computed
  bool get faultNameValid => faultName != null && faultName!.length > 5;

  String? get faultNameError {
    if (faultName == null || faultNameValid) {
      return null;
    } else if (faultName!.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      return "Nome muito curto";
    }
  }

  /// description
  @observable
  String? description;

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description != null && description!.length > 10;

  String? get descriptionError {
    if (description == null || descriptionValid) {
      return null;
    } else if (description!.isEmpty) {
      return "Campo Obrigatorio";
    } else {
      return "Descrição muito curto";
    }
  }

  ///loading
  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  ///Button
  @computed
  dynamic get pressed => faultNameValid ? _feedback : null;

  @action
  Future<void> _feedback() async {}
}
