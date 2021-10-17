import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/components/controller/user_controller.dart';
import '/model/feedback/feedback_model.dart';
import '/repositories/feedback/feedback.dart';

part 'feedback_controller.g.dart';

class FeedBackController = _FeedBackControllerBase with _$FeedBackController;

abstract class _FeedBackControllerBase with Store {
  final UserController _userController = GetIt.I<UserController>();

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

  ///
  @observable
  String? messageError;

  @action
  void setMessageError(String value) => messageError = value;

  ///Button
  @computed
  dynamic get pressed => faultNameValid && descriptionValid ? _feedback : null;

  @action
  Future<void> _feedback() async {
    setLoading(true);
    final FeedBackModel feedBackModel = FeedBackModel(
      nameUser: _userController.user!.name,
      faultName: faultName,
      description: description,
    );
    try {
      await FirebaseFeedBack().saveFeedback(feedBackModel: feedBackModel);
    } catch (e) {
      setMessageError(e.toString());
      return;
    }
    setLoading(false);
  }
}
