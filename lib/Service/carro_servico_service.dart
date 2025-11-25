import 'package:cloud_firestore/cloud_firestore.dart';

import '../Dao/carro_servico.dart';

class CarroServicoService {
  final _db = FirebaseFirestore.instance.collection('CarroServico');

  Future<void> addCarroServico(CarroServico cs) async {
    await _db.add(cs.toMap());
  }

  Stream<List<CarroServico>> listarCarroServicos() {
    return _db.snapshots().map((snapshot) => snapshot.docs
        .map((d) => CarroServico.fromMap(d.data(), d.id))
        .toList());
  }

  Future<CarroServico?> buscarPorId(String id) async {
    var doc = await _db.doc(id).get();
    if (doc.exists) return CarroServico.fromMap(doc.data()!, doc.id);
    return null;
  }

  Future<void> atualizarCarroServico(String id, CarroServico cs) async {
    await _db.doc(id).update(cs.toMap());
  }

  Future<List<CarroServico>> buscarPorCarro(String idCarro) async {
    var query = await _db.where('id_Carro', isEqualTo: idCarro).get();
    return query.docs
        .map((doc) => CarroServico.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<CarroServico>> buscarPorOficina(String idOficina) async {
    var query = await _db.where('Id_Oficina', isEqualTo: idOficina).get();
    return query.docs
        .map((doc) => CarroServico.fromMap(doc.data(), doc.id))
        .toList();
  }


  Future<void> excluirCarroServico(String id) async {
    await _db.doc(id).delete();
  }
}