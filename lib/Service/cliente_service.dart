import 'package:cloud_firestore/cloud_firestore.dart';

import '../Dao/cliente.dart';

class ClienteService {
  final _db = FirebaseFirestore.instance.collection('Cliente');

  Future<void> addCliente(Cliente cliente) async {
    await _db.add(cliente.toMap());
  }

  Stream<List<Cliente>> getAll() {
    return _db.snapshots().map(
      (snapshot) =>
          snapshot.docs.map((d) => Cliente.fromMap(d.data(), d.id)).toList(),
    );
  }

  Future<Cliente?> buscarPorNome(String nome) async {
    var query = await _db.where('nome', isEqualTo: nome).limit(1).get();
    if (query.docs.isNotEmpty) {
      var doc = query.docs.first;
      return Cliente.fromMap(doc.data(), doc.id);
    }
    return null;
  }

  Future<Cliente?> getById(String id) async {
    final doc = await _db.doc(id).get();
    return doc.exists ? Cliente.fromMap(doc.data()!, doc.id) : null;
  }

  Future<void> updateCliente(String id, Cliente cliente) async {
    await _db.doc(id).update(cliente.toMap());
  }

  Future<void> deleteCliente(String id) async {
    await _db.doc(id).delete();
  }

  Stream<List<Cliente>> lisatrClientesDaOficina(String idOficina) {
    return FirebaseFirestore.instance
        .collection('Carro')
        .where('id_Oficina', isEqualTo: idOficina)
        .snapshots()
        .asyncMap((carroSnapshot) async {
          if (carroSnapshot.docs.isEmpty) return [];

          final idsClientes = carroSnapshot.docs
              .map((doc) => doc['id_Cliente'] as String)
              .toSet()
              .toList();

          var queryClientes = await _db
              .where(FieldPath.documentId, whereIn: idsClientes)
              .get();

          return queryClientes.docs
              .map((d) => Cliente.fromMap(d.data(), d.id))
              .toList();
        });
  }
}
