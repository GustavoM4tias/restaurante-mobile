import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/avaliacao.dart';
import 'preferences_service.dart';

class AvaliacaoService {
  Future<List<Avaliacao>> getAvaliacoes() async {
    try {
      final token = await PreferencesService.getToken();
      final response = await http.get(
        Uri.parse('https://api.restaurante.com/avaliacoes'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        return jsonData.map((e) => Avaliacao.fromJson(e)).toList();
      } else {
        throw Exception(
            'Erro ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
