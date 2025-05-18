import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/avaliacao_provider.dart';

class AvaliacaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AvaliacaoProvider()..fetchAvaliacoes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Avaliações'),
        ),
        body: Consumer<AvaliacaoProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage != null) {
              return Center(child: Text('Erro: ${provider.errorMessage}'));
            }

            return ListView.builder(
              itemCount: provider.avaliacoes.length,
              itemBuilder: (context, index) {
                final avaliacao = provider.avaliacoes[index];
                return ListTile(
                  leading: Icon(Icons.star, color: Colors.amber),
                  title: Text('Nota: ${avaliacao.nota}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(avaliacao.comentario),
                      SizedBox(height: 4),
                      Text(
                        'Data: ${avaliacao.data}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
