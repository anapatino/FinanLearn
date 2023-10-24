import 'package:finanlearn/domain/controllers/user_controller.dart';
import 'package:finanlearn/domain/models/user.dart';
import 'package:finanlearn/ui/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain/controllers/publicity_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/message_response.dart';
import '../dashboard/dashboard.dart';

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
              IconButton(
                  onPressed: () {
                    Get.offAllNamed('/principal');
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
                        fontSize: Dimensions.screenWidth * 0.15,
                        letterSpacing: 1.6,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth * 0.03,
                    bottom: Dimensions.screenHeight * 0.04),
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
                  height: Dimensions.screenHeight * 0.69,
                  child: Stack(
                    children: [
                      Container(
                        width: Dimensions.width80,
                        height: Dimensions.screenHeight * 0.48,
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
                        top: Dimensions.screenHeight * 0.44,
                        left: Dimensions.width10,
                        child: ElevatedButton(
                          onPressed: registerUser,
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
                                fontSize: Dimensions.screenWidth * 0.05,
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
      publicityController.viewPublicity();
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

  Future<void> registerUser() async {
    String firstName = controlFirstName.text;
    String lastName = controlLastName.text;
    String email = controlEmail.text;
    String password = controlPassword.text;

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty) {
      userController
          .register(firstName, lastName, email, password)
          .then((value) async {
        if (userController.userEmail.isNotEmpty) {
          await publicityController.viewPublicity();
          Get.offAll(() => const Dashboard());
        }
      }).catchError((error) {
        messageResponse(context, "Error: $error");
      });
      controlFirstName.clear();
      controlLastName.clear();
      controlEmail.clear();
      controlPassword.clear();
    } else {
      messageResponse(context, "Por favor, ingresa el correo y la contraseña.");
    }
  }
}
