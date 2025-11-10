import 'package:cloud_firestore/cloud_firestore.dart';

class CarroServico {
  String id;
  String idCarro;
  String idCliente;
  String idOficina;
  String idServico;
  String data;

  CarroServico({
    required this.id,
    required this.idCarro,
    required this.idCliente,
    required this.idOficina,
    required this.idServico,
    required this.data,
  });

  factory CarroServico.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CarroServico(
      id: doc.id,
      idCarro: data['id_Carro'] ?? '',
      idCliente: data['id_Cliente'] ?? '',
      idOficina: data['Id_Oficina'] ?? '',
      idServico: data['id_Servicos'] ?? '',
      data: data['data'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'id_Carro': idCarro,
    'id_Cliente': idCliente,
    'Id_Oficina': idOficina,
    'id_Servicos': idServico,
    'data': data,
  };
}