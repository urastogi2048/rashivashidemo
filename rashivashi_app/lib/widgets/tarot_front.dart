import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class TarotFront extends StatelessWidget {
  const TarotFront({
    super.key,
    required this.cardName,
    required this.icon,
    this.illustration,
    this.width = 200,
    this.height = 340,
    this.color = const Color(0xFF161233),
    this.accent = const Color(0xFFD4AF37),
  });

  final String cardName;
  final String icon;
  final Widget? illustration;
  final double width;
  final double height;
  final Color color;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accent, width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: accent.withOpacity(0.6), width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Title banner.
              Text(
                cardName.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Divider(color: accent.withOpacity(0.5), indent: 24, endIndent: 24, height: 1),
              Expanded(
                child: Center(
                  child: illustration ??
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: accent, width: 1.5),
                        ),
                        child: Lottie.asset(icon, width: 48, height: 48),
                      ),
                ),
              ),

              Divider(color: accent.withOpacity(0.5), indent: 24, endIndent: 24, height: 1),
              const SizedBox(height: 6),
              Text(
                'TAROT',
                style: TextStyle(
                  color: accent.withOpacity(0.8),
                  fontSize: 10,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}