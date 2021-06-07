import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNofifyManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final _random = Random();

  void initSetting() async {
    var initAndroid = AndroidInitializationSettings('my_logo');
    var initIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final bool result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    var initSettings =
        InitializationSettings(android: initAndroid, iOS: initIOS);
    await flutterLocalNotificationsPlugin.initialize(initSettings);
    tz.initializeTimeZones();
  }

  Future<void> displayNotification(
      DateTime dateTime, DateTime today, String typeTitle, String body) async {
    var android = AndroidNotificationDetails(
        "channel id", "channel name", "channel desc",
        importance: Importance.max, priority: Priority.high, showWhen: false);
    var ios = IOSNotificationDetails();

    flutterLocalNotificationsPlugin.zonedSchedule(
        _random.nextInt(9999),
        typeTitle,
        body,
        tz.TZDateTime.from(dateTime, tz.local),
        // tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        NotificationDetails(android: android, iOS: ios),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);

    // await flutterLocalNotificationsPlugin
    //     .show(0, "sadadsad", "asjdkasjdkasd", plataform, payload: "asdsadas");
  }
}
