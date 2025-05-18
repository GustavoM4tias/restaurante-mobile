import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestauranteProvider extends ChangeNotifier {
  bool loading = false;
  String? error;
  List<dynamic> restaurantes = [];

  Future<void> fetchRestaurantes() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('https://api.restaurante.com/restaurantes'));
      if (response.statusCode == 200) {
        restaurantes = json.decode(response.body);
      } else {
        error = 'Erro ${response.statusCode}: ${response.reasonPhrase}';
      }
    } catch (e) {
      error = 'Erro ao carregar dados: $e';
    }

    loading = false;
    notifyListeners();
  }
}
