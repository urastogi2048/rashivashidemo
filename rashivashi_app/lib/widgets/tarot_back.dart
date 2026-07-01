import 'package:flutter/material.dart';
class TarotBack extends StatelessWidget {
  const TarotBack({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 11, 11),
          borderRadius: BorderRadius.circular(8),
        ),
          //color: const Color.fromARGB(212, 0, 0, 0),
          width: 200,
          height: 400,
          child: Center(child: Text('TAROT CARD BACK', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
          );
    
  }
}