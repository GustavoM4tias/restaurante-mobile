class Produto {
  final int id;
  final String nome;
  final double preco;
  final int fornecedorId;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.fornecedorId,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      preco: (json['preco'] as num).toDouble(),
      fornecedorId: json['fornecedorId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'fornecedorId': fornecedorId,
    };
  }
}
