import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finanlearn/domain/models/interest.dart';

class InterestRequest {
  static final FirebaseFirestore database = FirebaseFirestore.instance;

  static Future<List<Interest>> viewListHistory() async {
    List<Interest> history = [];
    await database.collection('interest_history').get().then((value) {
      for (var doc in value.docs) {
        history.add(Interest.fromJson(doc.data()));
      }
    });
    return history;
  }

  static Future<void> addInterestToHistory(Interest interest) async {
    Map<String, dynamic> interestData = interest.toJson();
    await database.collection('interest_history').add(interestData);
  }
}
