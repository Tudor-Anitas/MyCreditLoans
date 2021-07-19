import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/application_events.dart';
import 'package:my_credit_loans/blocks/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc.dart';
import 'package:my_credit_loans/common/switch_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmploymentStatus extends StatefulWidget {
  @override
  _EmploymentStatusState createState() => _EmploymentStatusState();
}

class _EmploymentStatusState extends State<EmploymentStatus> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<FormBloc, ApplicationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  context
                      .read<FormBloc>()
                      .add(ChangeEmploymentEvent(isEmployed: true));
                },
                child: SwitchButton(
                  width: windowWidth * 0.35,
                  height: windowHeight * 0.06,
                  title: AppLocalizations.of(context)!.employed,
                  isActive: state.formData.isEmployed,
                )),
            SizedBox(
              width: windowWidth * 0.05,
            ),
            GestureDetector(
                onTap: () {
                  context
                      .read<FormBloc>()
                      .add(ChangeEmploymentEvent(isEmployed: false));
                },
                child: SwitchButton(
                  width: windowWidth * 0.35,
                  height: windowHeight * 0.06,
                  title: AppLocalizations.of(context)!.unemployed,
                  isActive: !state.formData.isEmployed,
                ))
          ],
        );
      },
    );
  }
}
