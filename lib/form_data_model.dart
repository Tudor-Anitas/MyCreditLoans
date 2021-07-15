import 'package:flutter/foundation.dart';

class FormData extends ChangeNotifier {
  double _loanValue = 100;
  int _loanPeriod = 1;

  double getLoanValue() => _loanValue;
  int getLoanPeriod() => _loanPeriod;

  updateLoanValue(double newValue) {
    _loanValue = newValue;
    notifyListeners();
  }

  updateLoanPeriod(int newPeriod) {
    _loanPeriod = newPeriod;
    notifyListeners();
  }
}
