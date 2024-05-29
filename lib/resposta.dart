import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  Resposta(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black87),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: onSelected,
        child: Text(
          texto,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}