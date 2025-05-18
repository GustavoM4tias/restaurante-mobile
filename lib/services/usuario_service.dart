import 'dart:convert';
import '../models/usuario.dart';
import 'api_client.dart';

class UsuarioService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Usuario>> getUsuarios() async {
    final response = await _apiClient.get('/usuarios');
    final data = jsonDecode(response.body) as List;
    return data.map((json) => Usuario.fromJson(json)).toList();
  }

  Future<Usuario> getUsuarioPorId(int id) async {
    final response = await _apiClient.get('/usuarios/$id');
    final data = jsonDecode(response.body);
    return Usuario.fromJson(data);
  }

  Future<Usuario> criarUsuario(Usuario usuario) async {
    final response = await _apiClient.post('/usuarios', usuario.toJson());
    final data = jsonDecode(response.body);
    return Usuario.fromJson(data);
  }
}
