import 'package:flutter_login_app/models/avaliacao.dart';
import 'package:flutter_login_app/services/database/database_helper.dart';

abstract class AvaliacaoDAO {
  Future<int> insert(Avaliacao avaliacao);
  Future<Avaliacao?> findById(int id);
  Future<List<Avaliacao>> findAll();
  Future<int> update(Avaliacao avaliacao);
  Future<int> delete(int id);
}

class SQLiteAvaliacaoDAO implements AvaliacaoDAO {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  Future<int> insert(Avaliacao avaliacao) async {
    final db = await _dbHelper.database;
    return await db.insert('avaliacao', avaliacao.toJson());
  }

  @override
  Future<Avaliacao?> findById(int id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'avaliacao',
      where: 'id_avaliacao = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Avaliacao.fromJson(maps.first);
  }

  @override
  Future<List<Avaliacao>> findAll() async {
    final db = await _dbHelper.database;
    final maps = await db.query('avaliacao', orderBy: 'data DESC');
    return maps.map((map) => Avaliacao.fromJson(map)).toList();
  }

  @override
  Future<int> update(Avaliacao avaliacao) async {
    final db = await _dbHelper.database;
    return await db.update(
      'avaliacao',
      avaliacao.toJson(),
      where: 'id_avaliacao = ?',
      whereArgs: [avaliacao.id_avaliacao],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'avaliacao',
      where: 'id_avaliacao = ?',
      whereArgs: [id],
    );
  }
}
