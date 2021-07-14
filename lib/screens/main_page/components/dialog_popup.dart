import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/details_page/details_page.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';
import 'package:my_credit_loans/widgets/cancel_button.dart';
import 'package:my_credit_loans/widgets/validate_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Shows dialog with loan info
showCostDialog(BuildContext context, double width, double height) {
  double finalLoan =
      (MainPage.loanValue + MainPage.loanValue / 100) / MainPage.timePeriod;

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.interestHeadline,
              style: Theme.of(context).textTheme.bodyText2),
          content: Text(AppLocalizations.of(context)!.loanSelected +
              '${MainPage.loanValue.round()} RON, ' +
              '${MainPage.timePeriod} ' +
              AppLocalizations.of(context)!.months +
              AppLocalizations.of(context)!.paymentEveryMonth +
              '${finalLoan.round()} RON'),
          backgroundColor: Theme.of(context).colorScheme.background,
          contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, height * 0.21),
          actions: [
            CancelButton(
                width: width * 0.3,
                height: height * 0.07,
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            ValidateButton(
                width: width * 0.3,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: DetailsPage(
                          loanValue: finalLoan,
                          timePeriod: MainPage.timePeriod,
                        ),
                      ));
                })
          ],
        );
      });
}
