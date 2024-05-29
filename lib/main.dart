import 'package:flutter/material.dart';
import 'package:projetos_perguntas/questionario.dart';
import 'package:projetos_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final perguntas = const [
    {
      'perguntas': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto'     , 'pontuacao': 10},
        {'texto': 'Branco'    , 'pontuacao': 10},
        {'texto': 'Vermelho'  , 'pontuacao': 07},
        {'texto': 'Azul'      , 'pontuacao': 04},
      ],
    },
    {
      'perguntas': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto' : 'Cachorro' , 'pontuacao' : 8},
        {'texto' : 'Gato'     , 'pontuacao' : 4},
        {'texto' : 'Leão'     , 'pontuacao' : 10},
        {'texto' : 'Águia'    , 'pontuacao' : 9},
      ],
    },
    {
      'perguntas': 'Qual é o seu time favorito?',
      'respostas': [
        {'texto' : 'Corinthians' , 'pontuacao' : 10},
        {'texto' : 'São Paulo'   , 'pontuacao' : 2},
        {'texto' : 'Santos'      , 'pontuacao' : 3},
        {'texto' : 'Palmeiras'   , 'pontuacao' : 1},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < perguntas.length;
  }

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[_perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Título'),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
