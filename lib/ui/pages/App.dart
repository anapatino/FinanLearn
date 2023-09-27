import 'package:finanlearn/ui/pages/login/login.dart';
import 'package:finanlearn/ui/pages/login/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finanlearn/ui/pages/main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/principal': (context) => const Main(),
      },
      home: const Main(),
    );
  }
}
