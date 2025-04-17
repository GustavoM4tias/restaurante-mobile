import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isEditing = false;

  final TextEditingController _nameController = TextEditingController(text: "João da Silva");
  final TextEditingController _emailController = TextEditingController(text: "joao@email.com");
  final TextEditingController _phoneController = TextEditingController(text: "+55 14 99999-0000");

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _logout() {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24),
      children: [
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: const Color.fromARGB(255, 163, 159, 159),
                child: Icon(Icons.person, size: 48, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(height: 16),
              Text(_nameController.text, style: Theme.of(context).textTheme.titleLarge),
              Text(_emailController.text, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 24),
            ],
          ),
        ),
        _buildInfoCard("Nome", _nameController),
        SizedBox(height: 16),
        _buildInfoCard("Email", _emailController),
        SizedBox(height: 16),
        _buildInfoCard("Telefone", _phoneController),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              icon: Icon(_isEditing ? Icons.save : Icons.edit),
              label: Text(_isEditing ? "Salvar" : "Editar"),
              onPressed: _toggleEdit,
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.logout),
              label: Text("Sair"),
              onPressed: _logout,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildInfoCard(String label, TextEditingController controller) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelMedium),
            _isEditing
                ? TextField(controller: controller)
                : Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(controller.text, style: Theme.of(context).textTheme.bodyMedium),
                  ),
          ],
        ),
      ),
    );
  }
}
