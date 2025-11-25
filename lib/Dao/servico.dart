import 'package:cloud_firestore/cloud_firestore.dart';

class Servico {
  final String id;
  final String descricao;
  double? valor;
  bool requisicao;

  Servico({
    required this.id,
    required this.descricao,
    this.valor,
    required this.requisicao,

  });

  factory Servico.fromMap(Map<String, dynamic> data, String id) {
    return Servico(
      id: id,
      descricao: data['descricao'],
      valor: (data['valor'] ?? 0).toDouble(),
      requisicao:  data['requisicao'] ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
    'descricao': descricao,
    'valor': valor,
    'requisicao': requisicao,
  };
}