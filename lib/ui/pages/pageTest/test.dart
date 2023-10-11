import 'package:finanlearn/ui/utils/Dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/questionCard.dart';
import '../dashboard/Dashboard.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.width5,
            right: Dimensions.width5,
            top: Dimensions.height5,
            bottom: Dimensions.screenHeight * 0.02),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.offAll(() => const Dashboard());
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 32,
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.screenWidth * 0.03,
                  bottom: 0,
                ),
                child: Text('Test de aprendizaje',
                    style: GoogleFonts.inter(
                      color: const Color.fromRGBO(51, 190, 91, 1),
                      fontSize: Dimensions.screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenWidth * 0.03),
                child: SizedBox(
                  height: Dimensions.screenHeight * 0.70,
                  child: ListView(
                    children: const [
                      QuestionCard(
                        title: 'Pregunta 1',
                        description:
                            '¿Cuál es el interés generado por un capital de 5000 euros al 3% anual durante 2 años?',
                        listOptions: {
                          'opcion1': '300 euros',
                          'opcion2': '340 euros',
                          'opcion3': '100 euros',
                        },
                        result: '300 euros',
                        color: Color.fromRGBO(100, 220, 185, 1),
                      ),
                      QuestionCard(
                        title: 'Pregunta 2',
                        description:
                            '¿Cuál es el interés generado por un capital de 10000 euros al 4% semestral durante 1 año?',
                        listOptions: {
                          'opcion1': '400 euros',
                          'opcion2': '340 euros',
                          'opcion3': '100 euros',
                        },
                        result: '400 euros',
                        color: Color.fromRGBO(11, 138, 47, 1),
                      ),
                      QuestionCard(
                        title: 'Pregunta 3',
                        description:
                            'Carlos toma prestados 800 a una tasa de interés simple del 6.5% durante 5 años. ¿Cuál será el monto total a pagar al final?',
                        listOptions: {
                          'opcion1': '1060',
                          'opcion2': '1200',
                          'opcion3': '100',
                        },
                        result: '1060',
                        color: Color.fromRGBO(100, 220, 185, 1),
                      ),
                      QuestionCard(
                        title: 'Pregunta 4',
                        description:
                            '¿Cuál es el capital que se debe invertir para obtener un monto final de 10000 euros al 2% trimestral durante 2 años?',
                        listOptions: {
                          'opcion1': '9611.57',
                          'opcion2': '961.57',
                          'opcion3': '9611.27',
                        },
                        result: '9611.57',
                        color: Color.fromRGBO(11, 138, 47, 1),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(51, 190, 91, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(
                          Dimensions.width30, Dimensions.screenHeight * 0.075),
                    ),
                    child: Text("Enviar",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: 1,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
