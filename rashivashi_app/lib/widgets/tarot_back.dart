import 'package:flutter/material.dart';
class TarotBack extends StatelessWidget {
  const TarotBack({
    super.key,
    this.width = 200,
    this.height = 340,
    this.color = const Color(0xFF161233),
    this.accent = const Color(0xFFD4AF37),
  });

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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: accent, width: 1.5),
                ),
                child: Icon(Icons.nightlight_round, color: accent, size: 30),
              ),
              const Positioned(top: 10, left: 10, child: _CornerDot()),
              const Positioned(top: 10, right: 10, child: _CornerDot()),
              const Positioned(bottom: 10, left: 10, child: _CornerDot()),
              const Positioned(bottom: 10, right: 10, child: _CornerDot()),
            ],
          ),
        ),
      ),
    );
  }
}
class _CornerDot extends StatelessWidget {
  const _CornerDot();

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.diamond_outlined, size: 12, color: Color(0xFFD4AF37));
  }
}