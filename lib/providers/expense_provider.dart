import 'package:flutter/material.dart';
import 'package:kaira/models/expense_model.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void setExpenses(List<Expense> expenses) {
    _expenses = expenses;
    notifyListeners();
  }
}
