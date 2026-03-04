import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter/services.dart';
import 'activity_model.dart';

/// Android UsageStatsManager constants
const int INTERVAL_DAILY = 0;
const int INTERVAL_WEEKLY = 1;
const int INTERVAL_MONTHLY = 2;
const int INTERVAL_YEARLY = 3;
const int INTERVAL_BEST = 4;

class UsageStatsService {
  static const MethodChannel _channel = MethodChannel('brainova/usage_stats');

  // Singleton
  static final UsageStatsService _instance = UsageStatsService._internal();

  factory UsageStatsService() => _instance;

  UsageStatsService._internal();

  bool get _isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  // ------------------------------------------------------------
  // PERMISSION HANDLING
  // ------------------------------------------------------------

  /// Check if Usage Access permission is granted
  Future<bool> hasPermission() async {
    if (!_isAndroid) return false;
    try {
      final bool result = await _channel.invokeMethod('checkPermission');
      return result;
    } on PlatformException {
      return false;
    }
  }

  /// Open Android Usage Access settings screen
  Future<void> openUsageSettings() async {
    if (!_isAndroid) return;
    try {
      await _channel.invokeMethod('openUsageSettings');
    } on PlatformException catch (e) {
      print("Error opening usage settings: ${e.message}");
    }
  }

  // ------------------------------------------------------------
  // QUERY USAGE STATS
  // ------------------------------------------------------------

  /// Get usage for last 24 hours (Rolling Window)
  Future<List<ActivityLogModel>> getLast24HoursUsage() async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(hours: 24));

    return queryUsageStats(
      startTime: start.millisecondsSinceEpoch,
      endTime: now.millisecondsSinceEpoch,
      interval: INTERVAL_DAILY,
    );
  }

  /// Query usage stats for custom time range
  Future<List<ActivityLogModel>> queryUsageStats({
    required int startTime,
    required int endTime,
    int interval = INTERVAL_DAILY,
  }) async {
    if (!_isAndroid) return [];

    final permissionGranted = await hasPermission();
    if (!permissionGranted) {
      return []; // Don't throw exception, just return empty list on non-Android
    }

    try {
      final List<dynamic> result = await _channel.invokeMethod(
        'queryUsageStats',
        {'startTime': startTime, 'endTime': endTime, 'interval': interval},
      );

      return result
          .map(
            (json) => ActivityLogModel.fromUsageStats(
              Map<String, dynamic>.from(json),
              'current_user', // Replace with auth UID later
            ),
          )
          .toList();
    } on PlatformException catch (e) {
      print('Failed to query usage stats: ${e.message}');
      return [];
    }
  }
}
