import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_mecaniaca_inteligente/Telas/widgets_personalizados/campo_edicao.dart';

class TelaLogin extends StatefulWidget {
  TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool selecionaBotao = true;

  void onPressedButton() {
    setState(() {
      selecionaBotao = !selecionaBotao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", fit: BoxFit.fill),
            Container(
              margin: EdgeInsets.all(30),
              width: 300,
              child: CampoEdicao("Usuário",icone: Icons.person,teclado: TextInputType.emailAddress,),
            ),
            SizedBox(
                width: 300,
                child: CampoEdicao("Senha",passaword: true,isSenha:selecionaBotao ,onPressedButton: onPressedButton,)
              ),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: Text(
                "Não Tem Conta? Cadastre-se!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                elevation: 0,
              ),
              child: Text(
                "Entar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
