import 'package:finanlearn/domain/controllers/user_controller.dart';
import 'package:finanlearn/ui/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain/controllers/publicity_controller.dart';
import '../../../domain/models/user.dart';
import '../../utils/dimensions.dart';
import '../../widgets/input.dart';
import '../../widgets/message_response.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  UserController userController = Get.find();
  PublicityController publicityController = Get.find();

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
                          fontSize: Dimensions.screenWidth * 0.05,
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
                        fontSize: Dimensions.screenWidth * 0.15,
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
                        fontSize: Dimensions.screenWidth * 0.04,
                        fontWeight: FontWeight.normal)),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.screenWidth * 0.03,
                ),
                child: SizedBox(
                  height: Dimensions.screenHeight * 0.40,
                  child: Stack(
                    children: [
                      Container(
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
                              SizedBox(
                                height: Dimensions.screenHeight * 0.02,
                              ),
                              Input(
                                labelText: 'Correo',
                                controller: controlEmail,
                                isPassword: false,
                              ),
                              SizedBox(
                                height: Dimensions.screenHeight * 0.02,
                              ),
                              Input(
                                labelText: 'Contraseña',
                                controller: controlPassword,
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: Dimensions.screenHeight * 0.3,
                        left: Dimensions.width10,
                        child: ElevatedButton(
                          onPressed: loginUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(51, 190, 91, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(
                                Dimensions.width60, Dimensions.buttonHeight),
                          ),
                          child: Text("Ingresar",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.05,
                                letterSpacing: 1.6,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  findUser(BuildContext context, TextEditingController controlEmail,
      TextEditingController controlPassword) {
    String email = controlEmail.text;
    String password = controlPassword.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      for (var element in listUsers) {
        if (element.email == email && element.password == password) {
          return true;
        } else {
          return false;
        }
      }
    } else {
      messageResponse(context, "El correo/contraseña no ha sido ingresado");
    }

    return false;
  }

  Future<void> loginUser() async {
    String email = controlEmail.text;
    String password = controlPassword.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      userController.login(email, password).then((value) async {
        if (userController.userEmail.isNotEmpty) {
          await publicityController.viewPublicity();
          Get.offAll(() => const Dashboard());
        } else {
          messageResponse(context, "El correo/contraseña no es correcto");
        }
      }).catchError((error) {
        messageResponse(context, "Error: $error");
      });

      controlEmail.clear();
      controlPassword.clear();
    } else {
      messageResponse(context, "Por favor, ingresa el correo y la contraseña.");
    }
  }
}
