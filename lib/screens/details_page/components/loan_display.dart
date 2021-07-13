import 'package:flutter/material.dart';

class LoanDisplay extends StatelessWidget {
  late final double loanValue;
  late final int timePeriod;

  LoanDisplay({required this.loanValue, required this.timePeriod});

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    bool isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom != 0 ? true : false;
    return Container(
      width: windowWidth * 0.9,
      height: isKeyboardOpen ? 0 : windowHeight * 0.25,
      padding:
          EdgeInsets.only(top: windowHeight * 0.03, left: windowWidth * 0.05),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
              width: windowWidth,
              child: Text('Payment per month',
                  style: Theme.of(context).textTheme.headline6)),
          Container(
              width: windowWidth, child: Text('${loanValue.round()} RON')),
          SizedBox(
            height: windowHeight * 0.03,
          ),
          Container(
              width: windowWidth,
              child: Text(
                'Period of time',
                style: Theme.of(context).textTheme.headline6,
              )),
          Container(width: windowWidth, child: Text('$timePeriod months'))
        ],
      ),
    );
  }
}
