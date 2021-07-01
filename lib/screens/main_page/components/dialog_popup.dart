import 'package:flutter/material.dart';
import 'package:my_credit_loans/screens/main_page/main_page.dart';
import 'package:my_credit_loans/widgets/cancel_button.dart';
import 'package:my_credit_loans/widgets/validate_button.dart';



showCostDialog(BuildContext context, double width, double height){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('The applied interest is 1%', style: Theme.of(context).textTheme.bodyText2),
          content: Text('the payment for every month will be ${MainPage.loanValue}'),
          backgroundColor: Theme.of(context).backgroundColor,
          actions: [
            CancelButton(width: width, height: height, onPressed: (){Navigator.of(context).pop();}),
            ValidateButton(width: width, height: height, text: 'Accept',onPressed: (){})
          ],
        );
      }
  );
}
