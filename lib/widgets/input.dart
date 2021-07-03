import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatefulWidget {

  late double width;
  late double height;
  late TextEditingController controller;
  TextInputType inputType;
  double hintSize;
  late String hint;

  late var validator;

  /// Creates a text input to be displayed
  Input({
    required this.width,
    required this.height,
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
    // return Container(
    //   width: widget.width,
    //   height: widget.height,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //     color: Color(0xffebebeb)
    //   ),
    //   child: Expanded(
    //     child: TextFormField(
    //       controller: widget.controller,
    //       style: GoogleFonts.montserrat(fontSize: widget.hintSize),
    //       keyboardType: widget.inputType,
    //       validator: widget.validator,
    //       textInputAction: TextInputAction.next,
    //       decoration: InputDecoration(
    //         contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    //         border: InputBorder.none,
    //         hintText: widget.hint,
    //
    //       ),
    //     ),
    //   ),
    // );
    return SizedBox(
      width: widget.width,
      height: widget.height,
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
          )
        )
      ),
    );
  }
}
