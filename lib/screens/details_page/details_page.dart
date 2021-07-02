import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/details_page/components/details_form.dart';
import 'package:my_credit_loans/screens/details_page/components/loan_display.dart';

class DetailsPage extends StatefulWidget {

  late double loanValue;
  late int timePeriod;

  /// The page will display the selected loan plan and will provide a form
  /// to get some information about the user to calculate its score
  DetailsPage({
    required this.loanValue,
    required this.timePeriod
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  @override
  Widget build(BuildContext context) {

    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: windowWidth,
        height: windowHeight,
        child: Column(
          children: [
            SizedBox(height: windowHeight * 0.05,),
            LoanDisplay(
                width: windowWidth * 0.85,
                height: isKeyboardOpen? 0 : windowHeight * 0.2,
                loanValue: widget.loanValue,
                timePeriod: widget.timePeriod
            ),
            SizedBox(height: windowHeight * 0.1,),
            DetailsForm(width: windowWidth * 0.9, height: windowHeight * 0.65,)
          ],
        ),
      ),
    );
  }
}
