import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  late final double height;

  Headline({required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: height,
            child: Center(
                child: Text('Welcome!',
                    style: Theme.of(context).textTheme.headline2))),
      ],
    );
  }
}
