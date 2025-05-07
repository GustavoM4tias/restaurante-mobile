import 'package:flutter_login_app/models/usuario.dart';
import 'package:flutter_login_app/services/database/database_helper.dart';

abstract class UsuarioDAO {
  Future<int> insert(Usuario usuario);
  Future<Usuario?> findById(int id);
  Future<List<Usuario>> findAll();
  Future<Usuario?> findByEmail(String email);
  Future<int> update(Usuario usuario);
  Future<int> delete(int id);
}

class SQLiteUsuarioDAO implements UsuarioDAO {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  Future<int> insert(Usuario usuario) async {
    final db = await _dbHelper.database;
    return await db.insert('usuario', usuario.toMap());
  }

  @override
  Future<Usuario?> findById(int id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'usuario',
      where: 'id_usuario = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Usuario.fromMap(maps.first);
  }

  @override
  Future<List<Usuario>> findAll() async {
    final db = await _dbHelper.database;
    final maps = await db.query('usuario', orderBy: 'nome ASC');
    return maps.map((map) => Usuario.fromMap(map)).toList();
  }

  @override
  Future<Usuario?> findByEmail(String email) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'usuario',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isEmpty) return null;
    return Usuario.fromMap(maps.first);
  }

  @override
  Future<int> update(Usuario usuario) async {
    final db = await _dbHelper.database;
    return await db.update(
      'usuario',
      usuario.toMap(),
      where: 'id_usuario = ?',
      whereArgs: [usuario.id_usuario],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'usuario',
      where: 'id_usuario = ?',
      whereArgs: [id],
    );
  }
}
