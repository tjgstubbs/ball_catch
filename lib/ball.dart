import 'package:flutter/material.dart';

class Balls extends StatelessWidget {
final x;
final y;

Balls({this.x, this.y});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle,
        color: Colors.red
        ),
        width: 20,
        height: 20,
      ),
    );
  }
}
