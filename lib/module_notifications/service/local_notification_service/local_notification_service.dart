import 'dart:convert';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sales_beeorder_app/utils/logger/logger.dart';


@injectable
class LocalNotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final PublishSubject<Map<String, dynamic>> _onNotificationReceived =
      PublishSubject();

  Stream<Map<String, dynamic>> get onLocalNotificationStream =>
      _onNotificationReceived.stream;

  Future<void> init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(requestSoundPermission: true);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void showNotification(RemoteMessage message) {
    RemoteNotification notification = message.notification!;
    IOSNotificationDetails iOSPlatformChannelSpecifics =
        const IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: false,
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'Bee order notification_test',
      'beeorder Notification test',
      'Showing notifications while the app running',
      importance: Importance.max,
      priority: Priority.max,
      showWhen: true,
      playSound: false,
      channelShowBadge: true,
      enableLights: true,
      enableVibration: true,
      onlyAlertOnce: false,
      category: 'Local',
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    try {
      flutterLocalNotificationsPlugin.show(
          (int.tryParse(message.messageId ?? '1') ?? Random().nextInt(100000)) %
              100000,
          notification.title,
          notification.body,
          platformChannelSpecifics,
          payload: json.encode(message.data));
    } catch (e) {
      Logger().error('Local notification', e.toString(), StackTrace.current);
    }


  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      var data = json.decode(payload);
      _onNotificationReceived.add(data);
    }
  }

}
