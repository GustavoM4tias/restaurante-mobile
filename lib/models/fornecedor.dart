class Fornecedor {
  final int id;
  final String nome;
  final String cnpj;

  Fornecedor({required this.id, required this.nome, required this.cnpj});

  factory Fornecedor.fromJson(Map<String, dynamic> json) {
    return Fornecedor(id: json['id'], nome: json['nome'], cnpj: json['cnpj']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'cnpj': cnpj};
  }
}
