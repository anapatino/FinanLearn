import 'package:finanlearn/domain/models/user.dart';
import 'package:finanlearn/ui/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/dimensions.dart';
import '../../widgets/messageResponse.dart';
import '../dashboard/Dashboard.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controlFirstName = TextEditingController();
  TextEditingController controlLastName = TextEditingController();
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  void viewSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(Icons.warning),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 5),
    );
  }

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
              IconButton(
                  onPressed: () {
                    Get.offAll(() => const Dashboard());
                  },
                  icon: const Icon(Icons.arrow_back_rounded,
                      color: Colors.white)),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth * 0.03,
                    bottom: Dimensions.screenWidth * 0.01,
                    top: Dimensions.screenHeight * 0.05),
                child: Text("Registrar  ",
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
                child: SizedBox(
                  height: Dimensions.screenHeight * 0.60,
                  child: Stack(
                    children: [
                      Container(
                        width: Dimensions.width80,
                        height: Dimensions.screenHeight * 0.50,
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
                              Input(
                                labelText: 'Primer nombre',
                                controller: controlFirstName,
                                isPassword: false,
                              ),
                              SizedBox(
                                height: Dimensions.screenHeight * 0.01,
                              ),
                              Input(
                                labelText: 'Primer apellido',
                                controller: controlLastName,
                                isPassword: false,
                              ),
                              SizedBox(
                                height: Dimensions.screenHeight * 0.01,
                              ),
                              Input(
                                labelText: 'Correo',
                                controller: controlEmail,
                                isPassword: false,
                              ),
                              SizedBox(
                                height: Dimensions.screenHeight * 0.01,
                              ),
                              Input(
                                labelText: 'Contraseña',
                                controller: controlPassword,
                                isPassword: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: Dimensions.screenHeight * 0.45,
                        left: Dimensions.width10,
                        child: ElevatedButton(
                          onPressed: () {
                            if (validation(
                                    context,
                                    controlFirstName,
                                    controlLastName,
                                    controlEmail,
                                    controlPassword) ==
                                true) {
                              Get.offAll(() => const Dashboard());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(51, 190, 91, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: Size(
                                Dimensions.width60, Dimensions.buttonHeight),
                          ),
                          child: Text("Registrar",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1.6,
                              )),
                        ),
                      ),
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

  validation(
      BuildContext context,
      TextEditingController controlFirstName,
      TextEditingController controlLastName,
      TextEditingController controlEmail,
      TextEditingController controlPassword) {
    String firstName = controlFirstName.text;
    String lastName = controlLastName.text;
    String email = controlEmail.text;
    String password = controlPassword.text;
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      listUsers.add(Users(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password));
      messageResponse(context, "El usuario registrado");
      for (var element in listUsers) {
        print(element.firstName);
      }
      return true;
    } else {
      messageResponse(context, "El usuario no ha sido ingresado");
    }
    return false;
  }
}
