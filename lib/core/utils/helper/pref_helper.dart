import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  late final SharedPreferences _pref;

  static PrefHelper instance = PrefHelper();

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> saveCookie(String cookie) async {
    return await _pref.setString('cookie', cookie);
  }

  String get cookie => _pref.getString('cookie') ?? '';

  Future<bool> removeCookie() async {
    return await _pref.remove('cookie');
  }

  Future<bool> saveCsrfToken(String token) async {
    return await _pref.setString('csrfToken', token);
  }

  String get csrfToken => _pref.getString('csrfToken') ?? '';

  Future<bool> removeCsrfToken() async {
    return await _pref.remove('csrfToken');
  }

  Future<bool> setFirstInstall() async {
    return await _pref.setBool("firstInstall", false);
  }

  bool get isFirstInstall => _pref.getBool("firstInstall") ?? true;

  Future<bool> setLogin(bool login) async {
    return await _pref.setBool("islogin", login);
  }

  bool get isLogin => _pref.getBool("islogin") ?? false;

  setDarkTheme(bool value) {
    _pref.setBool("THEMESTATUS", value);
  }

  bool getTheme() {
    var phoneTheme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = phoneTheme == Brightness.dark;
    return _pref.getBool("THEMESTATUS") ?? isDarkMode;
  }

  Future<bool> saveLangCode(String code) async {
    return await _pref.setString('lang_code', code);
  }

  String get langCode => _pref.getString('lang_code') ?? 'en';

  Future<bool> saveCountryCode(String code) async {
    return await _pref.setString('country_code', code);
  }

  String get countryCode => _pref.getString('country_code') ?? 'US';

  Future<bool> setLoginType(bool value) async {
    return await _pref.setBool("loginTwoFa", value);
  }

  bool get isLoginTwoFa => _pref.getBool("loginTwoFa") ?? false;
}
