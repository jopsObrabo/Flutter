import 'package:cloud_firestore/cloud_firestore.dart';

import '../Dao/carro.dart';

class CarroService {
  final _db = FirebaseFirestore.instance.collection('Carro');

  Future<void> addCarro(Carro carro) async {
    await _db.add(carro.toMap());
  }

  Stream<List<Carro>> listarCarros() {
    return _db.snapshots().map((snapshot) =>
        snapshot.docs.map((d) => Carro.fromFirestore(d)).toList());
  }

  Future<Carro?> buscarPorId(String id) async {
    var doc = await _db.doc(id).get();
    if (doc.exists) return Carro.fromFirestore(doc);
    return null;
  }

  Future<Carro?> buscarPorPlaca(String placa) async {
    var query =
    await _db.where('Placa', isEqualTo: placa).limit(1).get();
    if (query.docs.isNotEmpty) {
      var doc = query.docs.first;
      return Carro.fromFirestore(doc);
    }
    return null;
  }

  Future<void> atualizarCarro(String id, Carro carro) async {
    await _db.doc(id).update(carro.toMap());
  }

  Future<void> excluirCarro(String id) async {
    await _db.doc(id).delete();
  }
}

