import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp(titulo: "Meu APP de Perguntas"));

class _PerguntaAppState extends State<PerguntaApp> {

  int _perguntaSelecionada = 0;
  Color _corSelecionada = Colors.black;

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

  List<String> get _respostas {
    return temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];
  } 

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
//
  void getProximaPergunta(Color corSelecionada){
    setState(() {
      _perguntaSelecionada++;
      _corSelecionada = corSelecionada;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.titulo), centerTitle: true),
        body: temPerguntaSelecionada
            ? Questionario(perguntas: _perguntas, respostas: _respostas, onSelected: getProximaPergunta, perguntaSelecionada: _perguntaSelecionada)
            : Center(
              child: Resultado(texto: 'PARABÉNS', cor: _corSelecionada)),
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
