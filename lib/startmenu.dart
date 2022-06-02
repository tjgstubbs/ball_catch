import 'dart:async';
import 'dart:math';
import 'package:ball_catch/mainmenu.dart';
import 'package:ball_catch/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ball_catch/bucket.dart';
import 'package:ball_catch/ball.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({Key? key}) : super(key: key);

  @override
  State<StartMenu> createState() => _StartMenuState();
}

enum direction {UP, DOWN, LEFT, RIGHT}

class _StartMenuState extends State<StartMenu> {

  double bucketX = 0.0;
  double bucketWidth = 0.4;
  int playerScore = 0;

  double ballSpawnX = 0;
  double ballY = -1;

  bool gameStarted = false;

  var ballYdirection = direction.DOWN;

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      startSpawning();

      moveBalls();

      if(playerDead()) {
        timer.cancel();
        dialog();
      }

    });
  }

  void dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "You Lose",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: reset,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(7),
                color: Colors.black,
                child: Text(
                  "Play Again",
                  style: TextStyle(color: Colors.white),
                )
              ),
            )
          ],
        );
      }
    );
  }

  void reset() {
    Navigator.pop(context);
    setState(() {
      gameStarted = false;
      bucketX = 0;
      ballY = -1;
      playerScore = 0;
    });
  }

  void moveBalls() {
    setState(() {
      if (ballYdirection == direction.DOWN) {
        ballY += 0.01;
      }

      if (ballY >= 0.5 && bucketX + bucketWidth >= ballSpawnX && bucketX <= ballSpawnX) {
        ballY = -1;
        playerScore++;
        newBall();
      }
    });
  }

  void newBall() {
    final rand = new Random();

    double num = rand.nextDouble() * 1;

    int num2 = rand.nextInt(2);

    if (num2 == 1) {
      ballSpawnX = -num;
    } else {
      ballSpawnX = num;
    }

  }

  void moveLeft() {
    setState(() {
      if (!(bucketX - 0.1 <= -1)) {
        bucketX -= 0.3;
      }
    });
  }

  void moveRight() {
    setState(() {
      if(!(bucketX + bucketWidth >= 1)) {
        bucketX += 0.3;
      }
    });
  }

  bool playerDead() {
    if (ballY >= 0.6) {
      return true;
    }
    return false;
  }

  void startSpawning() {
    setState(() {
      if (ballY <= -0.9) {
        ballYdirection = direction.DOWN;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
      },
      child: GestureDetector(
        onTap: startGame,
        child: Scaffold(
          backgroundColor: Colors.lightBlue,
          body: Center(
            child: Stack(
              children: [
                MainMenu(gameStarted: gameStarted),

                Score(
                  playerScore: playerScore,
                ),

                Bucket(x: bucketX, y: 0.7, bucketWidth: 0),

                Balls(x: ballSpawnX, y: ballY),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
