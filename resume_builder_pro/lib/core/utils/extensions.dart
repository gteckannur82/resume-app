import 'package:flutter/material.dart';
import 'package:resume_builder_pro/core/config/app_config.dart';

/// Responsive layout utilities.
/// Phone < 600, Tablet 600-900, Desktop > 900.
extension ResponsiveExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => screenWidth < AppConfig.mobileBreakpoint;
  bool get isTablet =>
      screenWidth >= AppConfig.mobileBreakpoint &&
      screenWidth < AppConfig.desktopBreakpoint;
  bool get isDesktop => screenWidth >= AppConfig.desktopBreakpoint;

  /// Returns a value based on screen size.
  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet) return tablet ?? mobile;
    return mobile;
  }

  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);
}

/// Theme shorthand extensions.
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

/// String extensions.
extension StringExtension on String {
  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  String get initials {
    final parts = trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return isNotEmpty ? this[0].toUpperCase() : '';
  }
}
