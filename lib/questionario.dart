import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

class QuestionarioState extends State<Questionario> {
  Color _corSelecionada = Colors.grey;
  final List _coresQuestionario = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.amber,
  ];

  Color _getCorDinamica(List cores, String cor) {
    return widget._perguntaSelecionada == 0
        ? _coresQuestionario[cores.indexOf(cor)]
        : _corSelecionada;
  }

  void getProximaPergunta(int index) {
    widget._onSelected(_corSelecionada);
    setState(() {
      if (widget._perguntaSelecionada == 0) {
        _corSelecionada = _coresQuestionario[index];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(
          texto: widget._perguntas[widget._perguntaSelecionada]['texto']
              .toString(),
        ),
        //REFATORADO CODIGO PARA DECLARATIVO (O que fazer) AO INVES DE IMPERATIVO (COMO FAZER):
        ...widget._respostas.asMap().entries.map(
          (entry) => Resposta(
            texto: entry.value,
            index: entry.key,
            onSelected: getProximaPergunta,
            hoverColor: _getCorDinamica(widget._respostas, entry.value),
          ),
        ),
      ],
    );
  }
}

class Questionario extends StatefulWidget {
  final List<Map<String, Object>> _perguntas;
  final List<String> _respostas;
  final void Function(Color) _onSelected;
  final int _perguntaSelecionada;

  const Questionario({
    super.key,
    required this._perguntas,
    required this._respostas,
    required this._onSelected,
    required this._perguntaSelecionada,
  });

  @override
  State<Questionario> createState() => QuestionarioState();
}
