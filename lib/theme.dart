import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';

class CustomTheme{
  static ThemeData get customTheme {
    return ThemeData(
      accentColor: kGreenCyan,
      errorColor: kRedPigment,
      backgroundColor: kSeaShell,
      hintColor: kGrey,
      toggleableActiveColor: kGreenCyan,
      disabledColor: kBlue,
      scaffoldBackgroundColor: kXiketic,
      textTheme: TextTheme(
        headline1: GoogleFonts.lobster(fontSize: 64, color: kSeaShell, fontWeight: FontWeight.w500),
        headline2: GoogleFonts.montserrat(fontSize: 36, color: kSeaShell, fontWeight: FontWeight.w500),
        headline6: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),
        bodyText1: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),
        bodyText2: GoogleFonts.montserrat(fontSize: 20, color: kXiketic, fontWeight: FontWeight.w400),
        caption: GoogleFonts.montserrat(fontSize: 14, color: kGrey),
        button: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500)
      )
    );
  }
}
