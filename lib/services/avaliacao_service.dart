import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/avaliacao.dart';
import 'preferences_service.dart';

class AvaliacaoService extends ChangeNotifier {
  List<Avaliacao> _avaliacoes = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Avaliacao> get avaliacoes => _avaliacoes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAvaliacoes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final token = await PreferencesService.getToken();
      final response = await http.get(
        Uri.parse('https://api.restaurante.com/avaliacoes'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        _avaliacoes = jsonData.map((e) => Avaliacao.fromJson(e)).toList();
      } else {
        _errorMessage = 'Erro ${response.statusCode}: ${response.reasonPhrase}';
      }
    } catch (e) {
      _errorMessage = 'Erro de conexão: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  getAvaliacoes() {}
}
