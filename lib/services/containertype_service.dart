import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kaira/models/containertype_model.dart';

class ContainerTypeService {
  final String baseUrl;

  ContainerTypeService(this.baseUrl);

  Future<List<ContainerType>> getContainerTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/contTypes'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => ContainerType.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load container types');
    }
  }
}
