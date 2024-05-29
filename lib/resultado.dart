import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{

  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado{
    if(pontuacao>20){
      return 'Boas escolhas';
    }else{
      return 'Escolhas ruins';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
                  fraseResultado,
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    ),
                ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}