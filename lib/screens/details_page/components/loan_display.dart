import 'package:flutter/material.dart';

class LoanDisplay extends StatelessWidget {
  late final double width;
  late final double height;
  late final double loanValue;
  late final int timePeriod;

  LoanDisplay(
      {required this.width,
      required this.height,
      required this.loanValue,
      required this.timePeriod});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(top: height * 0.1, left: width * 0.05),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
              width: width,
              child: Text('Payment per month',
                  style: Theme.of(context).textTheme.headline6)),
          Container(width: width, child: Text('${loanValue.round()} RON')),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
              width: width,
              child: Text(
                'Period of time',
                style: Theme.of(context).textTheme.headline6,
              )),
          Container(width: width, child: Text('$timePeriod months'))
        ],
      ),
    );
  }
}
