import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/components/dialog_popup.dart';
import 'package:my_credit_loans/screens/main_page/components/loan_period.dart';
import 'package:my_credit_loans/screens/main_page/components/slider.dart';
import 'package:my_credit_loans/widgets/cancel_button.dart';
import 'package:my_credit_loans/widgets/validate_button.dart';

class LoanForm extends StatefulWidget {

  late double width;
  late double height;

  LoanForm({
    required this.width,
    required this.height,
  });

  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        children: [
          // the sized boxes are used to better
          // position the elements into the column
          SizedBox(height: widget.height * 0.07,),
          Text('Please select the'),
          Text('desired loan'),
          SizedBox(height: widget.height * 0.07,),
          LoanSlider(width: widget.width * 0.75,),
          SizedBox(height: widget.height * 0.08,),
          LoanPeriod(width: widget.width * 0.75, height: widget.height * 0.15),
          SizedBox(height: widget.height * 0.3,),
          ValidateButton(
            width: widget.width * 0.75,
            height: widget.height * 0.08,
            onPressed: (){
              showCostDialog(context, widget.width * 0.3, widget.height * 0.07);
              },
          )
        ],
      ),
    );
  }
}
