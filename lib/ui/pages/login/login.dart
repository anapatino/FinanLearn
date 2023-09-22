import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/Dimensions.dart';
import '../../widgets/Input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 220, 185, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.height5, horizontal: Dimensions.width5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.offAllNamed('/principal');
                      },
                      icon: const Icon(Icons.arrow_back_rounded,
                          color: Colors.white)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(100, 220, 185, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize:
                          Size(Dimensions.width30, Dimensions.buttonHeight),
                      elevation: 0,
                    ),
                    child: Text("Registrar",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: 1.6,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth * 0.03,
                    bottom: Dimensions.screenWidth * 0.01,
                    top: Dimensions.screenHeight * 0.05),
                child: Text("Ingresar",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 45,
                        letterSpacing: 1.6,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth * 0.03,
                    bottom: Dimensions.screenHeight * 0.06),
                child: Text("para aprender y crecer financieramente",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.screenWidth * 0.03,
                ),
                child: Container(
                  width: Dimensions.width80,
                  height: Dimensions.screenHeight * 0.35,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        (Radius.circular(20)),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.screenWidth * 0.09,
                        right: Dimensions.screenWidth * 0.09,
                        top: Dimensions.screenHeight * 0.02),
                    child: Column(
                      children: [
                        Input(labelText: 'Correo', controller: controlEmail),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.02,
                        ),
                        Input(
                            labelText: 'Contraseña',
                            controller: controlPassword),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(51, 190, 91, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize:
                      Size(Dimensions.width60, Dimensions.buttonHeight),
                ),
                child: Text("Ingresar",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.6,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
