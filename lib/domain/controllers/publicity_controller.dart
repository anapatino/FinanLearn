import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/service/publicity_request.dart';
import '../models/publicity.dart';

class PublicityController extends GetxController {
  final Rxn<List<Publicity>> _publicity = Rxn<List<Publicity>>();

  List<Publicity>? get listPublicity => _publicity.value;

  Future<void> viewPublicity() async {
    try {
      List<Publicity> list = await PublicityRequest.viewPublicity();
      _publicity.value = list;
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    }
  }
}
