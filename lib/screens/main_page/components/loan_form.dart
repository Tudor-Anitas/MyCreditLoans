import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/components/dialog_popup.dart';
import 'package:my_credit_loans/screens/main_page/components/loan_period.dart';
import 'package:my_credit_loans/screens/main_page/components/slider.dart';
import 'package:my_credit_loans/widgets/validate_button.dart';

class LoanForm extends StatefulWidget {
  late final double width;
  late final double height;

  late final String screenType;

  LoanForm(
      {required this.width, required this.height, required this.screenType});

  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  late double spaceSize;

  late double buttonMargin;

  late double loanPeriodHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          SizedBox(
            height: spaceSize,
          ),
          Text('Please select the'),
          Text('desired loan'),
          SizedBox(
            height: spaceSize,
          ),
          LoanSlider(
            width: widget.width * 0.75,
          ),
          SizedBox(
            height: spaceSize,
          ),
          LoanPeriod(width: widget.width * 0.75, height: loanPeriodHeight),
          SizedBox(
            height: buttonMargin,
          ),
          ValidateButton(
            width: widget.width * 0.75,
            height: widget.height * 0.08,
            onPressed: () {
              showCostDialog(
                  context, widget.width, widget.height, widget.screenType);
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // changes the sizes of different components depending on the screen size
    switch (widget.screenType) {
      case 'large':
        spaceSize = widget.height * 0.07;
        buttonMargin = widget.height * 0.3;
        loanPeriodHeight = widget.height * 0.15;
        break;
      case 'normal':
        spaceSize = widget.height * 0.06;
        buttonMargin = widget.height * 0.2;
        loanPeriodHeight = widget.height * 0.2;
        break;
      case 'small':
        spaceSize = widget.height * 0.05;
        buttonMargin = widget.height * 0.2;
        loanPeriodHeight = widget.height * 0.2;
        break;
    }
  }
}
