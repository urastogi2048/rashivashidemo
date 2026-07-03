import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rashivashi_app/widgets/tarotcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _CardData {
  final String name;
  final String icon;

  const _CardData(this.name, this.icon);
}

class _HomeScreenState extends State<HomeScreen> {
  static const _accent = Color(0xFFD4AF37);

  final List<_CardData> cards = const [
    _CardData("The Sun", 'assets/lottie/sun.json'),
    _CardData("The Moon", 'assets/lottie/moon.json'),
    _CardData("The Star", 'assets/lottie/star.json'),
    _CardData("The Lovers", 'assets/lottie/lovers.json'),
    _CardData("The Fool", 'assets/lottie/joker.json'),
  ];

  final math.Random random = math.Random();

  int currentIndex = 0;

  void _drawNewCard() {
    int next;

    do {
      next = random.nextInt(cards.length);
    } while (next == currentIndex);

    setState(() {
      currentIndex = next;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //drawcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentCard = cards[currentIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF050308), Color(0xFF120A24), Color(0xFF050308)],
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
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            switchInCurve: Curves.easeOut,
                            switchOutCurve: Curves.easeIn,
                            transitionBuilder: (child, animation) {
                              final isIncoming =
                                  animation.status != AnimationStatus.reverse;

                              final offset =
                                  Tween<Offset>(
                                    begin: isIncoming
                                        ? const Offset(
                                            1.0,
                                            0,
                                          ) // enter from right
                                        : Offset.zero,
                                    end: isIncoming
                                        ? Offset.zero
                                        : const Offset(
                                            -1.0,
                                            0,
                                          ), // leave to left
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOut,
                                    ),
                                  );

                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: offset,
                                  child: child,
                                ),
                              );
                            },
                            child: TarotCard(
                              key: ValueKey(currentIndex),
                              cardName: currentCard.name,
                              icon: currentCard.icon,
                            ),
                          ),
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
    final paint = Paint();

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
