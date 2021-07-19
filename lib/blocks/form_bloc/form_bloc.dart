import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/form_bloc/application_events.dart';
import 'package:my_credit_loans/blocks/form_bloc/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc/form_data_model.dart';

import '../../methods.dart';

class FormBloc extends Bloc<AppEvent, FormApplicationState> {
  FormBloc() : super(ApplicationInitialState());

  @override
  Stream<FormApplicationState> mapEventToState(AppEvent event) async* {
    if (event is ChangeLoanValueEvent) {
      yield await _mapLoanValueToState(event);
    } else if (event is ChangeTimePeriodEvent) {
      yield await _mapTimePeriodToState(event);
    } else if (event is ChangeEmploymentEvent){
      yield await _mapEmploymentToState(event);
    } else if(event is ChangeNameEvent){
      yield await _mapNameToState(event);
    } else if(event is ChangeJobEvent){
      yield await _mapJobToState(event);
    } else if(event is ChangeIncomeEvent){
      yield await _mapIncomeToState(event);
    } else if(event is ChangeImageEvent){
      yield await _mapImageToState(event);
    } else if(event is ValidateFormEvent){
      yield await _mapValidatorToState(event);
    } else if(event is ResetFormEvent){
      yield await _mapResetFormToState(event);
    }
  } 

  Future<FormApplicationState> _mapLoanValueToState(
      ChangeLoanValueEvent event) async {
    FormDataModel model = state.formData;
    FormDataModel updatedModel = model.copyWith(
      loanValue: event.loanValue,
    );
    return ChangedFormState(formData: updatedModel);
  }
  
  Future<FormApplicationState> _mapTimePeriodToState(
      ChangeTimePeriodEvent event) async {
    FormDataModel model = state.formData;
    FormDataModel updatedModel = model.copyWith(
      loanPeriod: event.timePeriod,
    );
    return ChangedFormState(formData: updatedModel);
  }

  Future<FormApplicationState> _mapEmploymentToState(ChangeEmploymentEvent event) async{
    FormDataModel model = state.formData;
    FormDataModel updatedModel = model.copyWith(isEmployed: event.isEmployed);
    return ChangedFormState(formData: updatedModel);
  }

  Future<FormApplicationState> _mapNameToState(ChangeNameEvent event) async{
    FormDataModel model = state.formData;
    FormDataModel updatedModel = model.copyWith(userName: event.name);
    return ChangedFormState(formData: updatedModel);
  }

  Future<FormApplicationState> _mapJobToState(ChangeJobEvent event) async{
    FormDataModel model = state.formData;
    FormDataModel updatedModel = model.copyWith(userJob: event.job);
    return ChangedFormState(formData: updatedModel);
  }

  Future<FormApplicationState> _mapIncomeToState(ChangeIncomeEvent event) async{
    FormDataModel model = state.formData;
    FormDataModel updatedModel = model.copyWith(userIncome: event.income);
    return ChangedFormState(formData: updatedModel);
  }

  Future<FormApplicationState> _mapImageToState(ChangeImageEvent event) async{
    FormDataModel model = state.formData;
    FormDataModel updatedModel = model.copyWith(image: event.image);
    return ChangedFormState(formData: updatedModel);
  }

  Future<FormApplicationState> _mapValidatorToState(ValidateFormEvent event) async{
    FormDataModel model = state.formData;
    FormDataModel updatedModel;

    if (event.formKey?.currentState != null &&
        event.formKey!.currentState!.validate() &&
        event.currentForm!.image != null) {
      int? score = await getScore();

      if (score == null) {
        return HttpErrorState(model);
      } else {
        updatedModel = model.copyWith(score: score);
        return FinishedFormState(updatedModel);
      }
    } else
        return InvalidInputState(model);
  }

  Future<FormApplicationState> _mapResetFormToState(ResetFormEvent event) async{
    return ApplicationInitialState();
  }
}
