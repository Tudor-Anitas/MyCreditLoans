import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';

class ValidateButton extends StatelessWidget {

  late double width;
  late double height;
  late var onPressed;
  String text;

  ValidateButton({
    required this.width,
    required this.height,
    this.text = 'Continue',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: MaterialButton(
        child: Text('$text',style: Theme.of(context).textTheme.button,),
        onPressed: onPressed
      ),
    );
  }
}
