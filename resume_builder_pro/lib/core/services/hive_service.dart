import 'package:hive_flutter/hive_flutter.dart';
import 'package:resume_builder_pro/core/config/app_config.dart';

/// Hive database service — handles initialization and CRUD operations.
class HiveService {
  HiveService._();
  static final HiveService instance = HiveService._();

  late Box<Map> _resumeBox;
  late Box<dynamic> _settingsBox;
  late Box<Map> _userBox;

  bool _initialized = false;

  /// Initialize Hive with all required boxes.
  Future<void> init() async {
    if (_initialized) return;

    await Hive.initFlutter();

    _resumeBox = await Hive.openBox<Map>(AppConfig.resumeBox);
    _settingsBox = await Hive.openBox<dynamic>(AppConfig.settingsBox);
    _userBox = await Hive.openBox<Map>(AppConfig.userBox);

    _initialized = true;
  }

  // ──────────────────────────────────────────────
  // Resume Operations
  // ──────────────────────────────────────────────

  Box<Map> get resumeBox => _resumeBox;

  Future<void> saveResume(String id, Map<String, dynamic> data) async {
    await _resumeBox.put(id, data);
  }

  Map<String, dynamic>? getResume(String id) {
    final data = _resumeBox.get(id);
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }

  List<Map<String, dynamic>> getAllResumes() {
    return _resumeBox.values
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  Future<void> deleteResume(String id) async {
    await _resumeBox.delete(id);
  }

  // ──────────────────────────────────────────────
  // Settings Operations
  // ──────────────────────────────────────────────

  Box<dynamic> get settingsBox => _settingsBox;

  Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  T? getSetting<T>(String key, [T? defaultValue]) {
    return _settingsBox.get(key, defaultValue: defaultValue) as T?;
  }

  bool get isDarkMode => getSetting<bool>('darkMode') ?? false;
  bool get isOnboardingComplete =>
      getSetting<bool>('onboardingComplete') ?? false;
  bool get isLoggedIn => getSetting<bool>('isLoggedIn') ?? false;

  Future<void> setDarkMode(bool value) => saveSetting('darkMode', value);
  Future<void> setOnboardingComplete(bool value) =>
      saveSetting('onboardingComplete', value);
  Future<void> setLoggedIn(bool value) => saveSetting('isLoggedIn', value);

  // ──────────────────────────────────────────────
  // User Operations
  // ──────────────────────────────────────────────

  Box<Map> get userBox => _userBox;

  Future<void> saveUser(Map<String, dynamic> data) async {
    await _userBox.put('currentUser', data);
  }

  Map<String, dynamic>? getUser() {
    final data = _userBox.get('currentUser');
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }

  Future<void> clearUser() async {
    await _userBox.delete('currentUser');
  }

  /// Dispose all open boxes.
  Future<void> dispose() async {
    await _resumeBox.close();
    await _settingsBox.close();
    await _userBox.close();
  }
}
