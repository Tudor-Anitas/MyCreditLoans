import 'package:flutter/material.dart';
import 'package:my_credit_loans/common/switch_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../form_data_model.dart';

class EmploymentStatus extends StatefulWidget {
  @override
  _EmploymentStatusState createState() => _EmploymentStatusState();
}

class _EmploymentStatusState extends State<EmploymentStatus> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Consumer<FormData>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                value.updateEmploymentStatus(true);
              },
              child: SwitchButton(
                width: windowWidth * 0.35,
                height: windowHeight * 0.06,
                title: AppLocalizations.of(context)!.employed,
                isActive: value.getEmploymentStatus(),
              )),
          SizedBox(
            width: windowWidth * 0.05,
          ),
          GestureDetector(
              onTap: () {
                value.updateEmploymentStatus(false);
              },
              child: SwitchButton(
                width: windowWidth * 0.35,
                height: windowHeight * 0.06,
                title: AppLocalizations.of(context)!.unemployed,
                isActive: !value.getEmploymentStatus(),
              ))
        ],
      ),
    );
  }
}
