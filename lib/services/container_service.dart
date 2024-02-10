import 'dart:convert';

import 'package:kaira/models/container_model.dart';
import 'package:http/http.dart' as http;

class ContainerService {
  final String baseUrl;

  ContainerService(this.baseUrl);

  Future<List<Containere>> getContainers() async {
    final response = await http.get(Uri.parse('$baseUrl/containers'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Containere.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load containers');
    }
  }
}
