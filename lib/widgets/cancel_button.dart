import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';

class CancelButton extends StatelessWidget {

  late double width;
  late double height;
  late var onPressed;

  CancelButton({
    required this.width,
    required this.height,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).backgroundColor,
      child: MaterialButton(
        child: Text('Cancel', style: GoogleFonts.montserrat(fontSize: 24, color: kRedPigment, fontWeight: FontWeight.w500),),
        onPressed: onPressed,
      ),
    );
  }
}
