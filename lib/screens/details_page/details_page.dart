import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/details_page/components/details_form.dart';
import 'package:my_credit_loans/screens/details_page/components/loan_display.dart';

class DetailsPage extends StatefulWidget {

  late double loanValue;
  late int timePeriod;
  late String screenType;
  late double width;
  late double height;

  /// The page will display the selected loan plan and will provide a form
  /// to get some information about the user to calculate its score
  DetailsPage({
    required this.loanValue,
    required this.timePeriod,
    required this.screenType,
    required this.width,
    required this.height
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  // the height of the loanDisplay component
  late double loanDisplayHeight;
  // the space between the loanDisplay and detailsForm
  late double space;

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            SizedBox(height: widget.height * 0.05,),
            LoanDisplay(
                width: widget.width * 0.85,
                height: isKeyboardOpen? 0 : loanDisplayHeight,
                loanValue: widget.loanValue,
                timePeriod: widget.timePeriod
            ),
            SizedBox(height: space,),
            DetailsForm(width: widget.width * 0.9, height: widget.height * 0.65, screenType: widget.screenType,)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    switch(widget.screenType){
      case 'large':
        loanDisplayHeight = widget.height * 0.2;
        space = widget.height * 0.1;
        break;
      case 'normal':
        loanDisplayHeight = widget.height * 0.25;
        space = widget.height * 0.05;
        break;
      case 'small':
        break;
    }
  }
}
