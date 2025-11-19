import 'package:cloud_firestore/cloud_firestore.dart';

import '../Dao/cliente.dart';

class ClienteService {
  final _db = FirebaseFirestore.instance.collection('Cliente');

  Future<void> addCliente(Cliente cliente) async {
    await _db.add(cliente.toMap());
  }

  Future<List<Cliente>> getAll() async {
    final snapshot = await _db.get();
    return snapshot.docs
        .map((d) => Cliente.fromMap(d.data(), d.id))
        .toList();
  }

  Future<Cliente?> getById(String id) async {
    final doc = await _db.doc(id).get();
    return doc.exists ? Cliente.fromMap(doc.data()!, doc.id) : null;
  }

  Future<void> updateCliente(String id, Map<String, dynamic> data) async {
    await _db.doc(id).update(data);
  }

  Future<void> deleteCliente(String id) async {
    await _db.doc(id).delete();
  }
}