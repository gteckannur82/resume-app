import 'package:flutter/material.dart';

/// Design System Typography — Inter font exclusively.
/// Tight typographic scale optimized for mobile.
/// Negative letter-spacing on larger sizes for SaaS "tightness".
abstract final class AppTypography {
  static const String fontFamily = 'Inter';

  // ──────────────────────────────────────────────
  // Display — 32/40, Bold, -0.02em
  // ──────────────────────────────────────────────
  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    letterSpacing: -0.64, // -0.02em * 32
  );

  // ──────────────────────────────────────────────
  // Headline Large — 24/32, SemiBold, -0.015em
  // ──────────────────────────────────────────────
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -0.36, // -0.015em * 24
  );

  // ──────────────────────────────────────────────
  // Headline Medium — 20/28, SemiBold, -0.01em
  // ──────────────────────────────────────────────
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: -0.2, // -0.01em * 20
  );

  // ──────────────────────────────────────────────
  // Title Large — 18/26, SemiBold
  // ──────────────────────────────────────────────
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 26 / 18,
  );

  // ──────────────────────────────────────────────
  // Title Medium — 16/24, SemiBold
  // ──────────────────────────────────────────────
  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
  );

  // ──────────────────────────────────────────────
  // Body Large — 16/24, Regular
  // ──────────────────────────────────────────────
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );

  // ──────────────────────────────────────────────
  // Body Medium — 14/20, Regular
  // ──────────────────────────────────────────────
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  // ──────────────────────────────────────────────
  // Body Small — 12/18, Regular
  // ──────────────────────────────────────────────
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 18 / 12,
  );

  // ──────────────────────────────────────────────
  // Label Large — 14/20, Medium
  // ──────────────────────────────────────────────
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
  );

  // ──────────────────────────────────────────────
  // Label Medium — 12/16, Medium
  // ──────────────────────────────────────────────
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
  );

  // ──────────────────────────────────────────────
  // Label Small — 11/14, SemiBold
  // ──────────────────────────────────────────────
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
  );
}
