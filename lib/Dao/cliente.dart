import 'package:cloud_firestore/cloud_firestore.dart';

class Cliente {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String cpf;
  final String? foto;

  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.cpf,
    this.foto,
  });

  factory Cliente.fromMap(Map<String, dynamic> data, String id) {
    return Cliente(
      id: id,
      nome: data['nome'] ?? '',
      email: data['email'] ?? '',
      telefone: data['telefone'] ?? '',
      cpf: data['cpf'] ?? '',
      foto: data['foto'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'nome': nome,
    'email': email,
    'telefone': telefone,
    'cpf': cpf,
    'foto': foto,
  };
}