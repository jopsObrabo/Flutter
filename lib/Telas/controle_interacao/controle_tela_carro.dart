
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/cliente.dart';
import 'package:sistema_mecaniaca_inteligente/Service/carro_service.dart';
import 'package:sistema_mecaniaca_inteligente/Service/cliente_service.dart';


class ControleTelaCarro{
  CarroService serviceCarro = CarroService();
  final user = FirebaseAuth.instance.currentUser!;
  ClienteService serviceCliente = ClienteService();
  Carro? carro;

  final controlador_banner = TextEditingController();
  final controlador_placa = TextEditingController();
  final controlador_marca = TextEditingController();
  final controlador_modelo =  TextEditingController();
  final controlador_ano =  TextEditingController();
  final controlador_combustivel = TextEditingController();
  final controlador_quilometragem = TextEditingController();
  final controlador_carroceria = TextEditingController();

  void inserirCarro(){
    Carro carro = Carro(id:"", placa: controlador_placa.text.trim(),
        marca: controlador_marca.text.trim(), modelo: controlador_modelo.text.trim(),
        ano: controlador_ano.text.trim(), combustivel: controlador_combustivel.text.trim(),
        quilometragem: controlador_quilometragem.text.trim(),carroceria: controlador_carroceria.text.trim()
        ,idCliente: user.uid , idOficina: "", banner: controlador_banner.text.trim());
    serviceCarro.addCarro(carro);
  }
  void carregarCarro(){
    controlador_carroceria.text = carro!.carroceria;
    controlador_placa.text = carro!.placa;
    controlador_marca.text = carro!.marca;
    controlador_modelo.text = carro!.modelo;
    controlador_ano.text = carro!.ano;
    controlador_combustivel.text = carro!.combustivel;
    controlador_quilometragem.text = carro!.quilometragem;
    controlador_banner.text = carro!.banner!;
  }
  void atualizarCarro(){
    final atualizado = Carro(
      id: carro!.id,
      placa: controlador_placa.text,
      marca: controlador_marca.text,
      modelo: controlador_modelo.text,
      ano: controlador_ano.text,
      combustivel: controlador_combustivel.text,
      quilometragem: controlador_quilometragem.text,
      carroceria: controlador_carroceria.text,
      banner: controlador_banner.text,
      idCliente: carro!.idCliente,
      idOficina: carro!.idOficina,
    );
    serviceCarro.atualizarCarro(atualizado.id, atualizado);
  }

  Future<String> pegarNomeCliente(String id) async{
    Cliente? cliente = await serviceCliente.getById(id);
    return cliente?.nome ?? "Nome não encontrado";
  }

}