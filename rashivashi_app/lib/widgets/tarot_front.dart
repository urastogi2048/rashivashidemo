import 'package:flutter/material.dart';

class TarotFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 109, 7, 7),
          borderRadius: BorderRadius.circular(8),
        ),
      width: 200,
          height: 400,
      child: Center(
        child: Text(
          'Tarot Front',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      )
    );
  }
}