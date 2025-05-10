import 'package:flutter_login_app/models/restaurante.dart';
import 'package:flutter_login_app/services/database/dao/restaurante_dao.dart';

class RestauranteRepository {
  final RestauranteDAO _restauranteDAO;

  RestauranteRepository(this._restauranteDAO);

  Future<int> addRestaurante(Restaurante restaurante) async {
    // Validações antes de inserir
    if (restaurante.nome.isEmpty) {
      throw ArgumentError('Nome é obrigatório');
    }

    return await _restauranteDAO.insert(restaurante);
  }

  Future<Restaurante?> getRestaurante(int id) async {
    return await _restauranteDAO.findById(id);
  }

  Future<List<Restaurante>> getAllRestaurantes() async {
    return await _restauranteDAO.findAll();
  }

  Future<void> updateRestaurante(Restaurante restaurante) async {
    if (restaurante.id_restaurante == null) {
      throw ArgumentError('ID do restaurante não pode ser nulo');
    }

    final result = await _restauranteDAO.update(restaurante);
    if (result == 0) {
      throw StateError('Restaurante não encontrado');
    }
  }

  Future<void> deleteRestaurante(int id) async {
    final result = await _restauranteDAO.delete(id);
    if (result == 0) {
      throw StateError('Restaurante não encontrado');
    }
  }
}
