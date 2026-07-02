import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:rashivashi_app/widgets/tarot_back.dart';
import 'package:rashivashi_app/widgets/tarot_front.dart';
class TarotCard extends StatefulWidget {
  const TarotCard({super.key});
  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> with TickerProviderStateMixin {
  bool flipped=true;
  late AnimationController flipcontroller;
  late AnimationController glowcontroller;
  late Animation<double> rotationAnimation;
  late final Animation<double> curve;
  late Animation<double> glowBlur;
  late Animation<double> glowSpread;
  late final glowCurve;
  @override 
  void initState() {
    super.initState();
    flipped=false;
    flipcontroller=AnimationController(vsync: this,duration: const Duration(milliseconds: 800), reverseDuration: const Duration(milliseconds: 500));
    glowcontroller=AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    rotationAnimation=CurvedAnimation(parent: flipcontroller, curve: Curves.easeInOut);
    curve=Tween<double>(begin: 0.0, end: math.pi).animate(rotationAnimation);
    glowCurve=CurvedAnimation(parent: glowcontroller, curve: Curves.easeInOut);
    glowBlur=Tween<double>(begin: 0.0, end: 35.0).animate(glowCurve);
    glowSpread=Tween<double>(begin: 0.0, end: 8.0).animate(glowCurve);
  }
  @override
  void dispose(){
    flipcontroller.dispose();
    glowcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(!flipped){
          await flipcontroller.forward();
          await glowcontroller.forward();
          //await glowcontroller.reverse();
        }else{
          glowcontroller.reverse();
          flipcontroller.reverse();
        }
        flipped=!flipped;
       
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([flipcontroller, glowcontroller]),
        
        builder: (context, child) {
          final angle =curve.value;
          print(angle);
          return 
          Transform(alignment: Alignment.center, 
          transform: Matrix4.identity()..setEntry(3, 2, 0.002)
                                       ..rotateY(angle),  
          child: angle <= math.pi / 2 ? TarotBack() : Container(
              decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD54F).withOpacity(0.8),
                  blurRadius: glowBlur.value,
                  spreadRadius: glowSpread.value,
                ),
                ],
              ),
            child: Transform(alignment: Alignment.center,transform: Matrix4.identity()
                                         ..rotateY(math.pi), child: TarotFront()),
          ) );
        },
      ),

         
     
        
      
    
    );
  }
}