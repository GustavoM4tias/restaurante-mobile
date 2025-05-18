import 'dart:convert';
import 'api_client.dart';
import '../models/culinaria.dart';

class CulinariaService {
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

  Future<List<Culinaria>> getCulinarias() async {
    return await _retry(() async {
      final response = await _apiClient.get('/culinarias');
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Culinaria.fromJson(json)).toList();
    });
  }
}
