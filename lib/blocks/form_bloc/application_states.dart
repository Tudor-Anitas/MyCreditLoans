import 'package:equatable/equatable.dart';

import 'form_data_model.dart';

abstract class FormApplicationState extends Equatable {
  final FormDataModel formData;

  const FormApplicationState({required this.formData});

  @override
  List<Object> get props => [formData];
}

class ApplicationInitialState extends FormApplicationState {
  ApplicationInitialState() : super(formData: FormDataModel());
}

class ChangedFormState extends FormApplicationState {
  final FormDataModel formData;

  const ChangedFormState({required this.formData}) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}

class HttpErrorState extends FormApplicationState {
  final FormDataModel formData;

  const HttpErrorState(this.formData) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}

class InvalidInputState extends FormApplicationState{
  final FormDataModel formData;

  InvalidInputState(this.formData) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}

class FinishedFormState extends FormApplicationState{
  final FormDataModel formData;

  FinishedFormState(this.formData) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}
