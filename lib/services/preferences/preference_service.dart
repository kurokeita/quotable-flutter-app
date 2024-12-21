import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
