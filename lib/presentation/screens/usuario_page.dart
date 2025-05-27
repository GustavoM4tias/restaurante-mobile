import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/usuario.dart';
import '../../providers/usuario_provider.dart'; // ← aqui importa o provider

class UsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsuarioProvider()..fetchUsuarios(), // ← provider correto
      child: Scaffold(
        appBar: AppBar(
          title: Text('Usuários'),
        ),
        body: Consumer<UsuarioProvider>(
          // ← consumer correto
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage != null) {
              return Center(child: Text('Erro: ${provider.errorMessage}'));
            }

            return ListView.builder(
              itemCount: provider.usuarios.length,
              itemBuilder: (context, index) {
                final Usuario usuario = provider.usuarios[index];
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
