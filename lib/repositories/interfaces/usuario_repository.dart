import 'package:flutter_login_app/models/usuario.dart';
import 'package:flutter_login_app/services/database/dao/usuario_dao.dart';

class UsuarioRepository {
  final UsuarioDAO _usuarioDAO;

  UsuarioRepository(this._usuarioDAO);

  Future<int> addUsuario(Usuario usuario) async {
    // Validações antes de inserir
    if (usuario.nome.isEmpty || usuario.email.isEmpty || usuario.senha.isEmpty) {
      throw ArgumentError('Nome, email e senha são obrigatórios');
    }

    // Verificar se o e-mail já está cadastrado
    final existingUser = await _usuarioDAO.findByEmail(usuario.email);
    if (existingUser != null) {
      throw StateError('E-mail já cadastrado');
    }

    return await _usuarioDAO.insert(usuario);
  }

  Future<Usuario?> getUsuario(int id) async {
    return await _usuarioDAO.findById(id);
  }

  Future<List<Usuario>> getAllUsuarios() async {
    return await _usuarioDAO.findAll();
  }

  Future<void> updateUsuario(Usuario usuario) async {
    if (usuario.id_usuario == null) {
      throw ArgumentError('ID do usuário não pode ser nulo');
    }

    final result = await _usuarioDAO.update(usuario);
    if (result == 0) {
      throw StateError('Usuário não encontrado');
    }
  }

  Future<void> deleteUsuario(int id) async {
    final result = await _usuarioDAO.delete(id);
    if (result == 0) {
      throw StateError('Usuário não encontrado');
    }
  }

  Future<Usuario?> findByEmail(String email) async {
    return await _usuarioDAO.findByEmail(email);
  }
}
