import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../form_data_model.dart';

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
          Consumer<FormData>(
              builder: (context, value, child) => Slider(
                    value: value.getLoanValue(),
                    min: 100,
                    max: 1000,
                    divisions: 18,
                    label: '${value.getLoanValue().toString()}',
                    onChanged: (newValue) {
                      Provider.of<FormData>(context, listen: false).updateLoanValue(newValue);
                      
                    },
                  )),
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
