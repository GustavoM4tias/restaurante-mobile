class Restaurante {
  final int? id_restaurante;
  final String nome;
  final double latitude;
  final double longitude;
  final String faixa_preco;
  final String horario_funcionamento;

  Restaurante({
    this.id_restaurante,
    required this.nome,
    required this.latitude,
    required this.longitude,
    required this.faixa_preco,
    required this.horario_funcionamento,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_restaurante': id_restaurante,
      'nome': nome,
      'latitude': latitude,
      'longitude': longitude,
      'faixa_preco': faixa_preco,
      'horario_funcionamento': horario_funcionamento,
    };
  }

  factory Restaurante.fromMap(Map<String, dynamic> map) {
    return Restaurante(
      id_restaurante: map['id_restaurante'],
      nome: map['nome'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      faixa_preco: map['faixa_preco'],
      horario_funcionamento: map['horario_funcionamento'],
    );
  }

  Restaurante copyWith({
    int? id_restaurante,
    String? nome,
    double? latitude,
    double? longitude,
    String? faixa_preco,
    String? horario_funcionamento,
  }) {
    return Restaurante(
      id_restaurante: id_restaurante ?? this.id_restaurante,
      nome: nome ?? this.nome,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      faixa_preco: faixa_preco ?? this.faixa_preco,
      horario_funcionamento: horario_funcionamento ?? this.horario_funcionamento,
    );
  }
}
