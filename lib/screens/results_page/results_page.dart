import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';
import 'package:my_credit_loans/widgets/simple_button.dart';
import 'package:page_transition/page_transition.dart';

class ResultsPage extends StatelessWidget {

  /// The loan score fetched from the API
  late int score;

  /// Will show the score result fetched from the API
  /// using the accentColor if it's 7 or above or the errorColor otherwise
  ResultsPage({required this.score});

  @override
  Widget build(BuildContext context) {

    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    // if the score from the API is bigger or equal to 7, the result is successful
    bool isSuccessful = score >= 7;
    TextStyle? headerStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      backgroundColor: isSuccessful ?
          Theme.of(context).accentColor : Theme.of(context).errorColor,
      body: Container(
        margin: EdgeInsets.only(top: windowHeight * 0.3),
        child: Center(
          child: Column(
            children: [
              Text('Your application was', style: headerStyle),
              isSuccessful ? Text('successful!', style: headerStyle,) : Text('unsuccessful!', style: headerStyle,),
              isSuccessful ? Icon(Icons.cake, size: 40, color: Theme.of(context).backgroundColor,) :
                             Icon(Icons.mood_bad, size: 40, color: Theme.of(context).backgroundColor,),

              Text('Your credit score is', style: headerStyle,),
              Text('$score', style: Theme.of(context).textTheme.headline1,),
              SizedBox(height: windowHeight * 0.2,),
              SimpleButton(
                width: windowWidth * 0.28,
                height: windowHeight * 0.05,
                text: 'Finish',
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      PageTransition(child: MainPage(), type: PageTransitionType.fade)
                  );
                },
              )
            ],
          )
        ),
      ),
    );
  }
}
