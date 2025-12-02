import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/carro.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/controle_interacao/controle_tela_carro.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/gerencia_imagem.dart';
class InserirCarro extends StatefulWidget{
  Carro? carro;
  bool inserirCarro;

  InserirCarro({this.inserirCarro = true,this.carro});

  @override
  _InserirCarroState createState() => _InserirCarroState();

}

class _InserirCarroState extends State<InserirCarro> {
  ControleTelaCarro _controle = ControleTelaCarro();

  @override
  void initState() {
    super.initState();
    if(widget.inserirCarro == false){
      _controle.carro = widget.carro;
      _controle.carregarCarro();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulario Carro")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () async {
                  await GererciaImagem().pegarLinkImagem(
                    context,
                    _controle.controlador_banner,
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: _controle.controlador_banner.text.isNotEmpty
                            ? Image.network(
                                _controle.controlador_banner.text,
                                fit: BoxFit.fill,
                              )
                            : Icon(Icons.image, size: 40),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("Banner"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              CampoEdicao("Placa", controlador: _controle.controlador_placa),
              SizedBox(height: 15),
              CampoEdicao("Marca", controlador: _controle.controlador_marca),
              SizedBox(height: 15),
              CampoEdicao("Modelo", controlador: _controle.controlador_modelo),
              SizedBox(height: 15),
              CampoEdicao("Ano", controlador: _controle.controlador_ano),
              SizedBox(height: 15),
              CampoEdicao(
                "Combustível",
                controlador: _controle.controlador_combustivel,
              ),
              SizedBox(height: 15),
              CampoEdicao(
                "Quilometragem",
                controlador: _controle.controlador_quilometragem,
              ),
              SizedBox(height: 15),
              CampoEdicao(
                "Carroceira",
                controlador: _controle.controlador_carroceria,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if(widget.inserirCarro == true){
                    _controle.inserirCarro();
                  }else{
                    _controle.atualizarCarro();
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Operação Realizada!")),
                  );

                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(14),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: Text("Salvar Carro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
