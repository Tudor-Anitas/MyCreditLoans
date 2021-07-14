import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                child: Text(AppLocalizations.of(context)!.welcome,
                    style: Theme.of(context).textTheme.headline2))),
      ],
    );
  }
}
