import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatefulWidget {
  late final TextEditingController controller;
  final TextInputType inputType;
  final double hintSize;
  late final String hint;

  late final validator;

  Input({
    required this.controller,
    required this.hint,
    this.inputType = TextInputType.text,
    this.hintSize = 16,
    required this.validator,
  });

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: windowWidth * 0.75,
      height: windowHeight * 0.07,
      child: TextFormField(
          controller: widget.controller,
          style: GoogleFonts.montserrat(fontSize: widget.hintSize),
          keyboardType: widget.inputType,
          validator: widget.validator,
          decoration: InputDecoration(
              labelText: widget.hint,
              errorStyle: TextStyle(height: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(),
              ))),
    );
  }
}
