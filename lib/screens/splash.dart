import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/screens/main_page.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage())
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kXiketic,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Credit', style: GoogleFonts.lobster(fontSize: 60, color: kSeaShell,fontWeight: FontWeight.w500),),
            Text('Loans', style: GoogleFonts.lobster(fontSize: 60, color: kSeaShell,fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
