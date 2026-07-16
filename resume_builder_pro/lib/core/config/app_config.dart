/// Application-wide configuration constants.
abstract final class AppConfig {
  static const String appName = 'ResumEase';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  /// Hive box names
  static const String resumeBox = 'resumes';
  static const String settingsBox = 'settings';
  static const String userBox = 'user';

  /// Animation durations (ms)
  static const int splashDuration = 3000;
  static const int transitionDuration = 300;
  static const int microAnimationDuration = 200;
  static const int staggerDelay = 100;

  /// PDF defaults
  static const double pdfMarginTop = 40;
  static const double pdfMarginBottom = 40;
  static const double pdfMarginLeft = 40;
  static const double pdfMarginRight = 40;

  /// Layout breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
}
