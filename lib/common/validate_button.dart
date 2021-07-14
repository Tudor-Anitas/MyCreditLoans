import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ValidateButton extends StatelessWidget {
  late final width;
  late final height;
  late final onPressed;
  ValidateButton({
    this.width = 0.0,
    this.height = 0.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      width: width != 0.0 ? width : windowWidth * 0.75,
      height: height != 0.0 ? height : windowHeight * 0.065,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Color(0xff696969),
                offset: Offset(1.0, 2.0),
                blurRadius: 2.0)
          ]),
      child: MaterialButton(
          child: Text(
            AppLocalizations.of(context)!.continueBtn,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: onPressed),
    );
  }
}
