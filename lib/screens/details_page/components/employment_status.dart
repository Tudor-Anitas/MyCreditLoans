import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/details_page/components/details_form.dart';
import 'package:my_credit_loans/screens/details_page/components/switch_button.dart';

class EmploymentStatus extends StatefulWidget {
  late final double width;
  late final double height;

  EmploymentStatus({required this.width, required this.height});

  @override
  _EmploymentStatusState createState() => _EmploymentStatusState();
}

class _EmploymentStatusState extends State<EmploymentStatus> {
  @override
  Widget build(BuildContext context) {
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
              width: widget.width * 0.35,
              height: widget.height * 0.08,
              title: 'Employed',
              isActive: DetailsForm.isEmployed,
            )),
        SizedBox(
          width: widget.width * 0.05,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                DetailsForm.isEmployed = false;
              });
            },
            child: SwitchButton(
              width: widget.width * 0.35,
              height: widget.height * 0.08,
              title: 'Unemployed',
              isActive: !DetailsForm.isEmployed,
            ))
      ],
    );
  }
}
