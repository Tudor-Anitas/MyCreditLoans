import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/blocks/form_bloc/form_data_model.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class ChangeLoanValueEvent extends AppEvent {
  final double? loanValue;

  ChangeLoanValueEvent({this.loanValue});

  @override
  List<Object?> get props => [loanValue];
}

class ChangeTimePeriodEvent extends AppEvent {
  final int? timePeriod;

  ChangeTimePeriodEvent({this.timePeriod});

  @override
  List<Object?> get props => [timePeriod];
}

class ChangeEmploymentEvent extends AppEvent {
  final bool? isEmployed;

  ChangeEmploymentEvent({this.isEmployed});

  @override
  List<Object?> get props => [isEmployed];
}

class ChangeNameEvent extends AppEvent {
  final String? name;

  ChangeNameEvent({this.name});

  @override
  List<Object?> get props => [name];
}

class ChangeJobEvent extends AppEvent {
  final String? job;

  ChangeJobEvent({this.job});

  @override
  List<Object?> get props => [job];
}

class ChangeIncomeEvent extends AppEvent {
  final String? income;

  ChangeIncomeEvent({this.income});

  @override
  List<Object?> get props => [income];
}

class ChangeImageEvent extends AppEvent {
  final PickedFile? image;

  ChangeImageEvent({this.image});

  @override
  List<Object?> get props => [image];
}

class ValidateFormEvent extends AppEvent {
  final FormDataModel? currentForm;
  final GlobalKey<FormState>? formKey;

  ValidateFormEvent({this.currentForm, this.formKey});

  @override
  List<Object?> get props => [currentForm];
}

class ResetFormEvent extends AppEvent {
  ResetFormEvent();

  @override
  List<Object?> get props => [];

}
