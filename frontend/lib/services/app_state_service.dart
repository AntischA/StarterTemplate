// app_state_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class AppStateService {
  static const _keyIsRegistered = 'is_registered';
  static const _keyIsWelcomeSeen = 'is_welcome_seen';
  static const _keyIsGuest = 'is_guest';

  Future<bool> get isRegistered async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsRegistered) ?? false;
  }

  Future<bool> get isWelcomeSeen async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsWelcomeSeen) ?? false;
  }

  Future<bool> get isGuest async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsGuest) ?? false;
  }

  Future<void> setRegistered({bool value = true}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsRegistered, value);
    if (value) await prefs.setBool(_keyIsGuest, false);
  }

  Future<void> setWelcomeSeen({bool value = true}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsWelcomeSeen, value);
  }

  Future<void> setGuest({bool value = true}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsGuest, value);
    await prefs.setBool(_keyIsRegistered, false);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
