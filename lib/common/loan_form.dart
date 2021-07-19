import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/form_bloc/form_bloc.dart';
import 'package:my_credit_loans/common/dialog_popup.dart';
import 'package:my_credit_loans/common/loan_period.dart';
import 'package:my_credit_loans/common/slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_credit_loans/common/validate_button.dart';

class LoanForm extends StatefulWidget {
  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  late double loanPeriodHeight;

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      width: windowWidth,
      height: windowHeight * 0.66,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          SizedBox(
            height: windowHeight * 0.05,
          ),
          Container(
            width: windowWidth * 0.35,
            child: Text(
              AppLocalizations.of(context)!.loanHeadline,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: windowHeight * 0.05,
          ),
          LoanSlider(),
          SizedBox(
            height: windowHeight * 0.02,
          ),
          LoanPeriod(),
          SizedBox(
            height: windowHeight * 0.08,
          ),
          ValidateButton(
            onPressed: () {
              showCostDialog(context, windowWidth, windowHeight,
                  BlocProvider.of<FormBloc>(context).state.formData);
            },
          )
        ],
      ),
    );
  }
}
