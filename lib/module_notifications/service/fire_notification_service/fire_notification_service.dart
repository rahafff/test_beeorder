import 'dart:async';
import 'dart:developer';
import 'dart:io' as p;
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/subjects.dart';
import 'package:sales_beeorder_app/hive/hive_init.dart';
import 'package:sales_beeorder_app/module_notifications/model/notification_model.dart';
import 'package:sales_beeorder_app/module_notifications/preferences/notification_preferences/notification_preferences.dart';
import 'package:sales_beeorder_app/module_notifications/repository/notification_repo.dart';
import 'package:sales_beeorder_app/utils/logger/logger.dart';
import 'package:soundpool/soundpool.dart';

@injectable
class FireNotificationService {
  final NotificationsPrefHelper _prefHelper;
  final NotificationRepo _notificationRepo;

  FireNotificationService(
    this._prefHelper,
    this._notificationRepo,
  );

  static final PublishSubject<RemoteMessage> _onNotificationReceived =
      PublishSubject();

  Stream get onNotificationStream => _onNotificationReceived.stream;

  static StreamSubscription? iosSubscription;

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    if (p.Platform.isIOS) {
      await _fcm.requestPermission(
        sound: true,
        criticalAlert: true,
        announcement: true,
      );
    }
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // var isActive = _prefHelper.getIsActive();
    await refreshNotificationToken();
  }

  Future<void> refreshToken() async {
    try {
      var token = await _fcm.getToken();
      _notificationRepo.postToken(token);
    } catch (e) {}
  }

  Future<void> deleteToken() async {
    _notificationRepo.postToken(null);
  }

  Future<void> refreshNotificationToken() async {
    var token = await _fcm.getToken();
    log(token.toString());
    if (token != null) {
      // And Subscribe to the changes
      try {
        _notificationRepo.postToken(token);
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          playSound();
          _onNotificationReceived.add(message);
        });
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          NotificationModel notificationModel =
              NotificationModel.fromJson(message.data);
          SchedulerBinding.instance?.addPostFrameCallback(
            (_) {
              // if (notificationModel.navigateRoute == ChatRoutes.chatRoute) {
              //   Navigator.pushNamed(GlobalVariable.navState.currentContext!,
              //       notificationModel.navigateRoute ?? '',
              //       arguments: ChatArgument(
              //           roomID:
              //               notificationModel.chatNotification?.roomID ?? '',
              //           userID: notificationModel.chatNotification?.senderID,
              //           userType: 'store'));
              // } else {
              //   Navigator.pushNamed(GlobalVariable.navState.currentContext!,
              //       notificationModel.navigateRoute ?? '',
              //       arguments: notificationModel.argument);
              // }
            },
          );
        });
        FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static Future<dynamic> backgroundMessageHandler(RemoteMessage message) async {
    await HiveSetUp.init();
    Logger().info('Background Message Handler', 'onMessage: $message');
    _onNotificationReceived.add(message);
    await playSound();
    return Future<void>.value();
  }

  static Future<void> playSound() async {
    if (p.Platform.isIOS) {
      return;
    }
    Soundpool pool = Soundpool.fromOptions();
    var sound = await rootBundle
        .load(NotificationsPrefHelper().getNotification())
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    // RingerModeStatus ringerStatus = await SoundMode.ringerModeStatus;
    // if (ringerStatus == RingerModeStatus.normal) {
    //   pool.play(sound,
    //       repeat: NotificationsPrefHelper().getNotification().contains('2')
    //           ? 3
    //           : 0);
    }
  }
