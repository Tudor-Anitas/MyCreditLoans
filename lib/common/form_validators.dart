import 'package:my_credit_loans/common/details_form.dart';

class InputValidators {
  Function nameValidator = (String? value) {
    if (value!.length < 3 ||
        !value.contains(' ') ||
        (value.contains(' ') && value.endsWith(' '))) return '';
    return null;
  };

  Function jobValidator = (String? value) {
    if (DetailsForm.isEmployed && value!.length < 3)
      return '';
    return null;
  };

  Function incomeValidator = (String? value) {
    if (value!.length < 1) return '';
    return null;
  };
}