import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {

  final bool gameStarted;

  MainMenu({required this.gameStarted});

  void Test() {
    if(gameStarted == true) {
      print("main menu started");
    } else {
      print("Main Menu Fail ");
    }
  }
  @override
  Widget build(BuildContext context) {
    Test;
    return Container(
      alignment: Alignment(0, -0.1),
      child: Text(
        gameStarted ? '' : "S T A R T",
      style: TextStyle(color: Colors.black, fontSize: 30),),
    );
  }
}
