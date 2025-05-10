import 'package:flutter_login_app/models/culinaria.dart';
import 'package:flutter_login_app/services/database/database_helper.dart';

abstract class CulinariaDAO {
  Future<int> insert(Culinaria culinaria);
  Future<Culinaria?> findById(int id);
  Future<List<Culinaria>> findAll();
  Future<int> update(Culinaria culinaria);
  Future<int> delete(int id);
}

class SQLiteCulinariaDAO implements CulinariaDAO {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  Future<int> insert(Culinaria culinaria) async {
    final db = await _dbHelper.database;
    return await db.insert('culinaria', culinaria.toMap());
  }

  @override
  Future<Culinaria?> findById(int id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'culinaria',
      where: 'id_culinaria = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Culinaria.fromMap(maps.first);
  }

  @override
  Future<List<Culinaria>> findAll() async {
    final db = await _dbHelper.database;
    final maps = await db.query('culinaria', orderBy: 'tipo ASC');
    return maps.map((map) => Culinaria.fromMap(map)).toList();
  }

  @override
  Future<int> update(Culinaria culinaria) async {
    final db = await _dbHelper.database;
    return await db.update(
      'culinaria',
      culinaria.toMap(),
      where: 'id_culinaria = ?',
      whereArgs: [culinaria.id_culinaria],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'culinaria',
      where: 'id_culinaria = ?',
      whereArgs: [id],
    );
  }
}
