import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/Dimensions.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String title;
  final IconData icon;

  const Button({
    required this.onPressed,
    required this.color,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAll(() => onPressed);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        maximumSize:
            Size(Dimensions.screenWidth * 0.4, Dimensions.screenHeight * 0.15),
        elevation: 0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: Dimensions.screenWidth * 0.07,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  )),
            ],
          ),
          SizedBox(
            height: Dimensions.screenHeight * 0.001,
          ),
          Text(title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12.1,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
