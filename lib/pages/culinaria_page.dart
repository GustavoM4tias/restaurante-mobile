import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/culinaria.dart';
import '../services/culinaria_service.dart';

class CulinariaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CulinariaService()..fetchCulinarias(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Culinárias'),
        ),
        body: Consumer<CulinariaService>(
          builder: (context, service, _) {
            if (service.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (service.errorMessage != null) {
              return Center(child: Text('Erro: ${service.errorMessage}'));
            }

            return ListView.builder(
              itemCount: service.culinarias.length,
              itemBuilder: (context, index) {
                final Culinaria culinaria = service.culinarias[index];
                return ListTile(
                  leading: Icon(Icons.local_dining),
                  title: Text(culinaria.tipo),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
