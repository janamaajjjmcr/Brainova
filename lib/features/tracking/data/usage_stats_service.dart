import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter/services.dart';
import 'activity_model.dart';

const int INTERVAL_DAILY = 0;
const int INTERVAL_WEEKLY = 1;
const int INTERVAL_MONTHLY = 2;
const int INTERVAL_YEARLY = 3;
const int INTERVAL_BEST = 4;

class UsageStatsService {
  static const MethodChannel _channel = MethodChannel('brainova/usage_stats');
  static final UsageStatsService _instance = UsageStatsService._internal();

  factory UsageStatsService() => _instance;

  UsageStatsService._internal();

  bool get _isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  Future<bool> hasPermission() async {
    if (!_isAndroid) return false;
    try {
      final bool result = await _channel.invokeMethod('checkPermission');
      return result;
    } on PlatformException {
      return false;
    }
  }

  Future<void> openUsageSettings() async {
    if (!_isAndroid) return;
    try {
      await _channel.invokeMethod('openUsageSettings');
    } on PlatformException catch (e) {
      print("Error opening usage settings: ${e.message}");
    }
  }

  Future<List<ActivityLogModel>> getLast24HoursUsage(String uid,
      {DateTime? startTime, DateTime? endTime}) async {
    final now = endTime ?? DateTime.now();
    final start = startTime ?? DateTime(now.year, now.month, now.day);

    return queryUsageStats(
      startTime: start.millisecondsSinceEpoch,
      endTime: now.millisecondsSinceEpoch,
      uid: uid,
    );
  }

  Future<List<ActivityLogModel>> queryUsageStats({
    required int startTime,
    required int endTime,
    required String uid,
  }) async {
    if (!_isAndroid) return [];

    final permissionGranted = await hasPermission();
    if (!permissionGranted) {
      return [];
    }

    try {
      final List<dynamic> result = await _channel.invokeMethod(
        'queryUsageStats',
        {'startTime': startTime, 'endTime': endTime},
      );

      return result
          .map(
            (json) => ActivityLogModel.fromUsageStats(
              Map<String, dynamic>.from(json),
              uid,
              timestamp: DateTime.fromMillisecondsSinceEpoch(endTime),
            ),
          )
          .toList();
    } on PlatformException catch (e) {
      print('Failed to query usage stats: ${e.message}');
      return [];
    }
  }
}
