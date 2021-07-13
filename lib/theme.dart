import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom theme created for the application
class CustomTheme {
  BoxShadow boxShadow = BoxShadow(
      color: Color(0xff696969), offset: Offset(1.0, 2.0), blurRadius: 2.0);

  static ThemeData get customTheme {
    return ThemeData(
        hintColor: Color(0xff696969),
        disabledColor: Color(0xffbbbbbb),
        scaffoldBackgroundColor: Color(0xffFFF5EB),
        colorScheme: ColorScheme.light(
          primary: Color(0xff00966B),
          background: Color(0xffFFF5EB),
          error: Color(0xffFD0122)
        ),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 80,
                color: Color(0xffFFF5EB),
                fontWeight: FontWeight.w500),
            headline2: TextStyle(
                fontSize: 60,
                color: Color(0xff10111D),
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
            headline3: TextStyle(
                fontSize: 48,
                color: Color(0xffFFF5EB),
                fontWeight: FontWeight.w500),
            headline6: TextStyle(
                fontSize: 24,
                color: Color(0xffFFF5EB),
                fontWeight: FontWeight.w500),
            bodyText1: TextStyle(
                fontSize: 20,
                color: Color(0xff10111D),
                fontWeight: FontWeight.normal),
            bodyText2: TextStyle(
                fontSize: 18,
                color: Color(0xff10111D),
                fontWeight: FontWeight.normal),
            caption: TextStyle(fontSize: 10, color: Color(0xff696969)),
            button: TextStyle(
                fontSize: 20,
                color: Color(0xffFFF5EB),
                fontWeight: FontWeight.w500)));
  }
}
