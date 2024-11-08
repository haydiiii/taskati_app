import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box userBox;
  static init() {
    userBox = Hive.box('userBox');
  }

  static cashData(key, value) {
    userBox.put(key, value);
  }

  static getCahData(key) {
    return userBox.get(key);
  }
}
