import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final int index;
  final void Function(int) onSelected;
  final Color? hoverColor;
  final Color? backgroundColor;

  const Resposta({
    super.key,
    required this.texto,
    required this.index,
    this.backgroundColor,
    this.hoverColor,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(2),
      child: FloatingActionButton(
        onPressed: ()=> onSelected(index),
        backgroundColor: backgroundColor ?? Colors.blueGrey[100],
        hoverColor: hoverColor?? const Color.fromARGB(255, 112, 187, 171),
        child: Text(
          texto,
          style: TextStyle(fontSize: 20, color: Colors.black ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
