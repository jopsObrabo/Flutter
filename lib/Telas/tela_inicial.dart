import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/menu_lateral.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/barra_inferiror.dart';

import '../Dao/cliente.dart';
import 'controle_interacao/controle_tela_principal.dart';

class TelaPrincipal extends StatefulWidget   {
  var usuarios;
  TelaPrincipal(this.usuarios);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();

}
class _TelaPrincipalState extends State<TelaPrincipal>{
  late ControleTelaPrincipal _controle;


  @override
  void initState() {
    super.initState();
    _controle = ControleTelaPrincipal(widget.usuarios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(child: Text( widget.usuarios is Cliente ? "Cliente" : "Oficina",
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),),
      bottomNavigationBar: BarraInferior(),
      drawer:  MenuLateral(widget.usuarios),
    );
  }
}
