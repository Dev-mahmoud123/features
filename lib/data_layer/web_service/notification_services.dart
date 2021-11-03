import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  /// init instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('app_logo');
    const IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false,
    );

    /// init time zone
    tz.initializeTimeZones();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// TODO : show Simple Notification
  Future<void> showNotification() async {
    var android = const AndroidNotificationDetails('id', 'channel ',
        channelDescription: 'Main channel notifications',
        priority: Priority.high,
        importance: Importance.max);
    var iOS = const IOSNotificationDetails(
      sound: 'default.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Flutter devs',
      'Flutter Local Notification Demo',
      platform,
      payload: 'Welcome to the Local Notification demo ',
    );
  }

  /// TODO : scheduleLNotification

  Future<void> scheduleLNotification() async {
    var android = const AndroidNotificationDetails('id', 'channel ',
        channelDescription: 'Main channel notifications',
        priority: Priority.high,
        importance: Importance.max);
    var iOS = const IOSNotificationDetails(
      sound: 'default.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Flutter devs',
      'Flutter Local Notification Demo',
      tz.TZDateTime.now(tz.local).add(const Duration(minutes: 1)),
      platform,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  /// TODO : cancel  Notification
  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
