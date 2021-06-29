import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/screens/main_page.dart';
import 'package:my_credit_loans/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash(),
          );
        else
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainPage()
          );
      },

    );



  }
}

