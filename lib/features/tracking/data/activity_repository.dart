import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'activity_model.dart';
import 'usage_stats_service.dart';

final activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  return ActivityRepository();
});

class ActivityRepository {
  final List<ActivityLogModel> _logs = [];
  final UsageStatsService _usageStats = UsageStatsService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _useRealData = false;

  ActivityRepository();

  // ------------------------------------------------------------
  // PERMISSION HANDLING
  // ------------------------------------------------------------

  Future<bool> checkRealDataAvailability() async {
    final hasPermission = await _usageStats.hasPermission();
    _useRealData = hasPermission;
    return hasPermission;
  }

  Future<void> openUsageSettings() async {
    await _usageStats.openUsageSettings();
  }

  // ------------------------------------------------------------
  // ADD MANUAL ACTIVITY (Mock)
  // ------------------------------------------------------------

  Future<void> addActivity(ActivityLogModel activity) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _logs.add(activity);
    debugPrint("Manual Activity Logged: ${activity.type.name}");
  }

  // ------------------------------------------------------------
  // GET RECENT ACTIVITIES
  // ------------------------------------------------------------

  Future<List<ActivityLogModel>> getRecentActivities(
    String uid, {
    int limit = 50,
  }) async {
    List<ActivityLogModel> allActivities = [];

    // Fetch real Android usage stats
    if (_useRealData) {
      try {
        final realActivities = await _getRealActivities(uid);
        allActivities.addAll(realActivities);
      } catch (e) {
        debugPrint("Real usage fetch error: $e");
      }
    }

    // Add mock activities
    allActivities.addAll(_logs.where((log) => log.uid == uid));

    // Sort newest first
    allActivities.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return allActivities.take(limit).toList();
  }

  // ------------------------------------------------------------
  // REAL USAGE DATA
  // ------------------------------------------------------------

  Future<List<ActivityLogModel>> _getRealActivities(String uid) async {
    final usageStats = await _usageStats.getLast24HoursUsage();

    return usageStats.map((stats) {
      return ActivityLogModel(
        id: stats.id,
        uid: uid,
        type: stats.type,
        timestamp: stats.timestamp,
        durationSeconds: stats.durationSeconds,
        impactScore: stats.impactScore,
        notes: stats.notes,
      );
    }).toList();
  }

  // ------------------------------------------------------------
  // BRAIN ROT CALCULATIONS
  // ------------------------------------------------------------

  Future<int> getTodayBrainRotImpact(String uid) async {
    final activities = await getRecentActivities(uid, limit: 100);

    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);

    int totalImpact = 0;

    for (var activity in activities) {
      if (activity.timestamp.isAfter(startOfDay)) {
        totalImpact += activity.impactScore;
      }
    }

    return totalImpact;
  }

  Future<List<ActivityLogModel>> getActivitiesByType(
    String uid,
    ActivityType type, {
    int limit = 50,
  }) async {
    final allActivities = await getRecentActivities(uid, limit: 100);

    return allActivities
        .where((activity) => activity.type == type)
        .take(limit)
        .toList();
  }
  // ------------------------------------------------------------
// GET ACTIVITIES IN TIME RANGE (Rolling 24h Support)
// ------------------------------------------------------------

  Future<List<ActivityLogModel>> getActivitiesInRange(
    String uid,
    DateTime start,
    DateTime end,
  ) async {
    List<ActivityLogModel> allActivities = [];

    // 1. Fetch from Firestore
    try {
      // Fetch only by UID to avoid composite index error (uid == X && timestamp >= Y)
      final snapshot = await _firestore
          .collection('activities')
          .where('uid', isEqualTo: uid)
          .get();

      final filtered = snapshot.docs
          .map((doc) => ActivityLogModel.fromMap(doc.data(), doc.id))
          .where((activity) =>
              activity.timestamp.isAfter(start) &&
              activity.timestamp.isBefore(end))
          .toList();

      allActivities.addAll(filtered);
    } catch (e) {
      debugPrint("Firestore fetch error: $e");
    }

    // 2. Real usage (already limited to 24h from UsageStats)
    if (_useRealData) {
      try {
        final realActivities = await _getRealActivities(uid);
        allActivities.addAll(realActivities);
      } catch (e) {
        debugPrint("Real usage fetch error: $e");
      }
    }

    // 3. Manual mock activities (for testing)
    allActivities.addAll(_logs.where((log) => log.uid == uid));

    // Filter by time range (doubly sure)
    final filtered = allActivities.where((activity) {
      return activity.timestamp.isAfter(start) &&
          activity.timestamp.isBefore(end);
    }).toList();

    // Sort newest first
    filtered.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return filtered;
  }

  // ------------------------------------------------------------
  // WEEKLY BREAKDOWN (Pie Chart Support)
  // ------------------------------------------------------------

  Future<Map<ActivityType, double>> getWeeklyBreakdown(String uid) async {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 7));

    final activities = await getActivitiesInRange(uid, sevenDaysAgo, now);

    double totalMinutes = 0;
    final Map<ActivityType, double> categoryMinutes = {
      ActivityType.learning: 0,
      ActivityType.entertainment: 0,
      ActivityType.junk: 0,
      ActivityType.news: 0,
      ActivityType.social: 0,
    };

    for (final activity in activities) {
      if (categoryMinutes.containsKey(activity.type)) {
        final minutes = activity.durationSeconds / 60;
        categoryMinutes[activity.type] =
            (categoryMinutes[activity.type] ?? 0) + minutes;
        totalMinutes += minutes;
      }
    }

    if (totalMinutes == 0) return {};

    // Convert to percentages (0.0 to 1.0)
    return categoryMinutes.map((type, minutes) {
      return MapEntry(type, minutes / totalMinutes);
    });
  }

  Future<void> logActivity({
    required String uid,
    required ActivityType type,
    required int durationSeconds,
    required int impactScore,
    String? notes,
    Map<String, dynamic>? metadata,
  }) async {
    final now = DateTime.now();

    final activity = ActivityLogModel(
      id: now.millisecondsSinceEpoch.toString(),
      uid: uid,
      type: type,
      timestamp: now,
      durationSeconds: durationSeconds,
      impactScore: impactScore,
      notes: notes,
      metadata: metadata,
    );

    // 1. Add to Firestore
    try {
      await _firestore.collection('activities').add(activity.toMap());
      debugPrint("Activity logged to Firestore: ${type.name}");
    } catch (e) {
      debugPrint("Firestore log error: $e");
    }

    // 2. Add to local cache for immediate UI updates
    _logs.add(activity);
  }

  // ------------------------------------------------------------
  // TESTING HELPERS
  // ------------------------------------------------------------

  void clearMockData() {
    _logs.clear();
  }

  void setUseRealData(bool value) {
    _useRealData = value;
  }
}
