import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
main() => runApp(PerguntaApp(titulo: "Meu APP de Perguntas"));

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.titulo), centerTitle: true),
        body: Column(
          children: <Widget>[
            Questao(texto: perguntas[_perguntaSelecionada]),
            Resposta(texto: 'Azul', onSelected: _responder,hoverColor: Colors.blue),
            Resposta(texto: 'Vermelho', onSelected: _responder,hoverColor: Colors.red),
            Resposta(texto: 'Verde', onSelected: _responder,hoverColor: Colors.green)
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  final String titulo;

  const PerguntaApp({super.key, required this.titulo});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
