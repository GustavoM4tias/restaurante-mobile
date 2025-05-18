import 'package:flutter/material.dart';
import '../models/restaurante.dart';
import '../services/restaurante_service.dart';

class RestauranteProvider extends ChangeNotifier {
  final RestauranteService _service = RestauranteService();

  List<Restaurante> _restaurantes = [];
  bool _isLoading = false;
  String? _error;

  List<Restaurante> get restaurantes => _restaurantes;
  bool get loading => _isLoading;
  String? get error => _error;

  Future<void> fetchRestaurantes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _restaurantes = await _service.getRestaurantes();
    } catch (e) {
      _error = 'Erro ao carregar restaurantes: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
