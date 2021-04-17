import 'package:shared_preferences/shared_preferences.dart';

var _prefs = SharedPreferences.getInstance();

void setSharedPref(bool isActive) async {
  final prefs = await _prefs;
  await prefs.setBool('onboarding_screen', isActive);
}

Future<bool> getSharedPref() async {
  final prefs = await _prefs;
  return prefs.getBool('onboarding_screen') ?? false;
}
