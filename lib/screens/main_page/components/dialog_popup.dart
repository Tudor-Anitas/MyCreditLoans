import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/details_page/details_page.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';
import 'package:my_credit_loans/widgets/cancel_button.dart';
import 'package:my_credit_loans/widgets/validate_button.dart';
import 'package:page_transition/page_transition.dart';

/// Shows dialog with loan info
showCostDialog(BuildContext context, double width, double height) {
  double finalLoan =
      (MainPage.loanValue + MainPage.loanValue / 100) / MainPage.timePeriod;

  String periodPlural = MainPage.timePeriod == 1? 'month' : 'months';

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('The applied interest is 1%',
              style: Theme.of(context).textTheme.bodyText2),
          content: Text(
              'The loan selected is: ${MainPage.loanValue.round()} RON, for ${MainPage.timePeriod} $periodPlural, the payment for every month will be ${finalLoan.round()} RON'),
          backgroundColor: Theme.of(context).backgroundColor,
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
                text: 'Accept',
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
