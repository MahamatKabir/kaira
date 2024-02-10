import 'dart:convert';

import 'package:kaira/models/expense_model.dart';
import 'package:http/http.dart' as http;

class ExpenseService {
  final String baseUrl;

  ExpenseService(this.baseUrl);

  Future<List<Expense>> getExpenses() async {
    final response = await http.get(Uri.parse('$baseUrl/expenses'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Expense.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load expenses');
    }
  }
}
