import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_credit_loans/constraints.dart';
import 'package:my_credit_loans/screens/details_page/components/details_form.dart';

/// Gets the [height] of the device and will return the type of the scree size:
/// 'small', 'normal' or 'large'
String getScreenSizeType(double height){
  if(height < kNORMAL_BREAKPOINT)
    return 'small';
  else if(height < kLARGE_BREAKPOINT)
    return 'normal';
  else
    return 'large';
}

/// This method will do a get request to a random number generator API
/// to provide a number representing the score of the user
Future<int> getScore() async{
  try {
    Uri uri = Uri.parse('http://www.randomnumberapi.com/api/v1.0/randomnumber?min=1&max=10&count=1');

    var response = await http.get(uri);
    var responseCode = response.statusCode;

    // if the request is successful, process the response and return the
    // number
    if (responseCode == 200) {
      var finalResponse = json.decode(response.body);
      return finalResponse[0];
    } else {
      // the request was unsuccessful, will return the flag to show
      // the user the httpError snackBar
      print(responseCode);
      return -2;
    }
  } catch (e){
    // an exception occurred, will return the flag for httpError snackBar
    print(e);
    return -2;
  }
}

class InputValidators{

  Function nameValidator = (String? value){
    // if the string is not at least 3 chars long or
    // if there are not two words (delimited by a space) or
    // if there is a space but at the end of the string
    // RETURN the error
    if(value!.length < 3 || !value.contains(' ') || (value.contains(' ') && value.endsWith(' ')))
      return '';
    return null;
  };

  // if the user is employed and
  // it didn't state the job title
  // RETURN the error
  Function jobValidator = (String? value){
    if(DetailsForm.isEmployed && value!.length < 3)
      return 'Incorrect job title';
    return null;
  };

  // if the user left the input untouched
  // RETURN the error
  Function incomeValidator = (String? value){
    if(value!.length < 1)
      return '';
    return null;
  };
}

