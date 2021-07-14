import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/loan_page.dart';

class LoanSlider extends StatefulWidget {

  @override
  _LoanSliderState createState() => _LoanSliderState();
}

class _LoanSliderState extends State<LoanSlider> {

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;

    return Container(
      width: windowWidth * 0.75,
      child: Column(
        children: [
          Slider(
            value: LoanPage.loanValue,
            min: 100,
            max: 1000,
            divisions: 18,
            label: '${LoanPage.loanValue.toString()}',
            onChanged: (newValue) {
              setState(() {
                LoanPage.loanValue = newValue;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '100',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '1000',
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          )
        ],
      ),
    );
  }
}