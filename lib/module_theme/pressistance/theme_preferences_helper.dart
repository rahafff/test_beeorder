import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemePreferencesHelper {
  var preferences = Hive.box('Theme');

  void setDarkMode() {
    preferences.put('dark', true);
  }

  void setDayMode() {
    preferences.put('dark', false);
  }

  bool isDarkMode() {
    bool? dark = preferences.get('dark') ?? true;
    return dark == true;
  }
}
