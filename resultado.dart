import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  //final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao /*, this.quandoReiniciarQuestionario*/);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Iniciante!';
    } else if (pontuacao < 12) {
      return 'Nível Junior!';
    } else if (pontuacao < 16) {
      return 'Nível Pleno!';
    } else {
      return 'Nível Senior!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
