import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/Dimensions.dart';

class CardHistory extends StatelessWidget {
  final Color color;
  final String title;
  final String? interest;
  final String? capital;
  final String? rate;
  final String? time;
  final String result;

  const CardHistory({
    required this.color,
    required this.title,
    this.interest,
    this.capital,
    this.rate,
    this.time,
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
              vertical: Dimensions.screenHeight * 0.03,
              horizontal: Dimensions.screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              interest != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text("Interes:",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(interest!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
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
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(rate!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
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
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: Dimensions.screenHeight * 0.01,
                          ),
                          Text(time!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Text("Resultado:",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: Dimensions.screenHeight * 0.01,
                  ),
                  Text(result,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
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
