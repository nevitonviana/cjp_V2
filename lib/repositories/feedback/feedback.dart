import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBack {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  saveFeedback(AppFeedBack appFeedBack) async {
    try {
      _firestore.collection("Feedback_App").add(appFeedBack.toMap());
      return true;
    } catch (error) {
      return false;
    }
  }
