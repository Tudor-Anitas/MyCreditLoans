import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/form_bloc/form_bloc.dart';
import 'package:my_credit_loans/screens/loan_page.dart';
import 'package:my_credit_loans/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBloc(),
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
