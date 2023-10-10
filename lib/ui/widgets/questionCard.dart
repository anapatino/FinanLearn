import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/Dimensions.dart';

class QuestionCard extends StatefulWidget {
  final String title;
  final Color color;
  final String description;
  final Map<String, String> listOptions;
  final String result;

  const QuestionCard({
    required this.title,
    required this.color,
    required this.description,
    required this.listOptions,
    required this.result,
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.listOptions.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.screenHeight * 0.02),
      child: IntrinsicHeight(
        child: Container(
          width: Dimensions.screenWidth * 0.90,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                  style: GoogleFonts.inter(
                    color: widget.color,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              Text(widget.description,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                width: Dimensions.screenHeight * 0.01,
              ),
              Column(
                children: widget.listOptions.keys.map((String key) {
                  return Row(
                    children: [
                      Radio(
                        value: key,
                        groupValue: _selectedOption,
                        onChanged: (val) {
                          setState(() {
                            _selectedOption = key;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return Colors.black;
                          },
                        ),
                      ),
                      Text(
                        widget.listOptions[key]!,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
