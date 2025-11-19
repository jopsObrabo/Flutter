import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/tela_login.dart';

import '../Dao/cliente.dart';
import '../utils/widgets/nav.dart';
import 'controle_interacao/controle_tela_principal.dart';

class MenuLateral extends StatefulWidget {
  var usuarios;
  MenuLateral(this.usuarios,{Key? key}) : super(key: key);

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  late Future<Map<String, dynamic>?> futureUsuario;
  late ControleTelaPrincipal _controle;
  @override
  void initState()  {
    super.initState();
    futureUsuario = carregarUsuario();
    _controle = ControleTelaPrincipal(widget.usuarios);
  }
  Future<Map<String, dynamic>?> carregarUsuario() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser!;
    final doc = await FirebaseFirestore.instance.collection(widget.usuarios).doc(user.uid).get();
    return doc.data();
  }
  UserAccountsDrawerHeader _header(ImageProvider imageProvider) {
    return UserAccountsDrawerHeader(
      accountName: Text("nome"),
      accountEmail: Text("email"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: imageProvider,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder(
              future: futureUsuario,
              builder: (context, snapshot) {
               return Container();
              }
            ),
            ListTile(
                leading: Icon(Icons.edit),
                title: Text("Editar Dados do Usuário"),
                subtitle: Text("nome, login, senha ..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () async {
                  // Fechando o menu lateral
                  pop(context);

                 // push(context, TelaEdicaoUsuario(usuario!));
                }
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("como usar"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Fechando o menu lateral
                pop(context);

                //push(context, TelaAjuda());
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                pop(context);

                push(context, TelaLogin(), replace: true);

                _controle.sair(context);
              },
            )
          ],
        ),
      ),
    );
  }
}