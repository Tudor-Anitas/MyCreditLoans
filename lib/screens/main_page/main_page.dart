import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/screens/main_page/components/headline.dart';
import 'package:my_credit_loans/screens/main_page/components/loan_form.dart';

class MainPage extends StatefulWidget {

  // the value of the loan chosen by the user
  static double loanValue = 100;
  // how long is the loan in months
  static int timePeriod = 1;


  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  // the text fields for the detail page
  List<TextEditingController> detailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  double monthlyPayment = 0; // the amount of money the user must pay monthly

  @override
  Widget build(BuildContext context) {

    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;



    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kXiketic,
      body: Container(
        height: windowHeight,
        width: windowWidth,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Headline(height: windowHeight * 0.34,),
              LoanForm(width: windowWidth, height: windowHeight * 0.66)
            ],
          ),
        ),
      ),
    );
  }
}