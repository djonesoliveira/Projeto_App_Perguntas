import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(15, 02, 15, 02),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.orange[400],
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
