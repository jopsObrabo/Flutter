import 'package:cloud_firestore/cloud_firestore.dart';

import '../Dao/carro_servico.dart';

class CarroServicoService {
  final _db = FirebaseFirestore.instance.collection('CarroServico');

  Future<void> addCarroServico(CarroServico cs) async {
    await _db.add(cs.toMap());
  }

  Stream<List<CarroServico>> listarCarroServicos() {
    return _db.snapshots().map((snapshot) => snapshot.docs
        .map((d) => CarroServico.fromFirestore(d))
        .toList());
  }

  Future<CarroServico?> buscarPorId(String id) async {
    var doc = await _db.doc(id).get();
    if (doc.exists) return CarroServico.fromFirestore(doc);
    return null;
  }

  Future<void> atualizarCarroServico(String id, CarroServico cs) async {
    await _db.doc(id).update(cs.toMap());
  }

  Future<void> excluirCarroServico(String id) async {
    await _db.doc(id).delete();
  }
}