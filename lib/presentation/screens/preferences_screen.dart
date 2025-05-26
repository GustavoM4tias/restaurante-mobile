import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String selectedCuisine = 'Italiana';
  String selectedRestaurantType = 'Casual';
  double priceRange = 50;
  bool acceptsDelivery = true;

  final List<String> cuisines = [
    'Italiana',
    'Japonesa',
    'Brasileira',
    'Mexicana',
    'Chinesa',
    'Lanches',
  ];

  final List<String> restaurantTypes = [
    'Casual',
    'Gourmet',
    'Buffet',
    'Self-service',
    'Delivery',
  ];

  void _savePreferences() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Preferências salvas!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text("Tipo de comida", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedCuisine,
          items: cuisines
              .map((cuisine) => DropdownMenuItem(
                    value: cuisine,
                    child: Text(cuisine),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) setState(() => selectedCuisine = value);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),

        Text("Tipo de restaurante", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedRestaurantType,
          items: restaurantTypes
              .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) setState(() => selectedRestaurantType = value);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),

        Text("Faixa de preço (R\$)", style: Theme.of(context).textTheme.titleMedium),
        Slider(
          value: priceRange,
          min: 10,
          max: 200,
          divisions: 38,
          label: "R\$ ${priceRange.round()}",
          onChanged: (value) => setState(() => priceRange = value),
        ),
        const SizedBox(height: 24),

        SwitchListTile(
          title: const Text("Aceita delivery"),
          value: acceptsDelivery,
          onChanged: (val) => setState(() => acceptsDelivery = val),
          activeColor: Colors.red,
        ),
        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _savePreferences,
                icon: const Icon(Icons.save),
                label: const Text("Salvar"),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Resetar?"),
                    content: const Text("Deseja limpar as preferências?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedCuisine = 'Italiana';
                            selectedRestaurantType = 'Casual';
                            priceRange = 50;
                            acceptsDelivery = true;
                          });
                          Navigator.pop(ctx);
                        },
                        child: const Text("Confirmar"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Resetar"),
            )
          ],
        ),
      ],
    );
  }
}
