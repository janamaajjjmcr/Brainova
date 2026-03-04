import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    print(
        'DEBUG: Initializing NotificationService for platform: $defaultTargetPlatform');
    final isAndroid =
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    final isDarwin = !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS);

    if (!isAndroid && !isDarwin) {
      print(
          'DEBUG: NotificationService init skipped - Platform $defaultTargetPlatform not natively supported by this plugin.');
      return;
    }

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    print('DEBUG: Calling _notifications.initialize...');
    await _notifications.initialize(settings);
    print('DEBUG: _notifications.initialize completed.');

    final androidImplementation =
        _notifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidImplementation != null) {
      print('DEBUG: Requesting Android notification permissions...');
      await androidImplementation.requestNotificationsPermission();
    }
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'brainova_channel',
      'Brainova Alerts',
      importance: Importance.high,
      priority: Priority.high,
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
    );

    print(
        'DEBUG: Attempting to show notification: $title - $body (Platform: $defaultTargetPlatform)');
    try {
      if (defaultTargetPlatform != TargetPlatform.android &&
          defaultTargetPlatform != TargetPlatform.iOS &&
          defaultTargetPlatform != TargetPlatform.macOS) {
        print(
            'DEBUG: Skipping notification - Platform $defaultTargetPlatform not supported.');
        return;
      }
      await _notifications.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000,
        title,
        body,
        details,
      );
      print('DEBUG: Notification command sent to plugin successfully.');
    } catch (e) {
      print('DEBUG: Error showing notification: $e');
    }
  }
}
