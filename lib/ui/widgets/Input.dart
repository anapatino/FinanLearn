import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  const Input({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: GoogleFonts.inter(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: widget.labelText,
        focusColor: const Color.fromRGBO(138, 138, 138, 1),
        labelStyle: GoogleFonts.inter(
          fontSize: 16,
          color: const Color.fromRGBO(138, 138, 138, 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(138, 138, 138, 1)),
        ),
      ),
    );
  }
}
