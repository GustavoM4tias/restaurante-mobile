import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/culinaria.dart';
import 'preferences_service.dart';

class CulinariaService extends ChangeNotifier {
  List<Culinaria> _culinarias = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Culinaria> get culinarias => _culinarias;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCulinarias() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final token = await PreferencesService.getToken();
      final response = await http.get(
        Uri.parse('https://api.restaurante.com/culinarias'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        _culinarias = jsonData.map((e) => Culinaria.fromJson(e)).toList();
      } else {
        _errorMessage = 'Erro ${response.statusCode}: ${response.reasonPhrase}';
      }
    } catch (e) {
      _errorMessage = 'Erro de conexão: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
