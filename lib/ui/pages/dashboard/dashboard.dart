import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/Dimensions.dart';
import '../../widgets/Button.dart';
import '../../widgets/flashCard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height20,
              child: Stack(
                children: [
                  Positioned(
                    top: -70,
                    left: -90,
                    child: Container(
                      width: 280,
                      height: 280,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.height2,
                    left: Dimensions.screenWidth * 0.8,
                    child: IconButton(
                        onPressed: () {
                          Get.offAllNamed('/principal');
                        },
                        icon: const Icon(
                          Icons.login_outlined,
                          color: Colors.black,
                          size: 35,
                        )),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.095,
                    left: Dimensions.screenWidth * 0.3,
                    child: Text("Hola,",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.normal)),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.135,
                    left: Dimensions.screenWidth * 0.3,
                    child: Text("Aponte",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 39,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.08,
                top: Dimensions.screenHeight * 0.05,
                right: Dimensions.screenWidth * 0.08,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        color: const Color.fromRGBO(51, 190, 91, 1),
                        onPressed: () {},
                        icon: Icons.calculate_rounded,
                        title: 'Calculadora\ninteres simple',
                      ),
                      SizedBox(
                        width: Dimensions.screenWidth * 0.02,
                      ),
                      Button(
                        color: const Color.fromRGBO(255, 227, 179, 1),
                        onPressed: () {},
                        icon: Icons.calculate_rounded,
                        title: 'Calculadora\ninteres compuesto',
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.screenHeight * 0.02,
                        bottom: Dimensions.screenHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          color: const Color.fromRGBO(100, 220, 185, 1),
                          onPressed: () {},
                          icon: Icons.format_align_left_rounded,
                          title: 'Historial\ninteres simple',
                        ),
                        SizedBox(
                          width: Dimensions.screenWidth * 0.02,
                        ),
                        Button(
                          color: const Color.fromRGBO(11, 138, 47, 1),
                          onPressed: () {},
                          icon: Icons.format_align_left_rounded,
                          title: 'Historial\ninteres compuesto',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.06,
                    child: Stack(
                      children: [
                        Positioned(
                          left: Dimensions.screenWidth * 0.002,
                          child: Text("Material Educativo",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 24.5,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: Dimensions.screenHeight * 0.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FlashCard(
                      color: const Color.fromRGBO(100, 220, 185, 1),
                      onPressed: () {},
                      icon: Icons.movie_creation_rounded,
                      title: 'Aprende interes simple en 5 minutos!',
                      description:
                          'Aprovecha el tiempo y aprende todo lo que puedas viendo este video.',
                    ),
                    SizedBox(
                      width: Dimensions.screenWidth * 0.02,
                    ),
                    FlashCard(
                      color: const Color.fromRGBO(11, 138, 47, 1),
                      onPressed: () {},
                      icon: Icons.article_rounded,
                      title:
                          'La mejor guia para aprender sobre el interes simple',
                      description:
                          'Aprovecha el tiempo y aprende todo lo que puedas leyendo este articulo.',
                    ),
                    SizedBox(
                      width: Dimensions.screenWidth * 0.02,
                    ),
                    FlashCard(
                      color: const Color.fromRGBO(11, 138, 47, 1),
                      onPressed: () {},
                      icon: Icons.article_rounded,
                      title: 'todo lo que no sabes de interes compuesto',
                      description:
                          'Aprovecha el tiempo y aprende todo lo que puedas leyendo este articulo.',
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
