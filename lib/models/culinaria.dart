class Culinaria {
  final int? id_culinaria;
  final String tipo;

  Culinaria({
    this.id_culinaria,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_culinaria': id_culinaria,
      'tipo': tipo,
    };
  }

  factory Culinaria.fromMap(Map<String, dynamic> map) {
    return Culinaria(
      id_culinaria: map['id_culinaria'],
      tipo: map['tipo'],
    );
  }

  Culinaria copyWith({
    int? id_culinaria,
    String? tipo,
  }) {
    return Culinaria(
      id_culinaria: id_culinaria ?? this.id_culinaria,
      tipo: tipo ?? this.tipo,
    );
  }
}
