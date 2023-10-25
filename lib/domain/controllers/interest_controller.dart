import 'package:finanlearn/domain/models/interest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../data/service/interest_history_request.dart';

class InterestController extends GetxController {
  final Rxn<List<Interest>> _interest = Rxn<List<Interest>>();

  List<Interest>? get listHistory => _interest.value;

  Future<void> viewPublicity() async {
    try {
      List<Interest> list = await InterestRequest.viewListHistory();
      _interest.value = list;
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    }
  }

  Future<void> addInterestHistory(Interest interest) async {
    try {
      await InterestRequest.addInterestToHistory(interest);
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    }
  }
}
