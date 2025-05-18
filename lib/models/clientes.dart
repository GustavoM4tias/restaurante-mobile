class Cliente {
  final int id;
  final String nome;
  final String email;

  Cliente({required this.id, required this.nome, required this.email});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(id: json['id'], nome: json['nome'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'email': email};
  }
}
