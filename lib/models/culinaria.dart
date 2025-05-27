class Culinaria {
  final int? id_culinaria;
  final String tipo;

  const Culinaria({
    this.id_culinaria,
    required this.tipo,
  });

  factory Culinaria.fromJson(Map<String, dynamic> json) {
    return Culinaria(
      id_culinaria: json['id_culinaria'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_culinaria': id_culinaria,
    'tipo': tipo,
  };
}
