import 'dart:developer';

import 'package:finanlearn/ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/models/simple_interest.dart';
import '../../widgets/input.dart';
import '../dashboard/Dashboard.dart';

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
  TextEditingController controllerInterestEarned = TextEditingController();
  TextEditingController controllerInterestRate = TextEditingController();

  List<String>? listPeriod = ['Año', 'Mes', 'Dia'];
  String? dropdownValue = 'Año';
  late double time = 0;
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
                        fontSize: 29,
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
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: Dimensions.screenHeight * 0.02,
                          ),
                          Text('0.39',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 22,
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
                    if (dropdownValue == 'Año')
                      InputMedium(
                        controller: controllerYear,
                        labelText: 'Año',
                      ),
                    if (dropdownValue == 'Mes' || dropdownValue == 'Año')
                      InputMedium(
                        controller: controllerMonths,
                        labelText: 'Mes',
                      ),
                    if (dropdownValue == 'Mes' ||
                        dropdownValue == 'Dia' ||
                        dropdownValue == 'Año')
                      InputMedium(
                        controller: controllerDays,
                        labelText: 'Dia',
                      )
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
                  controller: controllerInterestEarned,
                  labelText: 'Interes Producido',
                ),
                SizedBox(height: Dimensions.screenHeight * 0.02),
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
                  child: Text("Ingresar",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 1,
                      )),
                ),
              ],
            ),
          )),
    );
  }

  void validation() {
    double years = double.parse(controllerYear.text);
    double months = double.parse(controllerMonths.text);
    double days = double.parse(controllerDays.text);

    switch (dropdownValue) {
      case 'years':
        time = (years / 1) + (months / 12) + (days / 360);
        break;
      case 'months':
        time = (months / 12) + (days / 360);
        break;
      case 'days':
        time = days / 360;
        break;
      default:
        break;
    }
    if (controllerCapital.text.isNotEmpty &&
        controllerInterestRate.text.isNotEmpty) {
      validationCalculateFutureValue();
    }

    if (controllerInterestEarned.text.isNotEmpty &&
        controllerInterestRate.text.isNotEmpty) {
      validationCalculateCapital();
    }
    if (controllerCapital.text.isNotEmpty &&
        controllerInterestEarned.text.isNotEmpty) {
      validationCalculateInterestRate();
    }
    if (controllerCapital.text.isNotEmpty &&
        controllerInterestEarned.text.isNotEmpty &&
        controllerInterestRate.text.isNotEmpty) {
      validationCalculateTime();
    }
  }

  validationCalculateFutureValue() {
    Map<String, double> data = {
      'capital': double.parse(controllerCapital.text),
      'interestRate': double.parse(controllerInterestRate.text),
    };

    double result = InterestSimple.calculateFutureValue(
        data: data, isChecked: true, time: time);
    log('valor futuro');
    log(result.toString());
  }

  validationCalculateCapital() {
    Map<String, double> data = {
      'interestRate': double.parse(controllerInterestRate.text),
      'interestEarned': double.parse(controllerInterestEarned.text),
    };

    double result = InterestSimple.calculateCapital(data: data, time: time);
    log('capital');

    log(result.toString());
  }

  validationCalculateInterestRate() {
    Map<String, double> data = {
      'capital': double.parse(controllerCapital.text),
      'interestEarned': double.parse(controllerInterestEarned.text),
    };

    double result = InterestSimple.calculateCapital(data: data, time: time);
    log('tasa de interes');

    log(result.toString());
  }

  validationCalculateTime() {
    Map<String, double> data = {
      'capital': double.parse(controllerCapital.text),
      'interestEarned': double.parse(controllerInterestEarned.text),
      'interestRate': double.parse(controllerInterestRate.text),
    };

    Map<String, int> result =
        InterestSimple.calculateTime(data: data, showTime: 'days');
    log('tiempo');

    log(result['years'].toString());
    log(result['months'].toString());
    log(result['days'].toString());
  }
}
