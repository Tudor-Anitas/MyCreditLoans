import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_credit_loans/common/headline.dart';
import 'package:my_credit_loans/common/loan_form.dart';

class LoanPage extends StatefulWidget {
  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
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
            children: [
              Headline(),
              LoanForm()
            ],
          ),
        ),
      ),
    );
  }
}
