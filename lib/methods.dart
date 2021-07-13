import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_credit_loans/screens/details_page/components/details_form.dart';


/// Get score from API
Future<int> getScore() async {
  try {
    Uri uri = Uri.parse(
        'http://www.randomnumberapi.com/api/v1.0/randomnumber?min=1&max=10&count=1');
    var response = await http.get(uri);
    var responseCode = response.statusCode;

    if (responseCode == 200) {
      var finalResponse = json.decode(response.body);
      return finalResponse[0];
    } else {
      print(responseCode);
      return -2;
    }
  } catch (e) {
    print(e);
    return -2;
  }
}

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
