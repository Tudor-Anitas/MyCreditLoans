import 'package:flutter/material.dart';

import '../colors.dart';

class SimpleButton extends StatelessWidget {
  late final double width;
  late final double height;
  late final Function() onPressed;
  final String? text;

  SimpleButton(
      {required this.width,
      required this.height,
      required this.onPressed,
      this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [kBoxShadow]),
      child: MaterialButton(
        child: Text(
          '$text',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
