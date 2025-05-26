import 'package:flutter_login_app/models/restaurante.dart';
import 'package:flutter_login_app/services/database/database_helper.dart';

abstract class RestauranteDAO {
  Future<int> insert(Restaurante restaurante);
  Future<Restaurante?> findById(int id);
  Future<List<Restaurante>> findAll();
  Future<int> update(Restaurante restaurante);
  Future<int> delete(int id);
}

class SQLiteRestauranteDAO implements RestauranteDAO {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  Future<int> insert(Restaurante restaurante) async {
    final db = await _dbHelper.database;
    return await db.insert('restaurante', restaurante.toJson());
  }

  @override
  Future<Restaurante?> findById(int id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'restaurante',
      where: 'id_restaurante = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Restaurante.fromJson(maps.first);
  }

  @override
  Future<List<Restaurante>> findAll() async {
    final db = await _dbHelper.database;
    final maps = await db.query('restaurante', orderBy: 'nome ASC');
    return maps.map((map) => Restaurante.fromJson(map)).toList();
  }

  @override
  Future<int> update(Restaurante restaurante) async {
    final db = await _dbHelper.database;
    return await db.update(
      'restaurante',
      restaurante.toJson(),
      where: 'id_restaurante = ?',
      whereArgs: [restaurante.id_restaurante],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'restaurante',
      where: 'id_restaurante = ?',
      whereArgs: [id],
    );
  }
}
