class Usuario {
  final int? id_usuario;
  final String nome;
  final String email;
  final String senha;

  Usuario({
    this.id_usuario,
    required this.nome,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id_usuario: map['id_usuario'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }

  Usuario copyWith({
    int? id_usuario,
    String? nome,
    String? email,
    String? senha,
  }) {
    return Usuario(
      id_usuario: id_usuario ?? this.id_usuario,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }
}
