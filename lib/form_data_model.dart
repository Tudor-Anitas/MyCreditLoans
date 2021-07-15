import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_credit_loans/methods.dart';

class FormData extends ChangeNotifier {
  double _loanValue = 100;
  int _loanPeriod = 1;
  String? _userName = '';
  String? _userJob = '';
  String? _userIncome = '';
  bool _isEmployed = false;
  int? _score = 1;

  double getLoanValue() => _loanValue;
  int getLoanPeriod() => _loanPeriod;
  String? getUserName() => _userName;
  String? getUserJob() => _userJob;
  String? getUserIncome() => _userIncome;
  bool getEmploymentStatus() => _isEmployed;
  int? getUserScore() => _score;

  updateLoanValue(double newValue) {
    _loanValue = newValue;
    notifyListeners();
  }

  updateLoanPeriod(int newPeriod) {
    _loanPeriod = newPeriod;
    notifyListeners();
  }

  updateUserName(String? name) {
    _userName = name;
    notifyListeners();
  }

  updateUserJob(String? job) {
    _userJob = job;
    notifyListeners();
  }

  updateUserIncome(String? income) {
    _userIncome = income;
    notifyListeners();
  }

  updateEmploymentStatus(bool newValue) {
    _isEmployed = newValue;
    notifyListeners();
  }

  updateUserScore() async{
    _score = await getScore();
    notifyListeners();
  }
}
