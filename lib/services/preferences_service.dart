import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static PreferencesService? _instance;
  static SharedPreferences? _preferences;
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language';
  static const String _lastLoginKey = 'last_login_timestamp';
  static const String _userTokenKey = 'user_token';
  PreferencesService._internal();
  static PreferencesService get instance {
    _instance ??= PreferencesService._internal();
    return _instance!;
  }

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setThemeMode(bool isDarkMode) async {
    return await _preferences?.setBool(_themeKey, isDarkMode) ?? false;
  }

  bool getThemeMode() {
    return _preferences?.getBool(_themeKey) ?? false;
  }

// Métodos para gerenciar idioma
  Future<bool> setLanguage(String languageCode) async {
    return await _preferences?.setString(_languageKey, languageCode) ?? false;
  }

  String getLanguage() {
    return _preferences?.getString(_languageKey) ?? 'pt';
  }

// Métodos para gerenciar autenticação
  Future<bool> setUserToken(String token) async {
    return await _preferences?.setString(_userTokenKey, token) ?? false;
  }

  String? getUserToken() {
    return _preferences?.getString(_userTokenKey);
  }

  Future<bool> setLastLoginTimestamp() async {
    return await _preferences?.setInt(
            _lastLoginKey, DateTime.now().millisecondsSinceEpoch) ??
        false;
  }

  DateTime? getLastLoginTimestamp() {
    final timestamp = _preferences?.getInt(_lastLoginKey);
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  Future<bool> clearAllPreferences() async {
    return await _preferences?.clear() ?? false;
  }

  static getToken() {}
}
