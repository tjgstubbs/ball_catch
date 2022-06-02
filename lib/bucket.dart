import 'package:flutter/material.dart';

class Bucket extends StatelessWidget {
  final x;
  final y;
  final bucketWidth;

  Bucket({this.x, this.y, this.bucketWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(((2*x + bucketWidth)/(2-bucketWidth) + 0.25), y),
      child: Image.asset('images/bucket.jpg',
      height: 125,
      width: MediaQuery.of(context).size.width / 5,)
    );
  }
}
