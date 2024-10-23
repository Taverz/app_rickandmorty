import 'package:shared_preferences/shared_preferences.dart';

import 'env_app_constans.dart';

class PreferencesManager {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getLocale() async {
    final prefs = await _getPrefs();
    return prefs.getString(EnvConstants.envLocaleKey);
  }

  Future<String?> getTheme() async {
    final prefs = await _getPrefs();
    return prefs.getString(EnvConstants.envThemeKey);
  }

  Future<void> setLocale(String locale) async {
    final prefs = await _getPrefs();
    await prefs.setString(EnvConstants.envLocaleKey, locale);
  }

  Future<void> setTheme(String theme) async {
    final prefs = await _getPrefs();
    await prefs.setString(EnvConstants.envThemeKey, theme);
  }
}
