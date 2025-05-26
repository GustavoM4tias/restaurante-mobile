class Usuario {
  final int? id_usuario;
  final String nome;
  final String email;
  final String senha;

  const Usuario({
    this.id_usuario,
    required this.nome,
    required this.email,
    required this.senha,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id_usuario: json['id_usuario'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_usuario': id_usuario,
    'nome': nome,
    'email': email,
    'senha': senha,
  };
}
