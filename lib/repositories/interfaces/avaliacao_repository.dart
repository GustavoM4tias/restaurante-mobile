import 'package:flutter_login_app/models/avaliacao.dart';
import 'package:flutter_login_app/services/database/dao/avaliacao_dao.dart';

class AvaliacaoRepository {
  final AvaliacaoDAO _avaliacaoDAO;

  AvaliacaoRepository(this._avaliacaoDAO);

  Future<int> addAvaliacao(Avaliacao avaliacao) async {
    // Validações antes de inserir
    if (avaliacao.nota < 1 || avaliacao.nota > 5) {
      throw ArgumentError('A nota deve estar entre 1 e 5');
    }

    if (avaliacao.comentario.isEmpty) {
      throw ArgumentError('O comentário é obrigatório');
    }

    return await _avaliacaoDAO.insert(avaliacao);
  }

  Future<Avaliacao?> getAvaliacao(int id) async {
    return await _avaliacaoDAO.findById(id);
  }

  Future<List<Avaliacao>> getAllAvaliacoes() async {
    return await _avaliacaoDAO.findAll();
  }

  Future<void> updateAvaliacao(Avaliacao avaliacao) async {
    if (avaliacao.id_avaliacao == null) {
      throw ArgumentError('ID da avaliação não pode ser nulo');
    }

    final result = await _avaliacaoDAO.update(avaliacao);
    if (result == 0) {
      throw StateError('Avaliação não encontrada');
    }
  }

  Future<void> deleteAvaliacao(int id) async {
    final result = await _avaliacaoDAO.delete(id);
    if (result == 0) {
      throw StateError('Avaliação não encontrada');
    }
  }

  fetchAvaliacoes() {}
}
