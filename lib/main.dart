import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp(titulo: "Meu APP de Perguntas"));

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  final _perguntas = const [
    //inferência de List<Map<String, Object>>
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Azul', 'Vermelho', 'Verde', 'Amarelo'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o nome mais legal?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  List<String> get respostas {
    return temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];
  } //

  Color? _corSelecionada;
  final List _coresAPP = [Colors.blue, Colors.red, Colors.green, Colors.amber];

  Color _getCorDinamica(List elements, String element) {
    return _perguntaSelecionada == 0
        ? _coresAPP[elements.indexOf(element)]
        : _corSelecionada;
  }

  void _responder(int index) {
    setState(() {
      if (_perguntaSelecionada == 0) {
        _corSelecionada = _coresAPP[index];
      }
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.titulo), centerTitle: true),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(
                    texto: _perguntas[_perguntaSelecionada]['texto'].toString(),
                  ),
                  //REFATORADO CODIGO PARA DECLARATIVO (O que fazer) AO INVES DE IMPERATIVO (COMO FAZER):
                  ...respostas.asMap().entries.map(
                    (entry) => Resposta(
                      texto: entry.value,
                      index: entry.key,
                      onSelected: _responder,
                      hoverColor: _getCorDinamica(respostas, entry.value),
                    ),
                  ),
                ],
              )
            : Center(child: Text("Parabéns", style: TextStyle(fontSize: 28))),
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
