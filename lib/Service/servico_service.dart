import 'package:cloud_firestore/cloud_firestore.dart';

import '../Dao/servico.dart';

class ServicoService {
  final _db = FirebaseFirestore.instance.collection('Servicos');

  Future<String> addServico(Servico servico) async {
    DocumentReference doc = await _db.add(servico.toMap());
    return doc.id;
  }

  Stream<List<Servico>> listarServicos() {
    return _db.snapshots().map((snapshot) =>
        snapshot.docs.map((d) => Servico.fromMap(d.data(),d.id)).toList());
  }

  Future<Servico?> buscarPorId(String id) async {
    var doc = await _db.doc(id).get();
    if (doc.exists) return Servico.fromMap(doc.data()!,doc.id);
    return null;
  }

  Future<void> atualizarServico(String id, Servico servico) async {
    await _db.doc(id).update(servico.toMap());
  }

  Future<void> excluirServico(String id) async {
    await _db.doc(id).delete();
  }
}