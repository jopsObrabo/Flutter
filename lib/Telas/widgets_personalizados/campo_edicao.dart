import 'package:flutter/material.dart';

class CampoEdicao extends StatelessWidget {
  String texto_label;
  String texto_dica;
  bool passaword;
  TextEditingController? controlador;
  FormFieldValidator<String>? validador;
  TextInputType teclado;
  FocusNode? marcador_foco;
  FocusNode? recebedor_foco;
  IconData? icone;
  bool isSenha;
  VoidCallback? onPressedButton;
  bool enabled;

  CampoEdicao(
    this.texto_label, {
    this.enabled = true,
    this.texto_dica = "",
    this.passaword = false,
    this.controlador = null,
    this.validador = null,
    this.teclado = TextInputType.text,
    this.marcador_foco = null,
    this.recebedor_foco = null,
    this.icone,
    this.isSenha = false,
    this.onPressedButton,
  }) {
    if (this.validador == null) {
      this.validador = (String? text) {
        if (text!.isEmpty) {
          return "O campo '$texto_label' está vazio e necessita ser preenchido";
        }
        return null;
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      validator: validador,
      obscureText: isSenha,
      controller: controlador,
      keyboardType: teclado,
      textInputAction: TextInputAction.next,
      focusNode: marcador_foco,
      onFieldSubmitted: (String text) {
        FocusScope.of(context).requestFocus(recebedor_foco);
      },
      style: TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
        labelText: texto_label,

        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        hintText: texto_dica,
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
        suffixIcon: passaword
            ? IconButton(
                icon: icone != null
                    ? Icon(icone)
                    : Icon(
                        isSenha ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                onPressed: onPressedButton,
              )
            : Icon(icone, color: Colors.black),
      ),
    );
  }
}
