import 'package:finanlearn/ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/input.dart';
import '../dashboard/dashboard.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  TextEditingController controllerYear = TextEditingController();
  TextEditingController controllerMonths = TextEditingController();
  TextEditingController controllerDays = TextEditingController();
  TextEditingController controllerCapital = TextEditingController();
  TextEditingController controllerInterestProduced = TextEditingController();
  TextEditingController controllerInterestRate = TextEditingController();

  List<String>? listPeriod = ['Año', 'Meses', 'Dias'];
  String? dropdownValue = 'Seleccione una opcion';
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
                  padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.03),
                  child: Text('Calcular\ninteres simple',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: Dimensions.screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.025,
                ),
                Container(
                  height: Dimensions.screenHeight * 0.15,
                  width: Dimensions.screenWidth * 0.90,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(100, 220, 185, 1),
                      borderRadius: BorderRadius.all(
                        (Radius.circular(20)),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.screenWidth * 0.1,
                        vertical: Dimensions.screenHeight * 0.03),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Resultado',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: Dimensions.screenHeight * 0.015,
                          ),
                          Text('0.39',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.065,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                  ),
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.02,
                ),
                Container(
                  width: Dimensions.width90,
                  height: Dimensions.screenHeight * 0.07,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: GoogleFonts.inter(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: const Color.fromRGBO(217, 217, 217, 1),
                    underline: Container(
                      color: const Color.fromARGB(255, 119, 119, 119),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Seleccione una opcion',
                        child: Text("Seleccione una opcion",
                            style: GoogleFonts.inter(color: Colors.black)),
                      ),
                      ...listPeriod!
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ],
                    hint: const Text("Seleccione una opcion",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(height: Dimensions.screenHeight * 0.022),
                Row(
                  children: [
                    InputMedium(
                      controller: controllerYear,
                      labelText: 'Años',
                    ),
                    InputMedium(
                      controller: controllerMonths,
                      labelText: 'Meses',
                    ),
                    InputMedium(
                      controller: controllerDays,
                      labelText: 'Dias',
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.screenHeight * 0.022),
                InputColor(
                  controller: controllerCapital,
                  labelText: 'Capital',
                ),
                SizedBox(height: Dimensions.screenHeight * 0.022),
                InputColor(
                  controller: controllerInterestRate,
                  labelText: 'Tasa de interes',
                ),
                SizedBox(height: Dimensions.screenHeight * 0.022),
                InputColor(
                  controller: controllerInterestRate,
                  labelText: 'Interes Producido',
                ),
                SizedBox(height: Dimensions.screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(11, 138, 47, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(
                        Dimensions.width40, Dimensions.screenHeight * 0.07),
                  ),
                  child: Text("Calcular",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: Dimensions.screenWidth * 0.05,
                        letterSpacing: 1,
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
