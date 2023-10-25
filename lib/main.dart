import 'package:finanlearn/domain/controllers/publicity_controller.dart';
import 'package:finanlearn/domain/controllers/user_controller.dart';
import 'package:finanlearn/firebase_options.dart';
import 'package:finanlearn/ui/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:developer';

import 'package:get/get.dart';

import 'domain/controllers/interest_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    Get.put(UserController());
    Get.put(PublicityController());
    Get.put(InterestController());
    runApp(const App());
  } catch (e) {
    log("Error al iniciar la aplicación: $e");
  }
}

/*
void main() async {
  // Asegura la inicialización del sistema de widgets
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Inicializa Firebase
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // Realiza la consulta a Firestore
    FirebaseFirestore.instance.collection('user').get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data()['firstName'].toString());
      }
      runApp(const App());
    }).catchError((error) {
      log("Error en la consulta a Firestore: $error");

      // Inicia la aplicación después de manejar el error
      runApp(const App());
    });
  } catch (e) {
    log("Error al iniciar la aplicación: $e");
  }
}

 */