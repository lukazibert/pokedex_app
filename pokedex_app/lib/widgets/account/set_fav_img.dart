import 'package:flutter/material.dart';
import 'dart:math' as math;

class SetFavImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 300),
      // height: MediaQuery.of(context).size.width * 0.5,
      // width: MediaQuery.of(context).size.width * 0.5,
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black),
      //     borderRadius: BorderRadius.circular(20)),
      child: Opacity(
        opacity: 0.5,
        child: Column(
          children: [
            Text('Set your favorite pokemon by clicking the edit icon'),
            Transform.rotate(
                //alignment: Alignment.center,
                angle: -math.pi * 0.68,
                child: Icon(Icons.arrow_back)),
          ],
        ),
      ),
    );
  }
}
