import 'package:cloud_firestore/cloud_firestore.dart';

import '../Dao/oficina.dart';

class OficinaService {
  final _db = FirebaseFirestore.instance.collection('Oficina');

  Future<void> addOficina(Oficina oficina) async {
    await _db.add(oficina.toMap());
  }

  Stream<List<Oficina>> listarOficinas() {
    return _db.snapshots().map((snapshot) =>
        snapshot.docs.map((d) => Oficina.fromFirestore(d)).toList());
  }

  Future<Oficina?> buscarPorId(String id) async {
    var doc = await _db.doc(id).get();
    if (doc.exists) return Oficina.fromFirestore(doc);
    return null;
  }

  Future<void> atualizarOficina(String id, Oficina oficina) async {
    await _db.doc(id).update(oficina.toMap());
  }

  Future<void> excluirOficina(String id) async {
    await _db.doc(id).delete();
  }
}