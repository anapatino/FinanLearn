import 'package:finanlearn/ui/utils/Dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  const Input({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword,
      controller: widget.controller,
      style: GoogleFonts.inter(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: widget.labelText,
        focusColor: const Color.fromRGBO(138, 138, 138, 1),
        labelStyle: GoogleFonts.inter(
          fontSize: Dimensions.screenWidth * 0.05,
          color: const Color.fromRGBO(138, 138, 138, 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(138, 138, 138, 1)),
        ),
      ),
    );
  }
}

class InputColor extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const InputColor({
    required this.labelText,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * 0.02),
      width: Dimensions.screenWidth * 0.55,
      child: TextField(
        cursorColor: Colors.black,
        style: GoogleFonts.inter(color: Colors.black),
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 30),
          filled: true,
          fillColor: const Color.fromRGBO(217, 217, 217, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusColor: Colors.black,
          labelText: labelText,
          labelStyle: GoogleFonts.inter(
            fontSize: Dimensions.screenWidth * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class InputMedium extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const InputMedium({
    required this.labelText,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * 0.02),
      width: Dimensions.screenWidth * 0.26,
      child: TextField(
        cursorColor: Colors.black,
        style: GoogleFonts.inter(color: Colors.black),
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15),
          filled: true,
          fillColor: const Color.fromRGBO(217, 217, 217, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusColor: Colors.black,
          labelText: labelText,
          labelStyle: GoogleFonts.inter(
            fontSize: Dimensions.screenWidth * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
