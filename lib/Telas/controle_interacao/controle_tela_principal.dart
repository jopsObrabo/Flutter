import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/widgets/nav.dart';
import '../tela_login.dart';

class ControleTelaPrincipal{
  var usuario;
  List<DocumentSnapshot>? document_itens;


  ControleTelaPrincipal(this.usuario);

  CollectionReference<Map<String, dynamic>> get _collection_itens => FirebaseFirestore.instance.collection('itens');
  Stream<QuerySnapshot> get stream => _collection_itens.where("id_usuario", isEqualTo: usuario.id).snapshots();


  void sair(BuildContext context){
    FirebaseAuth.instance.signOut();
    push(context, TelaLogin(), replace: true);
  }

}