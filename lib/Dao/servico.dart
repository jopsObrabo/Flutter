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

  factory Servico.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Servico(
      id: doc.id,
      descricao: data['descricao'],
      valor: (data['valor'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'descricao': descricao,
    'valor': valor,
  };
}