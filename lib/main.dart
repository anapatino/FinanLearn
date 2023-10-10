import 'package:finanlearn/ui/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

void main() async {
  // Asegura la inicialización del sistema de widgets
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Inicializa Firebase
    await Firebase.initializeApp();

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
