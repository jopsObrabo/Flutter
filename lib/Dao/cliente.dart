import 'package:cloud_firestore/cloud_firestore.dart';

class Cliente {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String cpf;

  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.cpf,
  });

  factory Cliente.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Cliente(
      id: doc.id,
      nome: data['nome'],
      email: data['email'],
      telefone: data['telefone'],
      cpf: data['cpf'],
    );
  }

  Map<String, dynamic> toMap() => {
    'nome': nome,
    'email': email,
    'telefone': telefone,
    'cpf': cpf,
  };
}