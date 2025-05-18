import 'package:flutter/material.dart';
import '../models/culinaria.dart';
import '../services/culinaria_service.dart';

class CulinariaProvider extends ChangeNotifier {
  final CulinariaService _service = CulinariaService();

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
      _culinarias = await _service.getCulinarias();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
