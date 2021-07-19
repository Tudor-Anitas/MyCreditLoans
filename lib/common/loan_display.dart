import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_credit_loans/blocks/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc.dart';

class LoanDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    bool isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom != 0 ? true : false;
    return Container(
      width: windowWidth * 0.9,
      height: isKeyboardOpen ? 0 : windowHeight * 0.25,
      padding:
          EdgeInsets.only(top: windowHeight * 0.03, left: windowWidth * 0.05),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: BlocBuilder<FormBloc, ApplicationState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                  width: windowWidth,
                  child: Text(AppLocalizations.of(context)!.paymentHeadline,
                      style: Theme.of(context).textTheme.headline6)),
              Container(
                  width: windowWidth,
                  child: Text(
                      '${((state.formData.loanValue + state.formData.loanValue / 100) / state.formData.loanPeriod).round()} RON')),
              SizedBox(
                height: windowHeight * 0.03,
              ),
              Container(
                  width: windowWidth,
                  child: Text(
                    AppLocalizations.of(context)!.periodOfTime,
                    style: Theme.of(context).textTheme.headline6,
                  )),
              Container(
                  width: windowWidth,
                  child: Text('${state.formData.loanPeriod} ' +
                      AppLocalizations.of(context)!.months))
            ],
          );
        },
      ),
    );
  }
}
