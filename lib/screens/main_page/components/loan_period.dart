import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';

class LoanPeriod extends StatefulWidget {
  late final double width;
  late final double height;

  LoanPeriod({required this.width, required this.height});

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
    return Container(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: widget.width * 0.48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text('The period'),
                    Text('of time for'),
                    Text('the loan')
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: widget.width * 0.3,
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
