import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Dao/oficina.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/tela_login.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/tela_editar_usuario.dart';

import '../Dao/cliente.dart';
import '../utils/widgets/nav.dart';
import 'controle_interacao/controle_tela_principal.dart';

class MenuLateral extends StatefulWidget {
  var usuarios;
  MenuLateral(this.usuarios, {Key? key}) : super(key: key);

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  late Future<Map<String, dynamic>?> futureUsuario;
  late ControleTelaPrincipal _controle;
  late String tipo;

  final TextStyle headerTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        blurRadius: 4,
        color: Colors.black54,
        offset: Offset(1, 1),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    futureUsuario = carregarUsuario();
    _controle = ControleTelaPrincipal(widget.usuarios);
  }

  Future<Map<String, dynamic>?> carregarUsuario() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser!;
    tipo = widget.usuarios is Cliente ? "Cliente" : "Oficina";

    final doc = await FirebaseFirestore.instance
        .collection(tipo)
        .doc(user.uid)
        .get();

    return  doc.data();
  }

  UserAccountsDrawerHeader _header(Map<String, dynamic> usuario) {
    final foto = usuario["foto"] ?? "";
    final banner = usuario["banner"] ?? "";

    return UserAccountsDrawerHeader(
      accountName: Text(usuario["nome"] ?? "Nome não informado", style: headerTextStyle),
      accountEmail: Text(usuario["email"] ?? "Email não informado", style: headerTextStyle),

      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage: foto.isNotEmpty ? NetworkImage(foto) : null,
        child: foto.isEmpty ? Icon(Icons.person, size: 45, color: Colors.grey[700]) : null,
      ),

      decoration: widget.usuarios is Oficina
          ? (banner.isNotEmpty
          ? BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(banner),
          fit: BoxFit.cover,
        ),
      )
          : BoxDecoration(color: Colors.blueGrey.shade700))
          : BoxDecoration(color: Colors.blueGrey.shade700),
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
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return SizedBox(
                    height: 180,
                    child: Center(child: Text("Erro ao carregar dados")),
                  );
                }

                return _header(snapshot.data!);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Editar Dados do Usuário"),
              subtitle: Text("nome, login, senha ..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () async {
                pop(context);
                print(tipo);
                push(
                  context,
                  TelaEditarUsuario(tipo),
                );
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
            ),
          ],
        ),
      ),
    );
  }
}
