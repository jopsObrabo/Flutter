import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Usuario",
                hintStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    obscureText: selecionaBotao,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Senha",
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon:  Icon(
                    selecionaBotao
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: onPressedButton,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
