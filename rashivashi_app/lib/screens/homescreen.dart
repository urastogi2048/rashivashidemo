import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:rashivashi_app/widgets/tarotcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _accent = Color(0xFFD4AF37);

  int _drawCount = 0;

  void _drawNewCard() {
    setState(() => _drawCount++);
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF050308), 
              Color(0xFF120A24),
              Color(0xFF050308), 
            ],
            stops: [0.0, 0.55, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(child: CustomPaint(painter: _StarfieldPainter())),

            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'DAILY TAROT',
                    style: TextStyle(
                      color: _accent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 4,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 260,
                            height: 260,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  _accent.withOpacity(0.18),
                                  _accent.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                          TarotCard(key: ValueKey(_drawCount)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: _drawNewCard,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: _accent, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'DRAW A NEW CARD',
                          style: TextStyle(
                            color: _accent,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _StarfieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);
    final paint = Paint()..color = Colors.white;

    for (int i = 0; i < 60; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.2 + 0.3;
      paint.color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.1);
      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarfieldPainter oldDelegate) => false;
}