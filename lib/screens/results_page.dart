import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/form_bloc/application_events.dart';
import 'package:my_credit_loans/blocks/form_bloc/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc/form_bloc.dart';
import 'package:my_credit_loans/screens/loan_page.dart';
import 'package:my_credit_loans/common/simple_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    TextStyle? headerStyle = Theme.of(context).textTheme.headline6;

    return BlocBuilder<FormBloc, FormApplicationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: (state.formData.score ?? 1) >= 7
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
                (state.formData.score ?? 1) >= 7
                    ? Text(
                        AppLocalizations.of(context)!.applicationResultValid,
                        style: headerStyle,
                      )
                    : Text(
                        AppLocalizations.of(context)!.applicationResultInvalid,
                        style: headerStyle,
                      ),
                (state.formData.score ?? 1) >= 7
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
                  '${state.formData.score ?? 1}',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: windowHeight * 0.2,
                ),
                SimpleButton(
                  text: AppLocalizations.of(context)!.finishBtn,
                  onPressed: () {
                    context.read<FormBloc>().add(ResetFormEvent());
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
      },
    );
  }
}
