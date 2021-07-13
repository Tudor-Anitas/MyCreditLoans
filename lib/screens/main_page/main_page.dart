import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/components/headline.dart';
import 'package:my_credit_loans/screens/main_page/components/loan_form.dart';

class MainPage extends StatefulWidget {
  static double loanValue = 100;

  static int timePeriod = 1;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double monthlyPayment = 0;

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: windowHeight,
        width: windowWidth,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Headline(), LoanForm()],
          ),
        ),
      ),
    );
  }
}
