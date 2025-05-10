class Avaliacao {
  final int? id_avaliacao;
  final int id_usuario;
  final int id_restaurante;
  final int nota;
  final String comentario;
  final String data;

  Avaliacao({
    this.id_avaliacao,
    required this.id_usuario,
    required this.id_restaurante,
    required this.nota,
    required this.comentario,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_avaliacao': id_avaliacao,
      'id_usuario': id_usuario,
      'id_restaurante': id_restaurante,
      'nota': nota,
      'comentario': comentario,
      'data': data,
    };
  }

  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      id_avaliacao: map['id_avaliacao'],
      id_usuario: map['id_usuario'],
      id_restaurante: map['id_restaurante'],
      nota: map['nota'],
      comentario: map['comentario'],
      data: map['data'],
    );
  }

  Avaliacao copyWith({
    int? id_avaliacao,
    int? id_usuario,
    int? id_restaurante,
    int? nota,
    String? comentario,
    String? data,
  }) {
    return Avaliacao(
      id_avaliacao: id_avaliacao ?? this.id_avaliacao,
      id_usuario: id_usuario ?? this.id_usuario,
      id_restaurante: id_restaurante ?? this.id_restaurante,
      nota: nota ?? this.nota,
      comentario: comentario ?? this.comentario,
      data: data ?? this.data,
    );
  }
}
