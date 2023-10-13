import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/models/publicity.dart';

class PublicityRequest {
  static final FirebaseFirestore database = FirebaseFirestore.instance;

  static Future<List<Publicity>> viewPublicity() async {
    List<Publicity> publicity = [];
    await database.collection('publicity').get().then((value) {
      for (var doc in value.docs) {
        publicity.add(Publicity.fromJson(doc.data()));
      }
    });
    return publicity;
  }
}
