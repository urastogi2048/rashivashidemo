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
  bool flipped=true;
  late AnimationController flipcontroller;
  late Animation<double> rotationAnimation;
  late final Animation<double> curve;
  @override 
  void initState() {
    super.initState();
    flipped=false;
    flipcontroller=AnimationController(vsync: this,duration: const Duration(milliseconds: 800), reverseDuration: const Duration(milliseconds: 500));
    rotationAnimation=CurvedAnimation(parent: flipcontroller, curve: Curves.easeInOut);
    curve=Tween<double>(begin: 0.0, end: math.pi).animate(rotationAnimation);
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
        if(flipped){
          flipcontroller.reverse();
        }else{
          flipcontroller.forward();
        }
        flipped=!flipped;
       
      },
      child: AnimatedBuilder(
        animation: flipcontroller,

        builder: (context, child) {
          final angle =curve.value;
          print(angle);
          return 
          Transform(alignment: Alignment.center, 
          transform: Matrix4.identity()..setEntry(3, 2, 0.002)
                                       ..rotateY(angle),  
          child: angle <= math.pi / 2 ? TarotBack() : Transform(alignment: Alignment.center,transform: Matrix4.identity()
                                       ..rotateY(math.pi), child: TarotFront()) );
        },
      ),

         
     
        
      
    
    );
  }
}