import 'package:flutter/material.dart';
import 'package:rashivashi_app/widgets/tarot_back.dart';
import 'package:rashivashi_app/widgets/tarot_front.dart';
class TarotCard extends StatefulWidget {
  const TarotCard({super.key});
  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  bool flipped=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          flipped = !flipped;
        });
       
      },
      child:  flipped ? TarotBack() : TarotFront(),
     
        
      
    
    );
  }
}