import 'package:flutter/material.dart';
import '../models/avaliacao.dart';
import '../services/avaliacao_service.dart';

class AvaliacaoProvider extends ChangeNotifier {
  final AvaliacaoService _service = AvaliacaoService();

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
      _avaliacoes = await _service.getAvaliacoes();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
