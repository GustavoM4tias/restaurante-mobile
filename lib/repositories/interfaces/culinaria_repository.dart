import 'package:flutter_login_app/models/culinaria.dart';
import 'package:flutter_login_app/services/database/dao/culinaria_dao.dart';

class CulinariaRepository {
  final CulinariaDAO _culinariaDAO;

  CulinariaRepository(this._culinariaDAO);

  Future<int> addCulinaria(Culinaria culinaria) async {
    // Validações antes de inserir
    if (culinaria.tipo.isEmpty) {
      throw ArgumentError('O tipo de culinária é obrigatório');
    }

    return await _culinariaDAO.insert(culinaria);
  }

  Future<Culinaria?> getCulinaria(int id) async {
    return await _culinariaDAO.findById(id);
  }

  Future<List<Culinaria>> getAllCulinarias() async {
    return await _culinariaDAO.findAll();
  }

  Future<void> updateCulinaria(Culinaria culinaria) async {
    if (culinaria.id_culinaria == null) {
      throw ArgumentError('ID da culinária não pode ser nulo');
    }

    final result = await _culinariaDAO.update(culinaria);
    if (result == 0) {
      throw StateError('Culinária não encontrada');
    }
  }

  Future<void> deleteCulinaria(int id) async {
    final result = await _culinariaDAO.delete(id);
    if (result == 0) {
      throw StateError('Culinária não encontrada');
    }
  }
}
