import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/culinaria.dart';
import 'preferences_service.dart';

class CulinariaService {
  Future<List<Culinaria>> getCulinarias() async {
    try {
      final token = await PreferencesService.getToken();
      final response = await http.get(
        Uri.parse('https://api.restaurante.com/culinarias'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        return jsonData.map((e) => Culinaria.fromJson(e)).toList();
      } else {
        throw Exception(
            'Erro ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
