import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PergutaApp());

class _PerguntaAppState extends State<PergutaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a porta padrão do SQL Server?',
      'respostas': [
        {'texto': '1433', 'pontuacao': 10},
        {'texto': '1434', 'pontuacao': 0},
        {'texto': '1533', 'pontuacao': 0},
        {'texto': 'NDA', 'pontuacao': 0}
      ],
    },
    {
      'texto': 'Qual comando utilizamos para acessar as configurações do SGBD?',
      'respostas': [
        {'texto': 'sp_help', 'pontuacao': 0},
        {'texto': 'sp_sysconfigure', 'pontuacao': 5},
        {'texto': 'sp_who2', 'pontuacao': 0},
        {'texto': 'sp_configure', 'pontuacao': 10},
      ],
    },
    {
      'texto':
          'Qual comando abaixo lhe auxiliará se houver algum processo com bloqueios?',
      'respostas': [
        {'texto': 'sp_help', 'pontuacao': 0},
        {'texto': 'sp_stats', 'pontuacao': 0},
        {'texto': 'sp_checkdb', 'pontuacao': 3},
        {'texto': 'sp_who2', 'pontuacao': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> respostas = [];
    //for (String textoResp in perguntas[_perguntaSelecionada]['respostas']) {
    //  respostas.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfffb8c00),
          title: Container(
            width: double.infinity,
            child: Text(
              'Perguntas',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal),
        floatingActionButton: FloatingActionButton(
          onPressed: _reiniciarQuestionario,
          tooltip: 'arrow_back',
          child: Icon(Icons.arrow_back),
          backgroundColor: Colors.orange[400],
        ),
      ),
    );
  }
}

class PergutaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
