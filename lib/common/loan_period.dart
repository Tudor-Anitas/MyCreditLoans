import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_credit_loans/blocks/application_events.dart';
import 'package:my_credit_loans/blocks/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc.dart';

class LoanPeriod extends StatefulWidget {
  @override
  _LoanPeriodState createState() => _LoanPeriodState();
}

class _LoanPeriodState extends State<LoanPeriod> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    List<DropdownMenuItem<int>> timePeriods = [
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.oneMonth),
        value: 1,
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.threeMonths),
        value: 3,
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.sixMonths),
        value: 6,
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.oneYear),
        value: 12,
      )
    ];

    return Container(
      width: windowWidth * 0.8,
      height: windowHeight * 0.2,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: windowWidth * 0.35,
              child: Text(
                AppLocalizations.of(context)!.loanPeriod,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: windowWidth * 0.3,
              child: FittedBox(
                child: Center(
                  child: BlocBuilder<FormBloc, ApplicationState>(
                    builder: (context, state) {
                      return DropdownButtonHideUnderline(
                          child: DropdownButton(
                        value: state.formData.loanPeriod,
                        items: timePeriods,
                        style: Theme.of(context).textTheme.caption,
                        onChanged: (newPeriod) {
                          if (newPeriod is int) {
                            context.read<FormBloc>().add(
                                ChangeTimePeriodEvent(timePeriod: newPeriod));
                          }
                        },
                      ));
                    },
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
