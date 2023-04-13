import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _instance = SharedPref.internal();

  static SharedPref get instance => _instance;

  SharedPreferences? _prefs;

  Future<SharedPreferences> get database async {
    if (_prefs != null) return _prefs!;

    return _prefs ??= await SharedPreferences.getInstance();
  }

  SharedPref.internal();
}