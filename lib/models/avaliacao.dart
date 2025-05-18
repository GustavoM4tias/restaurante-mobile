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

  factory Avaliacao.fromJson(Map<String, dynamic> json) {
    return Avaliacao(
      id_avaliacao: json['id_avaliacao'],
      id_usuario: json['id_usuario'],
      id_restaurante: json['id_restaurante'],
      nota: json['nota'],
      comentario: json['comentario'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_avaliacao': id_avaliacao,
      'id_usuario': id_usuario,
      'id_restaurante': id_restaurante,
      'nota': nota,
      'comentario': comentario,
      'data': data,
    };
  }
}
