import 'package:bloc_practice/res/constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Configure FlutterSecureStorage with Android-specific options for release builds
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'pambuddy_secure_storage',
      preferencesKeyPrefix: 'pambuddy_',
    ),
  );

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // keys
  static const _authToken = Constants.authToken;
  static const _rememberMe = Constants.rememberMe;
  static const _checkLocalAuth = Constants.checkLocalAuth;
  static const _sessionId = Constants.sessionId;

  static Future<String> getAuthToken() async {
    return await storage.read(key: _authToken) ?? "";
  }

  static Future<void> setAuthToken(String authtoken) async {
    await storage.write(key: _authToken, value: authtoken);
  }

  static Future<void> setRememberMe(String rememberMe) async {
    await storage.write(key: _rememberMe, value: rememberMe);
  }

  static Future<String> getRememberMe() async {
    return await storage.read(key: _rememberMe) ?? "";
  }

  static Future<void> setRememberMeCheckbox(bool value) async {
    if (_prefs == null) await init();
    await _prefs!.setBool('remember_me_checkbox', value);
  }

  static Future<bool> getRememberMeCheckbox() async {
    if (_prefs == null) await init();
    return _prefs!.getBool('remember_me_checkbox') ?? false;
  }

  static Future<void> setLocalAuth(String checkLocalAuth) async {
    await storage.write(key: _checkLocalAuth, value: checkLocalAuth);
  }

  static Future<String> getLocalAuth() async {
    return await storage.read(key: _checkLocalAuth) ?? "";
  }

  static Future<String?> getSessionId() async {
    return await storage.read(key: _sessionId);
  }

  static Future<void> setSessionId(String sessionId) async {
    await storage.write(key: _sessionId, value: sessionId);
  }

  static Future<void> deleteSessionId() async {
    await storage.delete(key: _sessionId);
  }

  static Future<void> deleteAuthUser() async {
    await storage.delete(key: _authToken);
    await storage.delete(key: _rememberMe);
  }

  static Future<void> clearAll() async {
    await storage.deleteAll();
  }
}
