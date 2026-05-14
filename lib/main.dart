import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp(titulo: "Meu APP de Perguntas"));

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  Color? _corSelecionada;

  Color _getCorDinamica(int elementIndex) {
    switch (elementIndex) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.red;
      case 2:
        return Colors.green;
      case 3:
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }

  void _responder(int indexMaximo, String cor) {
    if (_perguntaSelecionada == 0) {
      setState(() {
        switch (cor) {
          case "Azul":
            _corSelecionada = Colors.blue;
          case "Vermelho":
            _corSelecionada = Colors.red;
          case "Verde":
            _corSelecionada = Colors.green;
          case "Amarelo":
            _corSelecionada = Colors.amber;
          default:
            _corSelecionada = Colors.grey;
        }
      });
    }

    if (_perguntaSelecionada < indexMaximo - 1) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      //inferência de List<Map<String, Object>>
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': ['Azul', 'Vermelho', 'Verde', 'Amarelo'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'resposta': ['Maria', 'João', 'Leo', 'Pedro'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.titulo), centerTitle: true),
        body: Column(
          children: <Widget>[
            Questao(texto: perguntas[_perguntaSelecionada]['texto'].toString()),
            for (var entry
                in (perguntas[_perguntaSelecionada]['resposta'] as List)
                    .asMap()
                    .entries)
              //converti para map para pegar a key, para atribuir as cores do hover, para a primeira pergunta
              Resposta(
                texto: entry.value,
                onSelected: () => _responder(perguntas.length, entry.value),
                hoverColor: _perguntaSelecionada == 0
                    ? _getCorDinamica(entry.key)
                    : _corSelecionada,
              ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  final String titulo;

  const PerguntaApp({super.key, required this.titulo});
  /* outra forma
  @override
  _PerguntaAppState createState() => _PerguntaAppState(); 
*/
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
