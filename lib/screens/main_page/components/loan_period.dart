import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';

class LoanPeriod extends StatefulWidget {
  @override
  _LoanPeriodState createState() => _LoanPeriodState();
}

class _LoanPeriodState extends State<LoanPeriod> {
  List<DropdownMenuItem<int>> timePeriods = [
    DropdownMenuItem(
      child: Text('1 month'),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text('3 month'),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text('6 month'),
      value: 6,
    ),
    DropdownMenuItem(
      child: Text('1 year'),
      value: 12,
    )
  ];

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      width: windowWidth * 0.8,
      height: windowHeight * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: windowWidth * 0.35,
            child: Text(
              'The period of time for the loan',
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: windowWidth * 0.3,
            child: FittedBox(
              child: Center(
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  value: MainPage.timePeriod,
                  items: timePeriods,
                  style: Theme.of(context).textTheme.caption,
                  onChanged: (value) {
                    setState(() {
                      MainPage.timePeriod = value as int;
                    });
                  },
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
