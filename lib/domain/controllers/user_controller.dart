import 'dart:developer';

import 'package:finanlearn/data/service/user_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<dynamic> _user = "".obs;

  Future<void> login(String email, String password) async {
    try {
      UserCredential user = await UserRequest.login(email, password);
      _user.value = user;
    } on FirebaseAuthException catch (e) {
      log('Excepcion en controller:$e');
    }
  }
}
