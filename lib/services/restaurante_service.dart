import 'dart:convert';
import 'api_client.dart';
import '../models/restaurante.dart';

class RestauranteService {
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

  Future<List<Restaurante>> getRestaurantes() async {
    return await _retry(() async {
      final response = await _apiClient.get('/restaurantes');
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Restaurante.fromJson(json)).toList();
    });
  }

  Future<Restaurante> getRestaurantePorId(int id) async {
    return await _retry(() async {
      final response = await _apiClient.get('/restaurantes/$id');
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Restaurante.fromJson(data);
    });
  }

  Future<Restaurante> criarRestaurante(Restaurante restaurante) async {
    return await _retry(() async {
      final response =
          await _apiClient.post('/restaurantes', restaurante.toJson());
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Restaurante.fromJson(data);
    });
  }
}
