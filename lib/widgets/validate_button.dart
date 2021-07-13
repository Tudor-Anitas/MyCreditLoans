import 'package:flutter/material.dart';
import 'package:my_credit_loans/colors.dart';

class ValidateButton extends StatelessWidget {
  late final double width;
  late final double height;
  late final onPressed;
  final String text;

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
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [kBoxShadow]),
      child: MaterialButton(
          child: Text(
            '$text',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: onPressed),
    );
  }
}
