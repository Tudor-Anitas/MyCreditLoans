import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/application_events.dart';
import 'package:my_credit_loans/blocks/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc.dart';

class LoanSlider extends StatefulWidget {
  @override
  _LoanSliderState createState() => _LoanSliderState();
}

class _LoanSliderState extends State<LoanSlider> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      width: windowWidth * 0.75,
      child: Column(
        children: [
          BlocBuilder<FormBloc, ApplicationState>(
            builder: (context, state) {
              return Slider(
                value: state.formData.loanValue,
                min: 100,
                max: 1000,
                divisions: 18,
                label: '${state.formData.loanValue}',
                onChanged: (newValue) {
                  context.read<FormBloc>().add(ChangeLoanValueEvent(loanValue: newValue));
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '100',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '1000',
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          )
        ],
      ),
    );
  }
}
