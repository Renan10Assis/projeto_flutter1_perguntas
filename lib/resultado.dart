import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  
  final String texto;
  final Color cor; 
  const Resultado({super.key, required this.texto, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor,
      width: double.infinity,
      alignment: Alignment.center,
      height: double.infinity,
      child: Text(texto,
      style: TextStyle(
        color: Colors.black,
        letterSpacing: 30,
        fontSize: 30,
        fontStyle: FontStyle.italic ,
        decorationThickness: 2,
        decorationStyle: TextDecorationStyle.wavy,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.combine([TextDecoration.overline, TextDecoration.underline])
      ),
      textAlign: TextAlign.center,),
    );
  }
}