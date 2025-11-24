import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/cliente.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
import 'package:sistema_mecaniaca_inteligente/Service/cliente_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/oficina_service.dart';

class ControleTelaEdicao{
  final controlador_login = TextEditingController();
  final controlador_senha = TextEditingController();
  final controlador_nome = TextEditingController();
  final controlador_telefone = TextEditingController();
  final controlador_cpf = TextEditingController();
  final controlador_endereco = TextEditingController();
  final controlador_foto = TextEditingController();
  final controlador_banner = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;
  ClienteService serviceCliente = ClienteService();
  OficinaService serviceOficina = OficinaService();

  final formkey = GlobalKey<FormState>();

  void carregarUsuario() async{
    var dadosCliente = await  serviceCliente.getById(user.uid);
    var dadosOficna = await serviceOficina.getById(user.uid);

    if(dadosCliente != null){
      controlador_login.text = dadosCliente.email;
      controlador_nome.text = dadosCliente.nome;
      controlador_cpf.text = dadosCliente.cpf;
      controlador_telefone.text = dadosCliente.telefone;
      controlador_foto.text = dadosCliente.foto!;
    }
    if(dadosOficna != null){
      controlador_login.text = dadosOficna.email;
      controlador_nome.text = dadosOficna.nome;
      controlador_telefone.text = dadosOficna.telefone;
      controlador_endereco.text = dadosOficna.endereco;
      controlador_foto.text = dadosOficna.foto!;
      controlador_banner.text = dadosOficna.banner!;

    }

  }

  void atualizarUsuario(String tipo){
    if(tipo == "Cliente"){
      Cliente cli = Cliente(id:user.uid, nome: controlador_nome.text,
          email: controlador_login.text, telefone: controlador_telefone.text, cpf: controlador_cpf.text,
      foto: controlador_foto.text);
      serviceCliente.updateCliente(user.uid, cli);
    }else{
      Oficina ofi = Oficina(id: user.uid, nome: controlador_nome.text ,
          email: controlador_login.text, endereco: controlador_endereco.text, telefone: controlador_telefone.text,
          foto: controlador_foto.text ,
          banner: controlador_banner.text);
      serviceOficina.atualizarOficina(user.uid, ofi);

    }
  }
}