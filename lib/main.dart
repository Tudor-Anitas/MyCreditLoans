import 'package:flutter/material.dart';
import 'package:my_credit_loans/form_data_model.dart';
import 'package:my_credit_loans/screens/loan_page.dart';
import 'package:my_credit_loans/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormData(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.customTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: const [Locale('en', ''), Locale('ro', '')],
          home: LoanPage()),
    );
  }
}
