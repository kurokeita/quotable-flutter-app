import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  late final SharedPreferences _prefs;
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    _darkMode = _prefs.getBool('darkMode') ?? false;
  }

  Future<void> toggleDarkMode() async {
    _darkMode = !_darkMode;
    await _prefs.setBool('darkMode', _darkMode);
  }
}
