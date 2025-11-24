import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/cliente.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
import 'package:sistema_mecaniaca_inteligente/Service/carro_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/cliente_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/oficina_service.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/listar_na_tela.dart';

import '../../utils/widgets/nav.dart';
import '../tela_login.dart';
import '../widgets_personalizados/widget_listar.dart';

class ControleTelaPrincipal{
  var usuario;
  List<DocumentSnapshot>? document_itens;

  final controlador_pesquisa = TextEditingController();

  OficinaService serviceOficina = OficinaService();
  ClienteService serviceCliente = ClienteService();
  CarroService serviceCarro = CarroService();

  final user = FirebaseAuth.instance.currentUser!;

  ControleTelaPrincipal(this.usuario);


  Future<dynamic>  pesquisarNome() async {
    if (usuario is Cliente) {
      return serviceOficina.buscarPorNome(controlador_pesquisa.text.trim());
    }else if(usuario is Oficina){
      return serviceCliente.buscarPorNome(controlador_pesquisa.text.trim());
    }
    return null;
  }

  Future<dynamic>  pesquisarPlaca() async {
    return serviceCarro.buscarPorPlaca(controlador_pesquisa.text.trim());
  }

  Stream<List<dynamic>> streamListar() {
    if (usuario is Cliente) {
      return serviceOficina.listarOficinas() ;
    }else if(usuario is Oficina){
      return serviceCliente.lisatrClientesDaOficina(user.uid) ;
    }

    return const Stream.empty();
  }
  Future<List<Carro>> buscarVeiculo() async{
    if(usuario is Cliente){
      return serviceCarro.buscarPorIdCliente(user.uid);
    }
    else {
      return serviceCarro.buscarPorIdOficina(user.uid) ;
    }

  }

  void sair(BuildContext context){
    FirebaseAuth.instance.signOut();
    push(context, TelaLogin(), replace: true);
  }

}