import 'package:flutter/material.dart';

class AppStyles {
  static LinearGradient SHIMMER_GRADIENT = LinearGradient(
    colors: [
      const Color(0xFFF2F8FF),
      const Color(0xFFF2F8FF).withOpacity(0.95),
      const Color(0xFFF2F8FF),
    ],
    stops: const [
      0.1,
      0.3,
      0.4,
    ],
    begin: const Alignment(-1.0, -0.3),
    end: const Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const TextStyle H = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF212529),
  );

  static const TextStyle P1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Color(0xFF212529),
  );

  static const TextStyle P2 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Color(0xFF6C757D),
  );
}
