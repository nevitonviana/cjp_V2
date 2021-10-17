import 'package:cloud_firestore/cloud_firestore.dart';

import '/model/feedback/feedback_model.dart';

class FirebaseFeedBack {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveFeedback(FeedBackModel appFeedBack) async {
    try {
      await _firestore.collection("Feedback_App").add(appFeedBack.toMap());
    } catch (e) {
      return Future.error("Não foi possível salvar e o FeedBack");
    }
  }
