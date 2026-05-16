import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp(titulo: "Meu APP de Perguntas"));

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  Color? _corSelecionada;
  final List _coresAPP = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.grey,
  ];

  Color _getCorDinamica(List elements, String element) {
    return _coresAPP[elements.indexOf(element)];
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
        'texto': 'Qual é o nome mais legal?',
        'resposta': ['Maria', 'João', 'Leo', 'Pedro'],
      },
    ];

    List<String> respostas =
        perguntas[_perguntaSelecionada]['resposta'] as List<String>;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.titulo), centerTitle: true),
        body: Column(
          children: <Widget>[
            Questao(texto: perguntas[_perguntaSelecionada]['texto'].toString()),
            //REFATORADO CODIGO PARA DECLARATIVO (O que fazer) AO INVES DE IMPERATIVO (COMO FAZER):
            ...respostas.asMap().entries.map(
              (entry) => Resposta(
                texto: entry.value,
                index: entry.key,
                onSelected: _perguntaSelecionada + 1 < perguntas.length
                    ? _responder
                    : (i){}, //no else retorna vazio por enquanto, como o componente existe Function(int), passar função vazia com argumento vazio (i)
                hoverColor: _perguntaSelecionada == 0
                    ? _getCorDinamica(
                        respostas,
                        entry.value,
                      ) //indexOf pois t não recebe strings iguais, se recebesse usaria a abordagem com Map
                    : _corSelecionada,
              ),
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
