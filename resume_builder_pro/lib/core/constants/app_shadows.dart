import 'package:flutter/material.dart';

/// Design System Shadows.
/// Depth via "Soft Ambient Shadows" and "Tonal Layering"
/// rather than heavy borders.
abstract final class AppShadows {
  /// Card shadow — soft, ambient.
  /// `0px 4px 20px 0px rgba(0, 0, 0, 0.05)`
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 4),
      blurRadius: 20,
    ),
  ];

  /// Elevated card — slightly more pronounced.
  static const List<BoxShadow> cardElevated = [
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 8),
      blurRadius: 32,
    ),
  ];

  /// Interactive shadow — indigo-tinted for "pressability".
  static const List<BoxShadow> interactive = [
    BoxShadow(
      color: Color(0x1A4F46E5),
      offset: Offset(0, 4),
      blurRadius: 16,
    ),
  ];

  /// Primary button shadow
  static const List<BoxShadow> primaryButton = [
    BoxShadow(
      color: Color(0x333525CD),
      offset: Offset(0, 4),
      blurRadius: 12,
    ),
  ];

  /// Bottom navigation shadow
  static const List<BoxShadow> bottomNav = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, -2),
      blurRadius: 20,
    ),
  ];

  /// Input focus glow — 4px soft outer glow (indigo-tinted)
  static const List<BoxShadow> inputFocus = [
    BoxShadow(
      color: Color(0x1A4F46E5),
      offset: Offset.zero,
      blurRadius: 4,
      spreadRadius: 2,
    ),
  ];

  /// No shadow
  static const List<BoxShadow> none = [];
}
