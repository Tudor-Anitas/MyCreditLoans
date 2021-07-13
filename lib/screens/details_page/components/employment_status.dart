import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/details_page/components/details_form.dart';
import 'package:my_credit_loans/screens/details_page/components/switch_button.dart';

class EmploymentStatus extends StatefulWidget {


  @override
  _EmploymentStatusState createState() => _EmploymentStatusState();
}

class _EmploymentStatusState extends State<EmploymentStatus> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                DetailsForm.isEmployed = true;
              });
            },
            child: SwitchButton(
              width: windowWidth * 0.35,
              height: windowHeight * 0.06,
              title: 'Employed',
              isActive: DetailsForm.isEmployed,
            )),
        SizedBox(
          width: windowWidth * 0.05,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                DetailsForm.isEmployed = false;
              });
            },
            child: SwitchButton(
              width: windowWidth * 0.35,
              height: windowHeight * 0.06,
              title: 'Unemployed',
              isActive: !DetailsForm.isEmployed,
            ))
      ],
    );
  }
}
