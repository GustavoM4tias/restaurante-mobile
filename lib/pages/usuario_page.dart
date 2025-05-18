import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/usuario.dart';
import '../services/usuario_service.dart';

class UsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsuarioService()..fetchUsuarios(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Usuários'),
        ),
        body: Consumer<UsuarioService>(
          builder: (context, service, _) {
            if (service.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (service.errorMessage != null) {
              return Center(child: Text('Erro: ${service.errorMessage}'));
            }

            return ListView.builder(
              itemCount: service.usuarios.length,
              itemBuilder: (context, index) {
                final Usuario usuario = service.usuarios[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(usuario.nome),
                  subtitle: Text(usuario.email),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
