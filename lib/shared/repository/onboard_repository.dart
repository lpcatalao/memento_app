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

class OnboardinRepository {
  var _prefs = SharedPreferences.getInstance();

  void setSharedPref(bool isActive) async {
    final prefs = await _prefs;
    await prefs.setBool('onboarding_page', isActive);
  }

  void setRegisterSharedPreferences(bool state) async {
    final prefs = await _prefs;
    await prefs.setBool('register_alert', state);
  }

  void setMapSharedPreferences(bool state) async {
    final prefs = await _prefs;
    await prefs.setBool('map_alert', state);
  }

  void setHomeSharedPreferences(bool state) async {
    final prefs = await _prefs;
    await prefs.setBool('home_alert', state);
  }

  Future<bool> getSharedPref() async {
    final prefs = await _prefs;
    return prefs.getBool('onboarding_page') ?? false;
  }

  Future<bool> getRegisterSharedPreferences() async {
    final prefs = await _prefs;
    return prefs.getBool('register_alert') ?? false;
  }

  Future<bool> getMapSharedPreferences() async {
    final prefs = await _prefs;
    return prefs.getBool('map_alert') ?? false;
  }

  Future<bool> getHomeSharedPreferences() async {
    final prefs = await _prefs;
    return prefs.getBool('home_alert') ?? false;
  }
}