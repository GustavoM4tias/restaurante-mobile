import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> visitedRestaurants = [
    {
      'name': 'Cantina Italiana',
      'type': 'Italiana',
      'date': '12/04/2025',
    },
    {
      'name': 'Burger Place',
      'type': 'Lanches',
      'date': '10/04/2025',
    },
    {
      'name': 'Sushi House',
      'type': 'Japonesa',
      'date': '08/04/2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(24),
      itemCount: visitedRestaurants.length,
      itemBuilder: (context, index) {
        final restaurant = visitedRestaurants[index];
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: Icon(Icons.location_on, color: Colors.deepPurple),
            title: Text(restaurant['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${restaurant['type']} • ${restaurant['date']}"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              // Aqui você poderia abrir os detalhes ou mapa futuramente
            },
          ),
        );
      },
    );
  }
}
