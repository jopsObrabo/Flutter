import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';

import '../../Dao/cliente.dart';
import '../../utils/widgets/nav.dart';
import '../tela_inicial.dart';
import '../tela_login.dart';

class ControleTelaAbertura {

  void inicializarAplicacao(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore db = FirebaseFirestore.instance;

    final User? user = auth.currentUser;

    if (user == null) {
      if (context.mounted) push(context, TelaLogin(), replace: true);
      return;
    }

    final clienteRef = db.collection('Cliente').doc(user.uid).get();
    final oficinaRef = db.collection('Oficina').doc(user.uid).get();

    final results = await Future.wait([clienteRef, oficinaRef]);
    final clienteDoc = results[0];
    final oficinaDoc = results[1];

    if (!context.mounted) return;

    if (clienteDoc.exists) {
      final cliente = Cliente.fromMap(clienteDoc.data()!, clienteDoc.id);
      push(context, TelaPrincipal(cliente), replace: true);
    } else if (oficinaDoc.exists) {
      final oficina = Oficina.fromMap(oficinaDoc.data()!, oficinaDoc.id);
      push(context, TelaPrincipal(oficina), replace: true);
    } else {
      await FirebaseAuth.instance.signOut();
      push(context, TelaLogin(), replace: true);
    }
  }
}