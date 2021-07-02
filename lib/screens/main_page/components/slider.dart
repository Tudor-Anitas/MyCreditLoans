import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';

class LoanSlider extends StatefulWidget {

  late double width;

  LoanSlider({required this.width});

  @override
  _LoanSliderState createState() => _LoanSliderState();
}

class _LoanSliderState extends State<LoanSlider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        children: [
          Slider(
            value: MainPage.loanValue,
            min: 100,
            max: 1000,
            divisions: 18,
            label: '${MainPage.loanValue.toString()}',
            onChanged: (newValue){
              setState(() {
                MainPage.loanValue = newValue;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('100', style: Theme.of(context).textTheme.bodyText2,),
              Text('1000', style: Theme.of(context).textTheme.bodyText2,)
            ],
          )
        ],
      ),
    );
  }
}
