import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/Dimensions.dart';

class CardHistory extends StatelessWidget {
  final Color color;
  final String title;
  final String? interest;
  final String? futureValue;
  final String? capital;
  final String? rate;
  final String? time;
  final String? compoundAmount;
  final String result;

  const CardHistory({
    required this.color,
    required this.title,
    this.interest,
    this.futureValue,
    this.capital,
    this.rate,
    this.time,
    this.compoundAmount,
    required this.result,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.screenHeight * 0.02),
      child: MaterialButton(
        onPressed: () {},
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: color,
        height: Dimensions.screenHeight * 0.28,
        minWidth: Dimensions.screenWidth * 0.90,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.screenHeight * 0.025,
              horizontal: Dimensions.screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: Dimensions.screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              capital != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text("Capital:",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(capital!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                  : const SizedBox(),
              futureValue != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text("Valor futuro:",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(futureValue!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                  : const SizedBox(),
              interest != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text("Interes producido:",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(interest!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                  : const SizedBox(),
              rate != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text("Tasa:",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text('${rate!}%',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                  : const SizedBox(),
              time != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text("Tiempo:",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(time!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                  : const SizedBox(),
              compoundAmount != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text("Monto compuesto:",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(compoundAmount!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Resultado",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: Dimensions.screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.01,
                  ),
                  Text(result,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: Dimensions.screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
