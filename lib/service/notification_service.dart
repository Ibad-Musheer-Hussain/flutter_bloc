import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationService {
  // var db = FirebaseService().db;
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: true,
      criticalAlert: true,
      //provisional: true,
      announcement: true,
    );

    // FIXED: Disable Firebase's automatic notification display on iOS
    // This prevents duplicate notifications
    if (Platform.isIOS) {
      messaging.setForegroundNotificationPresentationOptions(
        alert: false, // Changed from true to false
        badge: true,
        sound: false, // Changed from true to false
      );
    } else {
      messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // if (kDebugMode) {
      //   print("authorized");
      // }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print("User granted Provisional Permission");
      }
    } else {
      if (kDebugMode) {
        print("User denied Permission ${settings.authorizationStatus}");
      }
    }
  }

  isTokenRefresh() {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  void getNotification(BuildContext context) {
    // UserProfileProvider userProfileProvider =
    //     Provider.of<UserProfileProvider>(context, listen: false);
    FirebaseMessaging.onMessage.listen((message) async {
      // if (userProfileProvider.userProfile?.notificationEnabled ?? false) {
        // await showNotification(context, message); ENABLE THIS FOR NOTIFICATIONS
      // }
    });
  }

  void initNotifications(BuildContext context, RemoteMessage message) async {
    try {
      var androidInitializationSettings =
          const AndroidInitializationSettings('@mipmap/ic_launcher');
      var darwinInitializationSettings = const DarwinInitializationSettings();

      var initializationSettings = InitializationSettings(
          android: androidInitializationSettings,
          iOS: darwinInitializationSettings);

      // print("initnotifications");

      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: (payload) {
        if (Platform.isAndroid) {
          handleMessage(context, message);
        } else if (Platform.isIOS) {
          handleMessage(context, message);
        }
      });
    } catch (e) {
      // print("Error in notifications $e");
    }
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
      return;
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  Future<void> showNotification(
      BuildContext context, RemoteMessage message) async {
    // print("show notifications");
    initNotifications(context, message);

    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "High Importance Notifications",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: "POS Getweys",
            importance: Importance.high,
            priority: Priority.high,
            ticker: "ticker");

    // FIXED: Improved iOS notification configuration with sound
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'default', // Added explicit default sound
      badgeNumber: 1,
      interruptionLevel: InterruptionLevel.active,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    String? title;
    String? body;

    if (Platform.isIOS &&
        message.data.containsKey('aps') &&
        message.data['aps'] is Map) {
      final aps = message.data['aps'] as Map;
      final alert = aps['alert'] ?? {};
      title = alert['title'] ?? message.notification?.title ?? '';
      body = alert['body'] ?? message.notification?.body ?? '';
    } else {
      title = message.notification?.title ?? '';
      body = message.notification?.body ?? '';
    }

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  void handleMessage(BuildContext context, RemoteMessage message) async {
    final data = message.data;

    // if (!data.containsKey('restaurantId')) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Notification data is invalid'),
    //       duration: Duration(seconds: 2),
    //     ),
    //   );
    //   return;
    // }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => UserRestaurantDetails(
    //       restaurantModel: restaurantModel,
    //       discountProvider: discountProvider,
    //     ),
    //   ),
    // );
  }

  Future<String> getDeviceToken() async {
    try {
      String? deviceToken = await messaging.getToken();
      if (kDebugMode) {
        print("deviceToken");
        print(deviceToken);
      }
      return deviceToken!;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(e.toString());
        print(stacktrace);
      }
      return '';
    }
  }
}
