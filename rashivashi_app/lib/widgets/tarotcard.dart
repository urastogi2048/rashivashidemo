import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:rashivashi_app/widgets/tarot_back.dart';
import 'package:rashivashi_app/widgets/tarot_front.dart';
class TarotCard extends StatefulWidget {
  const TarotCard({super.key});
  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> with SingleTickerProviderStateMixin {
  bool flipped=false;
  late AnimationController flipcontroller;
  @override 
  void initState() {
    super.initState();
    flipcontroller=AnimationController(vsync: this,duration: const Duration(milliseconds: 800));
  }
  @override
  void dispose(){
    flipcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          flipped = !flipped;
          if(flipped){
            flipcontroller.forward();
          }
          else {
            flipcontroller.reverse();
          }
              
        });
       
      },
      child: AnimatedBuilder(
        animation: flipcontroller,
       
        builder: (context, child) {
          final angle =flipcontroller.value*math.pi;
          print(angle);
          return Transform(alignment: Alignment.center, transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(angle),  child: angle > math.pi / 2 ? TarotBack() : TarotFront());
        },
      ),

         
     
        
      
    
    );
  }
}