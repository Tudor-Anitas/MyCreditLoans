import 'dart:convert';
import 'package:http/http.dart' as http;


/// Get score from API
Future<int?> getScore() async {
  int? score;
  try {
    Uri uri = Uri.parse(
        'http://www.randomnumberapi.com/api/v1.0/randomnumber?min=1&max=10&count=1');
    var response = await http.get(uri);
    var responseCode = response.statusCode;

    if (responseCode == 200) {
      var finalResponse = json.decode(response.body);
      score = finalResponse[0];
    } 
  } catch (e) {
    print(e);
  }

  return score;
}
