import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: windowHeight * 0.34,
            child: Center(
                child: Text('Welcome!',
                    style: Theme.of(context).textTheme.headline2))),
      ],
    );
  }
}
