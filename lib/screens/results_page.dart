import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/loan_page.dart';
import 'package:my_credit_loans/common/simple_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../form_data_model.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    int? score = Provider.of<FormData>(context).getUserScore();
    bool isSuccessful = score! >= 7;
    TextStyle? headerStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      backgroundColor: isSuccessful
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.error,
      body: Container(
        width: windowWidth,
        height: windowHeight,
        margin: EdgeInsets.only(top: windowHeight * 0.3),
        child: Center(
            child: Column(
          children: [
            Text(AppLocalizations.of(context)!.applicationHeader,
                style: headerStyle),
            isSuccessful
                ? Text(
                    AppLocalizations.of(context)!.applicationResultValid,
                    style: headerStyle,
                  )
                : Text(
                    AppLocalizations.of(context)!.applicationResultInvalid,
                    style: headerStyle,
                  ),
            isSuccessful
                ? Icon(
                    Icons.cake,
                    size: 40,
                    color: Theme.of(context).colorScheme.background,
                  )
                : Icon(
                    Icons.mood_bad,
                    size: 40,
                    color: Theme.of(context).colorScheme.background,
                  ),
            Text(
              AppLocalizations.of(context)!.creditScoreHeader,
              style: headerStyle,
            ),
            Text(
              '$score',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: windowHeight * 0.2,
            ),
            SimpleButton(
              text: AppLocalizations.of(context)!.finishBtn,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: LoanPage(), type: PageTransitionType.fade));
              },
            )
          ],
        )),
      ),
    );
  }
}
