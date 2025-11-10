import 'package:cloud_firestore/cloud_firestore.dart';

class Carro {
  String id;
  String placa;
  String marca;
  String modelo;
  String ano;
  String combustivel;
  String quilometragem;
  String idCliente;
  String idOficina;

  Carro({
    required this.id,
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.combustivel,
    required this.quilometragem,
    required this.idCliente,
    required this.idOficina,
  });

  factory Carro.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Carro(
      id: doc.id,
      placa: data['Placa'] ?? '',
      marca: data['marca'] ?? '',
      modelo: data['modelo'] ?? '',
      ano: data['ano'] ?? '',
      combustivel: data['combustivel'] ?? '',
      quilometragem: data['quilometragem'] ?? '',
      idCliente: data['id_Cliente'] ?? '',
      idOficina: data['id_Oficina'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'Placa': placa,
    'marca': marca,
    'modelo': modelo,
    'ano': ano,
    'combustivel': combustivel,
    'quilometragem': quilometragem,
    'id_Cliente': idCliente,
    'id_Oficina': idOficina,
  };
}