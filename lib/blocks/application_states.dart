import 'package:equatable/equatable.dart';

import 'form_data_model.dart';

abstract class ApplicationState extends Equatable {
  final FormData formData;

  const ApplicationState({required this.formData});

  @override
  List<Object> get props => [formData];
}

class ApplicationInitialState extends ApplicationState {
  ApplicationInitialState() : super(formData: FormData());
}

class ChangedFormState extends ApplicationState {
  final FormData formData;

  const ChangedFormState({required this.formData}) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}

class HttpErrorState extends ApplicationState {
  final FormData formData;

  const HttpErrorState(this.formData) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}

class InvalidInputState extends ApplicationState{
  final FormData formData;

  InvalidInputState(this.formData) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}

class FinishedFormState extends ApplicationState{
  final FormData formData;

  FinishedFormState(this.formData) : super(formData: formData);

  @override
  List<Object> get props => [formData];
}
