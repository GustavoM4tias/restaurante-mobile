class Pedido {
  final int id;
  final int clienteId;
  final List<int> produtoIds;
  final double total;

  Pedido({
    required this.id,
    required this.clienteId,
    required this.produtoIds,
    required this.total,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      clienteId: json['clienteId'],
      produtoIds: List<int>.from(json['produtoIds']),
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clienteId': clienteId,
      'produtoIds': produtoIds,
      'total': total,
    };
  }
}
