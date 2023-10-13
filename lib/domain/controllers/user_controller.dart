import 'dart:developer';

import 'package:finanlearn/data/service/user_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {
  final Rx<dynamic> _user = "".obs;
  final Rx<dynamic> _lastName = "".obs;
  String get userEmail => _user.value;
  String get lastName => _lastName.value;
  Future<void> login(String email, String password) async {
    try {
      UserCredential user = await UserRequest.login(email, password);
      _user.value = user.user!.email;
      Users foundUser = await UserRequest.findUser(email);
      _lastName.value = foundUser.lastName;
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    }
  }

  Future<void> register(
      String firstName, String lastName, String email, String password) async {
    try {
      UserCredential user =
          await UserRequest.register(firstName, lastName, email, password);
      _user.value = user.user!.email;
      Users foundUser = await UserRequest.findUser(email);
      _lastName.value = foundUser.lastName;
    } on FirebaseAuthException catch (e) {
      log('Excepcion en controller:$e');
    }
  }
}
