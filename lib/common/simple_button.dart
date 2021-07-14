import 'package:flutter/material.dart';


class SimpleButton extends StatelessWidget {
  late final Function() onPressed;
  final String? text;

  SimpleButton({required this.onPressed, this.text = ''});

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      width: windowWidth * 0.28,
      height: windowHeight * 0.05,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Color(0xff696969),
                offset: Offset(1.0, 2.0),
                blurRadius: 2.0)
          ]),
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
