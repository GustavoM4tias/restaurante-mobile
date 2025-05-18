import 'dart:convert';
import 'api_client.dart';
import '../models/usuario.dart';

class UsuarioService {
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

  Future<List<Usuario>> getUsuarios() async {
    return await _retry(() async {
      final response = await _apiClient.get('/usuarios');
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Usuario.fromJson(json)).toList();
    });
  }

  Future<Usuario> getUsuarioPorId(int id) async {
    return await _retry(() async {
      final response = await _apiClient.get('/usuarios/$id');
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Usuario.fromJson(data);
    });
  }

  Future<Usuario> criarUsuario(Usuario usuario) async {
    return await _retry(() async {
      final response = await _apiClient.post('/usuarios', usuario.toJson());
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Usuario.fromJson(data);
    });
  }
}
