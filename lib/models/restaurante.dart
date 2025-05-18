class Restaurante {
  final int? id_restaurante;
  final String nome;
  final double latitude;
  final double longitude;
  final String faixa_preco;
  final String horario_funcionamento;
  final String? descricao;

  Restaurante({
    this.id_restaurante,
    required this.nome,
    required this.latitude,
    required this.longitude,
    required this.faixa_preco,
    required this.horario_funcionamento,
    this.descricao,
  });

  factory Restaurante.fromJson(Map<String, dynamic> json) {
    return Restaurante(
      id_restaurante: json['id_restaurante'],
      nome: json['nome'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      faixa_preco: json['faixa_preco'],
      horario_funcionamento: json['horario_funcionamento'],
      descricao: json['descricao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_restaurante': id_restaurante,
      'nome': nome,
      'latitude': latitude,
      'longitude': longitude,
      'faixa_preco': faixa_preco,
      'horario_funcionamento': horario_funcionamento,
      'descricao': descricao,
    };
  }
}
