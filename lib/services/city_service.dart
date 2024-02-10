import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaira/models/city_model.dart';

class CityService {
  final String baseUrl;

  CityService(this.baseUrl);

  Future<List<City>> fetchCities() async {
    final response = await http.get(Uri.parse('$baseUrl/cities'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => City.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}








// Ajoutez d'autres services de la même manière pour les autres entités (ContainerType, Container, Expense)
