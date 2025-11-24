import 'package:cloud_firestore/cloud_firestore.dart';

class Oficina {
  final String id;
  final String nome;
  final String email;
  final String endereco;
  final String telefone;
  String? foto;
  String? banner;

  Oficina({
    required this.id,
    required this.nome,
    required this.email,
    required this.endereco,
    required this.telefone,
    this.foto,
    this.banner

  });

  factory Oficina.fromMap(Map<String, dynamic> data, String id) {
    return Oficina(
      id: id,
      nome: data['nome'] ?? '',
      email: data['email'] ?? '',
      endereco: data['endereco'] ?? '',
      telefone: data['telefone'] ?? '',
      foto: data['foto'] ?? '',
      banner: data['banner'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'nome': nome,
    'email': email,
    'endereco': endereco,
    'telefone': telefone,
    'foto': foto,
    'banner' : banner,
  };
}