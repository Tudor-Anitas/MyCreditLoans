import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/application_events.dart';
import 'package:my_credit_loans/blocks/application_states.dart';
import 'package:my_credit_loans/blocks/form_data_model.dart';

import '../methods.dart';

class FormBloc extends Bloc<AppEvent, ApplicationState> {
  FormBloc() : super(ApplicationInitialState());

  @override
  Stream<ApplicationState> mapEventToState(AppEvent event) async* {
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

  Future<ApplicationState> _mapLoanValueToState(
      ChangeLoanValueEvent event) async {
    FormData model = state.formData;
    FormData newForm = model.copyWith(
      loanValue: event.loanValue,
    );
    return ChangedFormState(formData: newForm);
  }

  Future<ApplicationState> _mapTimePeriodToState(
      ChangeTimePeriodEvent event) async {
    FormData model = state.formData;
    FormData newForm = model.copyWith(
      loanPeriod: event.timePeriod,
    );
    return ChangedFormState(formData: newForm);
  }

  Future<ApplicationState> _mapEmploymentToState(ChangeEmploymentEvent event) async{
    FormData model = state.formData;
    FormData newForm = model.copyWith(isEmployed: event.isEmployed);
    return ChangedFormState(formData: newForm);
  }

  Future<ApplicationState> _mapNameToState(ChangeNameEvent event) async{
    FormData model = state.formData;
    FormData newForm = model.copyWith(userName: event.name);
    return ChangedFormState(formData: newForm);
  }

  Future<ApplicationState> _mapJobToState(ChangeJobEvent event) async{
    FormData model = state.formData;
    FormData newForm = model.copyWith(userJob: event.job);
    return ChangedFormState(formData: newForm);
  }

  Future<ApplicationState> _mapIncomeToState(ChangeIncomeEvent event) async{
    FormData model = state.formData;
    FormData newForm = model.copyWith(userIncome: event.income);
    return ChangedFormState(formData: newForm);
  }

  Future<ApplicationState> _mapImageToState(ChangeImageEvent event) async{
    FormData model = state.formData;
    FormData newForm = model.copyWith(image: event.image);
    return ChangedFormState(formData: newForm);
  }

  Future<ApplicationState> _mapValidatorToState(ValidateFormEvent event) async{
    FormData model = state.formData;
    FormData newForm;

    if (event.formKey?.currentState != null &&
        event.formKey!.currentState!.validate() &&
        event.currentForm!.image != null) {
      int? score = await getScore();

      if (score == null) {
        return HttpErrorState(model);
      } else {
        newForm = model.copyWith(score: score);
        return FinishedFormState(newForm);
      }
    } else
        return InvalidInputState(model);
  }

  Future<ApplicationState> _mapResetFormToState(ResetFormEvent event) async{
    return ApplicationInitialState();
  }
}
