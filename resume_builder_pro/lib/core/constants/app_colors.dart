import 'package:flutter/material.dart';

/// Design System Colors — Zenith Interface Palette
/// Extracted from DESIGN.md and design screen HTML code.
/// The palette follows Material 3 tonal naming with a "Clean Tech" indigo primary.
abstract final class AppColors {
  // ──────────────────────────────────────────────
  // Primary
  // ──────────────────────────────────────────────
  static const Color primary = Color(0xFF3525CD);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF4F46E5);
  static const Color onPrimaryContainer = Color(0xFFDAD7FF);
  static const Color inversePrimary = Color(0xFFC3C0FF);
  static const Color primaryFixed = Color(0xFFE2DFFF);
  static const Color primaryFixedDim = Color(0xFFC3C0FF);
  static const Color onPrimaryFixed = Color(0xFF0F0069);
  static const Color onPrimaryFixedVariant = Color(0xFF3323CC);

  // ──────────────────────────────────────────────
  // Secondary
  // ──────────────────────────────────────────────
  static const Color secondary = Color(0xFF4648D4);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFF6063EE);
  static const Color onSecondaryContainer = Color(0xFFFFFBFF);
  static const Color secondaryFixed = Color(0xFFE1E0FF);
  static const Color secondaryFixedDim = Color(0xFFC0C1FF);
  static const Color onSecondaryFixed = Color(0xFF07006C);
  static const Color onSecondaryFixedVariant = Color(0xFF2F2EBE);

  // ──────────────────────────────────────────────
  // Tertiary
  // ──────────────────────────────────────────────
  static const Color tertiary = Color(0xFF7E3000);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFA44100);
  static const Color onTertiaryContainer = Color(0xFFFFD2BE);
  static const Color tertiaryFixed = Color(0xFFFFDBCC);
  static const Color tertiaryFixedDim = Color(0xFFFFB695);
  static const Color onTertiaryFixed = Color(0xFF351000);
  static const Color onTertiaryFixedVariant = Color(0xFF7B2F00);

  // ──────────────────────────────────────────────
  // Error
  // ──────────────────────────────────────────────
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // ──────────────────────────────────────────────
  // Surface
  // ──────────────────────────────────────────────
  static const Color surface = Color(0xFFFCF8FF);
  static const Color surfaceDim = Color(0xFFDCD8E5);
  static const Color surfaceBright = Color(0xFFFCF8FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF5F2FF);
  static const Color surfaceContainer = Color(0xFFF0ECF9);
  static const Color surfaceContainerHigh = Color(0xFFEAE6F4);
  static const Color surfaceContainerHighest = Color(0xFFE4E1EE);
  static const Color onSurface = Color(0xFF1B1B24);
  static const Color onSurfaceVariant = Color(0xFF464555);
  static const Color inverseSurface = Color(0xFF302F39);
  static const Color inverseOnSurface = Color(0xFFF3EFFC);
  static const Color surfaceTint = Color(0xFF4D44E3);
  static const Color surfaceVariant = Color(0xFFE4E1EE);

  // ──────────────────────────────────────────────
  // Outline
  // ──────────────────────────────────────────────
  static const Color outline = Color(0xFF777587);
  static const Color outlineVariant = Color(0xFFC7C4D8);

  // ──────────────────────────────────────────────
  // Background (alias for surface in M3)
  // ──────────────────────────────────────────────
  static const Color background = Color(0xFFFCF8FF);
  static const Color onBackground = Color(0xFF1B1B24);

  // ──────────────────────────────────────────────
  // Semantic / Functional
  // ──────────────────────────────────────────────
  static const Color success = Color(0xFF16A34A);
  static const Color successContainer = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningContainer = Color(0xFFFEF3C7);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoContainer = Color(0xFFDBEAFE);

  // ──────────────────────────────────────────────
  // Gradient presets used in design
  // ──────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryContainer, secondaryContainer],
  );

  static const LinearGradient goalCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4F46E5), Color(0xFF6063EE)],
  );

  // ──────────────────────────────────────────────
  // Dark Mode Overrides
  // ──────────────────────────────────────────────
  static const Color darkSurface = Color(0xFF131318);
  static const Color darkSurfaceContainer = Color(0xFF1E1E24);
  static const Color darkSurfaceContainerHigh = Color(0xFF28282E);
  static const Color darkSurfaceContainerLowest = Color(0xFF0E0E13);
  static const Color darkOnSurface = Color(0xFFE4E1EE);
  static const Color darkOnSurfaceVariant = Color(0xFFC7C4D8);
  static const Color darkOutline = Color(0xFF918F9E);
  static const Color darkOutlineVariant = Color(0xFF464555);
}
