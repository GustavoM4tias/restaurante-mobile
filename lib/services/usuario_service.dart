import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../services/api_client.dart';

class UsuarioService extends ChangeNotifier {
  final ApiClient _apiClient = ApiClient();

  List<Usuario> _usuarios = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Usuario> get usuarios => _usuarios;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUsuarios() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiClient.get('/usuarios');
      final data = jsonDecode(response.body) as List;
      _usuarios = data.map((json) => Usuario.fromJson(json)).toList();
    } catch (e) {
      _errorMessage = 'Erro ao carregar usuários: $e';
    }

    _isLoading = false;
    notifyListeners();
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
