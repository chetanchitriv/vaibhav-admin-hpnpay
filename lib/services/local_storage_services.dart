import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  static Future<void> setUserType(bool isUser) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool("isUser", isUser);
  }

  static Future<bool> getUserType() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getBool("isUser") ?? false; // Default to false if not found.
  }
}
