import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/avaliacao_service.dart';

class AvaliacaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AvaliacaoService()..fetchAvaliacoes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Avaliações'),
        ),
        body: Consumer<AvaliacaoService>(
          builder: (context, service, _) {
            if (service.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (service.errorMessage != null) {
              return Center(child: Text('Erro: ${service.errorMessage}'));
            }

            return ListView.builder(
              itemCount: service.avaliacoes.length,
              itemBuilder: (context, index) {
                final avaliacao = service.avaliacoes[index];
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
