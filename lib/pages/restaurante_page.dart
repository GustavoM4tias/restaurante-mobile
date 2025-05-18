import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/restaurante_provider.dart';

class RestaurantePage extends StatefulWidget {
  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<RestauranteProvider>(context, listen: false)
        .fetchRestaurantes();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RestauranteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Restaurantes')),
      body: RefreshIndicator(
        onRefresh: provider.fetchRestaurantes,
        child: Builder(
          builder: (_) {
            if (provider.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (provider.error != null) {
              return Center(child: Text(provider.error!));
            } else if (provider.restaurantes.isEmpty) {
              return Center(child: Text('Nenhum restaurante encontrado.'));
            } else {
              return ListView.builder(
                itemCount: provider.restaurantes.length,
                itemBuilder: (_, index) {
                  final r = provider.restaurantes[index];
                  return ListTile(
                    title: Text(r['nome']),
                    subtitle: Text(r['descricao'] ?? 'Sem descrição'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
