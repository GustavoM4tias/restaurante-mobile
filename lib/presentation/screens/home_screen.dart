import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'account_screen.dart';
import 'history_screen.dart';
import 'preferences_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    AccountScreen(),
    HistoryScreen(),
    PreferencesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Conta'),
          NavigationDestination(icon: Icon(Icons.history), label: 'Histórico'),
          NavigationDestination(icon: Icon(Icons.star), label: 'Preferências'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Buscar restaurantes...',
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        SizedBox(height: 20),

        // Botões de navegação para entidades
        _buildNavTile(
          context,
          icon: Icons.restaurant,
          title: 'Restaurantes',
          route: '/home/restaurantes',
        ),
        SizedBox(height: 12),
        _buildNavTile(
          context,
          icon: Icons.local_dining,
          title: 'Culinárias',
          route: '/home/culinarias',
        ),
        SizedBox(height: 12),
        _buildNavTile(
          context,
          icon: Icons.rate_review,
          title: 'Avaliações',
          route: '/home/avaliacoes',
        ),
        SizedBox(height: 12),
        _buildNavTile(
          context,
          icon: Icons.people,
          title: 'Usuários',
          route: '/home/usuarios',
        ),
      ],
    );
  }

  Widget _buildNavTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.red),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.white,
      onTap: () => context.go(route),
    );
  }
}
