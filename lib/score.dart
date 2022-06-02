import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final playerScore;

  Score({this.playerScore});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment(-0.9, -0.9),
          child: Text(playerScore.toString(), style: TextStyle(fontSize: 25, color: Colors.black),),
        ),
      ],
    );
  }
}
