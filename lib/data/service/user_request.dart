import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finanlearn/domain/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRequest {
  static final FirebaseFirestore database = FirebaseFirestore.instance;
  static final FirebaseAuth authentication = FirebaseAuth.instance;

  static Future<UserCredential> login(String email, String password) async {
    try {
      return await authentication.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('El usuario no wxiste');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      }
    }
    return Future.error('Error al ingresar');
  }

  static Future<UserCredential> register(
      String firstName, String lastName, String email, String password) async {
    try {
      return await authentication.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('La contraseña es demasiado debil');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('Ya existe una cuenta con este email');
      }
    }
    return Future.error('Error al registrar usuario');
  }

  static Future<Users> findUser(String email) async {
    Users? user;
    await database.collection('user').get().then((value) {
      for (var doc in value.docs) {
        if (doc.data()['email'] == email) {
          log(doc.data()["firstName"]);
          user = Users.fromJson(doc.data());
        }
      }
    });
    return user!;
  }
}
