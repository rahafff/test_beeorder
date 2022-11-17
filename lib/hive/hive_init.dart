import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HiveSetUp {
  static Future<void> init() async {
    await Hive.initFlutter();
    await publicBoxes();
  }

  static Future<void> publicBoxes() async {
    await Hive.openBox('Authorization');
    await Hive.openBox('Theme');
    await Hive.openBox('Localization');
    await Hive.openBox('Notifications');
  }
}
