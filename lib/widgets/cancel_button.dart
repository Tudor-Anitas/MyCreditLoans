import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelButton extends StatelessWidget {
  late final double width;
  late final double height;
  late final onPressed;

  CancelButton(
      {required this.width, required this.height, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).colorScheme.background,
      child: MaterialButton(
        child: Text(
          'Cancel',
          style: GoogleFonts.montserrat(
              fontSize: 20,
              color: Theme.of(context).errorColor,
              fontWeight: FontWeight.w500),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
