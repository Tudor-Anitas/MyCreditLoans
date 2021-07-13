import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';
import 'package:my_credit_loans/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.customTheme,
      home: AnimatedSplashScreen(
        splash: FlutterLogo(
          size: 100.0,
        ),
        nextScreen: MainPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kXiketic,
      ),
    );
  }
}
