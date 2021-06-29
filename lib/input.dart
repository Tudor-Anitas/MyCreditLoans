import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Input extends StatefulWidget {

  late double width;
  late double height;
  late TextEditingController controller;
  late TextInputType inputType;
  late String hint;
  late var validator;


  Input({
    required this.width,
    required this.height,
    required this.controller,
    required this.hint,
    this.inputType = TextInputType.text,
    required this.validator,
  });

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xffebebeb)
      ),
      child: TextFormField(
        controller: widget.controller,
        style: GoogleFonts.montserrat(fontSize: 16),
        keyboardType: widget.inputType,
        validator: widget.validator,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          border: InputBorder.none,
          hintText: widget.hint,
        ),
      ),
    );
  }
}
