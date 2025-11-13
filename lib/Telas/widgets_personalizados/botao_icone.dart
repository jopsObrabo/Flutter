import 'package:flutter/material.dart';

class BotaoIcone extends StatelessWidget {
  final String texto;
  final VoidCallback? ao_clicar;
  final FocusNode? marcador_foco;
  final Color? cor;
  final bool mostrar_progress;
  final IconData? icone;
  final Color? cor_icone;

  BotaoIcone(
      {this.texto = "",
        this.ao_clicar,
        this.marcador_foco,
        this.cor,
        this.mostrar_progress = false,
        this.icone = null,
        this.cor_icone = Colors.black});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)),
      ),
      onPressed: ao_clicar,
      focusNode: marcador_foco,
      child: mostrar_progress
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
      )
          : icone != null
          ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icone,
              size: 13,
              color: cor_icone,
            ),
            SizedBox(
              width:5,
            ),
            Text(
              texto,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),


          ],
        ),
      )
          : Text(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}