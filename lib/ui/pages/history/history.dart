import 'package:finanlearn/ui/utils/dimensions.dart';
import 'package:finanlearn/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard/Dashboard.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width5, vertical: Dimensions.height5),
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
                    bottom: Dimensions.screenHeight * 0.013),
                child: Text('Historial de ejercicios',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.98,
                child: ListView(
                  children: const [
                    CardHistory(
                      color: Color.fromRGBO(100, 220, 185, 1),
                      result: '5000',
                      title: 'Calcular capital',
                      interest: '300',
                      rate: '6%',
                      time: '1 año',
                    ),
                    CardHistory(
                      color: Color.fromRGBO(11, 138, 47, 1),
                      capital: '1000',
                      result: '1102.5',
                      title: 'Calcular monto',
                      rate: '5%',
                      time: '2 años',
                    ),
                    CardHistory(
                      color: Color.fromRGBO(100, 220, 185, 1),
                      result: '5000',
                      title: 'Calcular capital',
                      interest: '300',
                      rate: '6%',
                      time: '1 año',
                    ),
                    CardHistory(
                      color: Color.fromRGBO(100, 220, 185, 1),
                      result: '5000',
                      title: 'Calcular capital',
                      interest: '300',
                      rate: '6%',
                      time: '1 año',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
