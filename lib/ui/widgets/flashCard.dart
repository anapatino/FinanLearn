import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/Dimensions.dart';

class FlashCard extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String title;
  final IconData icon;
  final String description;

  const FlashCard({
    required this.onPressed,
    required this.color,
    required this.title,
    required this.icon,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAll(() => onPressed);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        maximumSize:
            Size(Dimensions.screenWidth * 0.58, Dimensions.screenHeight * 0.4),
        elevation: 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.screenHeight * 0.17,
            width: Dimensions.screenWidth * 0.65,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  (Radius.circular(20)),
                )),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: Colors.white,
                  size: 50,
                )),
          ),
          SizedBox(
            height: Dimensions.screenHeight * 0.01,
          ),
          Text(title,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: Dimensions.screenHeight * 0.01,
          ),
          Text(description,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w300,
              )),
        ],
      ),
    );
  }
}
