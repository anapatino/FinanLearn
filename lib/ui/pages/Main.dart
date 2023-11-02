import 'package:finanlearn/ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(100, 220, 185, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.height2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.05),
                child: Container(
                    height: Dimensions.screenHeight * 0.32,
                    width: Dimensions.width90,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/pictures.png'),
                            fit: BoxFit.contain))),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: Dimensions.screenWidth * 0.1, top: 0),
                child: Text(
                  'Domina conceptos financieros con FinanLearn',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: Dimensions.screenHeight * 0.065,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.screenHeight * 0.03,
                    bottom: Dimensions.screenHeight * 0.03,
                    left: Dimensions.screenWidth * 0.1),
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(51, 190, 91, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize:
                        Size(Dimensions.width80, Dimensions.buttonHeight),
                  ),
                  child: Text("Ingresar",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: Dimensions.screenWidth * 0.05,
                        letterSpacing: 1.6,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.05),
                child: Container(
                    height: Dimensions.screenHeight * 0.10,
                    width: Dimensions.width90,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/pictures01.png'),
                            fit: BoxFit.contain))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
