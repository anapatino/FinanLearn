import 'dart:developer';

import 'package:finanlearn/ui/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/controllers/interest_controller.dart';
import '../../../domain/models/interest.dart';
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
  InterestController interestController = Get.find();

  List<String>? listPeriod = [
    'Valor futuro',
    'Capital',
    'Interes',
    'Tiempo',
    'Interes producido'
  ];
  String? value = '';
  String? dropdownValue = 'Seleccione una opcion';
  double time = 0;
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
                          Text(value!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.058,
                                fontWeight: FontWeight.normal,
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
                      labelText: 'Año',
                    ),
                    InputMedium(
                      controller: controllerMonths,
                      labelText: 'Mes',
                    ),
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
                      child: Text("Calcular",
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
          )),
    );
  }

  void clear() {
    setState(() {
      value = '';
      dropdownValue = 'Seleccione una opcion';
    });
    controllerYear.clear();
    controllerMonths.clear();
    controllerDays.clear();
    controllerCapital.clear();
    controllerInterestEarned.clear();
    controllerInterestRate.clear();
  }

  void validation() {
    try {
      double? years = double.tryParse(controllerYear.text);
      double? months = double.tryParse(controllerMonths.text);
      double? days = double.tryParse(controllerDays.text);
      if (controllerYear.text.isNotEmpty &&
          controllerMonths.text.isNotEmpty &&
          controllerDays.text.isNotEmpty) {
        time = (years! / 1) + (months! / 12) + (days! / 365);
      } else {
        if (controllerMonths.text.isNotEmpty &&
            controllerDays.text.isNotEmpty) {
          time = (months! / 12) + (days! / 360);
        } else {
          if (controllerMonths.text.isNotEmpty) {
            time = months! / 12;
          } else {
            time = days! / 360;
          }
        }
      }
    } catch (e) {
      log('Error al analizar los valores: $e');
    }
    switch (dropdownValue) {
      case 'Valor futuro':
        validationCalculateFutureValue(true);
      case 'Capital':
        validationCalculateCapital();
      case 'Interes':
        validationCalculateInterestRate();
      case 'Interes producido':
        validationCalculateFutureValue(false);
      case 'Tiempo':
        validationCalculateTime();
      default:
        break;
    }
  }

  validationCalculateFutureValue(bool option) {
    Map<String, double> data = {
      'capital': controllerCapital.text.isNotEmpty
          ? double.parse(controllerCapital.text)
          : 0,
      'interestRate': controllerInterestRate.text.isNotEmpty
          ? double.parse(controllerInterestRate.text)
          : 0,
    };

    double result = InterestSimple.calculateFutureValue(
        data: data, isChecked: option, time: time);

    setState(() {
      value = result.toString();
    });
    Interest interest = Interest(
      capital: controllerCapital.text,
      day: controllerDays.text,
      futureValue: '',
      interestRate: controllerInterestRate.text,
      month: controllerMonths.text,
      result: result.toString(),
      type: 'simple',
      title: 'Calcular valor futuro',
      year: controllerYear.text,
      compoundAmount: '',
      interestEarned: controllerInterestEarned.text,
    );
    interestController.addInterestHistory(interest);
  }

  validationCalculateCapital() {
    Map<String, double> data = {
      'interestRate': controllerInterestRate.text.isNotEmpty
          ? double.parse(controllerInterestRate.text)
          : 0,
      'interestEarned': controllerInterestEarned.text.isNotEmpty
          ? double.parse(controllerInterestEarned.text)
          : 0,
    };

    double result = InterestSimple.calculateCapital(data: data, time: time);
    setState(() {
      value = result.toString();
    });
    Interest interest = Interest(
      capital: '',
      day: controllerDays.text,
      futureValue: '',
      interestRate: controllerInterestRate.text,
      month: controllerMonths.text,
      result: result.toString(),
      type: 'simple',
      title: 'Calcular capital',
      year: controllerYear.text,
      compoundAmount: '',
      interestEarned: controllerInterestEarned.text,
    );
    interestController.addInterestHistory(interest);
  }

  validationCalculateInterestRate() {
    Map<String, double> data = {
      'capital': double.parse(controllerCapital.text),
      'interestEarned': double.parse(controllerInterestEarned.text),
    };

    double result =
        InterestSimple.calculateInterestRate(data: data, time: time);

    setState(() {
      value = result.toString();
    });
    Interest interest = Interest(
      capital: controllerCapital.text,
      day: controllerDays.text,
      futureValue: '',
      interestRate: '',
      month: controllerMonths.text,
      result: result.toString(),
      type: 'simple',
      title: 'Calcular interes',
      year: controllerYear.text,
      compoundAmount: '',
      interestEarned: controllerInterestEarned.text,
    );
    interestController.addInterestHistory(interest);
  }

  validationCalculateTime() {
    Map<String, double> data = {
      'capital': double.parse(controllerCapital.text),
      'interestEarned': double.parse(controllerInterestEarned.text),
      'interestRate': double.parse(controllerInterestRate.text),
    };

    Map<String, int> result =
        InterestSimple.calculateTime(data: data, showTime: 'days');
    String year = result['years'].toString();
    String month = result['months'].toString();
    String days = result['days'].toString();

    setState(() {
      value = '$year año, $month meses, $days dias';
    });
    Interest interest = Interest(
      capital: controllerCapital.text,
      day: '',
      futureValue: '',
      interestRate: controllerInterestRate.text,
      month: '',
      result: '$year año, $month meses, $days dias',
      type: 'simple',
      title: 'Calcular tiempo',
      year: '',
      compoundAmount: '',
      interestEarned: controllerInterestEarned.text,
    );
    interestController.addInterestHistory(interest);
  }
}
