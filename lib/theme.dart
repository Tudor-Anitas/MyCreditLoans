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
        headline1: GoogleFonts.montserrat(fontSize: 80, color: kSeaShell, fontWeight: FontWeight.w500),
        headline2: GoogleFonts.lobster(fontSize: 60, color: kSeaShell, fontWeight: FontWeight.w500),
        headline3: GoogleFonts.montserrat(fontSize: 48, color: kSeaShell, fontWeight: FontWeight.w500),
        headline6: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),
        bodyText1: GoogleFonts.montserrat(fontSize: 20, color: kXiketic, fontWeight: FontWeight.normal),
        bodyText2: GoogleFonts.montserrat(fontSize: 18, color: kXiketic, fontWeight: FontWeight.normal),
        caption: GoogleFonts.montserrat(fontSize: 12, color: kGrey),
        button: GoogleFonts.montserrat(fontSize: 20, color: kSeaShell, fontWeight: FontWeight.w500)
      )
    );
  }

}
