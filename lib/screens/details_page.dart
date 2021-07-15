import 'package:flutter/material.dart';
import 'package:my_credit_loans/common/details_form.dart';
import 'package:my_credit_loans/common/loan_display.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: windowWidth,
        height: windowHeight,
        child: Column(
          children: [
            SizedBox(
              height: windowHeight * 0.05,
            ),
            LoanDisplay(),
            SizedBox(
              height: windowHeight * 0.05,
            ),
            DetailsForm()
          ],
        ),
      ),
    );
  }
}
