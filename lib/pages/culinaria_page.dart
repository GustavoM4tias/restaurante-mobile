import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/culinaria_provider.dart';

class CulinariaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CulinariaProvider()..fetchCulinarias(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Culinárias'),
        ),
        body: Consumer<CulinariaProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage != null) {
              return Center(child: Text('Erro: ${provider.errorMessage}'));
            }

            return ListView.builder(
              itemCount: provider.culinarias.length,
              itemBuilder: (context, index) {
                final culinaria = provider.culinarias[index];
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
