import 'dart:convert';
import 'api_client.dart';
import '../models/avaliacao.dart';

class AvaliacaoService {
  final ApiClient _apiClient = ApiClient();

  Future<T> _retry<T>(Future<T> Function() request, {int retries = 3}) async {
    for (int attempt = 0; attempt < retries; attempt++) {
      try {
        return await request();
      } catch (e) {
        if (attempt == retries - 1) rethrow;
        await Future.delayed(Duration(seconds: 2));
      }
    }
    throw Exception('Falha após $retries tentativas');
  }

  Future<List<Avaliacao>> getAvaliacoes() async {
    return await _retry(() async {
      final response = await _apiClient.get('/avaliacoes');
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Avaliacao.fromJson(json)).toList();
    });
  }

  Future<Avaliacao> criarAvaliacao(Avaliacao avaliacao) async {
    return await _retry(() async {
      final response = await _apiClient.post('/avaliacoes', avaliacao.toJson());
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Avaliacao.fromJson(data);
    });
  }
}
