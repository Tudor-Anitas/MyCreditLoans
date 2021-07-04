import 'package:flutter/material.dart';

class Headline extends StatelessWidget {

  late double height;
  /// Creates a headline using the headline2 textTheme of the application
  Headline({required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: height,
            child: Center(
                child: Text('Welcome!', style: Theme.of(context).textTheme.headline2)
            )
        ),
      ],
    );
  }
}
