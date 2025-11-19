import 'package:cloud_firestore/cloud_firestore.dart';

class Servico {
  final String id;
  final String descricao;
  final double valor;

  Servico({
    required this.id,
    required this.descricao,
    required this.valor,
  });

  factory Servico.fromMap(Map<String, dynamic> data, String id) {
    return Servico(
      id: id,
      descricao: data['descricao'],
      valor: (data['valor'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'descricao': descricao,
    'valor': valor,
  };
}