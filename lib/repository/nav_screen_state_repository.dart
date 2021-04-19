import 'package:shared_preferences/shared_preferences.dart';



var _prefs = SharedPreferences.getInstance();

void setFloatActionButtonState(bool isActive) async {
  final prefs = await _prefs;
  await prefs.setBool('float_action_button_state', isActive);
}

Future<bool> getFloatActionButtonState() async {
  final prefs = await _prefs;
  return prefs.getBool('float_action_button_state') ?? false;
}
