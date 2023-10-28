import 'package:finanlearn/ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboard/dashboard.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String selectedOption1 = '';
  String selectedOption2 = '';
  String selectedOption3 = '';
  String selectedOption4 = '';

  List<String>? listOptions1 = [
    '300 euros',
    '340 euros',
    '100 euros',
  ];
  List<String>? listOptions2 = [
    '400 euros',
    '340 euros',
    '100 euros',
  ];
  List<String>? listOptions3 = [
    '1060 euros',
    '1200 euros',
    '100 euros',
  ];
  List<String>? listOptions4 = [
    '9611.57 ',
    '961.57',
    '9611.27',
  ];

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
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenWidth * 0.03),
                child: SizedBox(
                  height: Dimensions.screenHeight * 0.70,
                  child: ListView(children: [
                    Container(
                      width: Dimensions.screenWidth * 0.90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pregunta 1',
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(100, 220, 185, 1),
                                fontSize: Dimensions.screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: Dimensions.screenHeight * 0.01,
                          ),
                          Text(
                              '¿Cuál es el interés generado por un capital de 5000 euros al 3% anual durante 2 años?',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Column(
                            children: listOptions1!.map((String key) {
                              return Row(
                                children: [
                                  Radio(
                                    value: key,
                                    groupValue: selectedOption1,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedOption1 = key;
                                      });
                                    },
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return Colors.black;
                                      },
                                    ),
                                  ),
                                  Text(
                                    key,
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: Dimensions.screenWidth * 0.045,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.01,
                    ),
                    Container(
                      width: Dimensions.screenWidth * 0.90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pregunta 2',
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(100, 220, 185, 1),
                                fontSize: Dimensions.screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: Dimensions.screenHeight * 0.01,
                          ),
                          Text(
                              '¿Cuál es el interés generado por un capital de 10000 euros al 4% semestral durante 1 año?',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Column(
                            children: listOptions2!.map((String key) {
                              return Row(
                                children: [
                                  Radio(
                                    value: key,
                                    groupValue: selectedOption2,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedOption2 = key;
                                      });
                                    },
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return Colors.black;
                                      },
                                    ),
                                  ),
                                  Text(
                                    key,
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: Dimensions.screenWidth * 0.045,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.01,
                    ),
                    Container(
                      width: Dimensions.screenWidth * 0.90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pregunta 3',
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(100, 220, 185, 1),
                                fontSize: Dimensions.screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: Dimensions.screenHeight * 0.01,
                          ),
                          Text(
                              'Carlos toma prestados 800 a una tasa de interés simple del 6.5% durante 5 años. ¿Cuál será el monto total a pagar al final?',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Column(
                            children: listOptions3!.map((String key) {
                              return Row(
                                children: [
                                  Radio(
                                    value: key,
                                    groupValue: selectedOption3,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedOption3 = key;
                                      });
                                    },
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return Colors.black;
                                      },
                                    ),
                                  ),
                                  Text(
                                    key,
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: Dimensions.screenWidth * 0.045,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.01,
                    ),
                    Container(
                      width: Dimensions.screenWidth * 0.90,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pregunta 4',
                              style: GoogleFonts.inter(
                                color: const Color.fromRGBO(100, 220, 185, 1),
                                fontSize: Dimensions.screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: Dimensions.screenHeight * 0.01,
                          ),
                          Text(
                              '¿Cuál es el capital que se debe invertir para obtener un monto final de 10000 euros al 2% trimestral durante 2 años?',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Column(
                            children: listOptions4!.map((String key) {
                              return Row(
                                children: [
                                  Radio(
                                    value: key,
                                    groupValue: selectedOption4,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedOption4 = key;
                                      });
                                    },
                                    fillColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return Colors.black;
                                      },
                                    ),
                                  ),
                                  Text(
                                    key,
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: Dimensions.screenWidth * 0.045,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: clear,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      minimumSize: Size(
                          Dimensions.width40, Dimensions.screenHeight * 0.07),
                    ),
                    child: Text("Borrar",
                        style: GoogleFonts.inter(
                          color: const Color.fromARGB(255, 56, 55, 55),
                          fontSize: Dimensions.screenWidth * 0.05,
                          letterSpacing: 1,
                        )),
                  ),
                  ElevatedButton(
                    onPressed: validation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(11, 138, 47, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      minimumSize: Size(
                          Dimensions.width40, Dimensions.screenHeight * 0.07),
                    ),
                    child: Text("Enviar",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: Dimensions.screenWidth * 0.05,
                          letterSpacing: 1,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  clear() {
    setState(() {
      selectedOption1 = '';
      selectedOption2 = '';
      selectedOption3 = '';
      selectedOption4 = '';
    });
  }

  validation() {
    int allAnswersCorrect = 0;

    if (selectedOption1 == '300 euros') {
      allAnswersCorrect++;
    }
    if (selectedOption2 == '400 euros') {
      allAnswersCorrect++;
    }

    if (selectedOption3 == '1060 euros') {
      allAnswersCorrect++;
    }
    if (selectedOption4 == '9611.57') {
      allAnswersCorrect++;
    }
    if (allAnswersCorrect == 4) {
      messageResponse("Todas las respuestas son correctas", 'NIVEL EXPERTO');
    }
    if (allAnswersCorrect == 3) {
      messageResponse("Algunas respuestas son correctas", 'NIVEL MEDIO');
    }
    if (allAnswersCorrect <= 2) {
      messageResponse("La mayoria de respuestas son incorrectas", 'NIVEL BAJO');
    }
  }

  void messageResponse(String name, String text) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(text),
              content: Text(name),
            ));
  }
}
