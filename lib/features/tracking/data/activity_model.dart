import 'package:cloud_firestore/cloud_firestore.dart';

enum ActivityType {
  social, // formerly scrolling
  entertainment, // passive content
  neutral, // browsers, tools
  learning, // productive apps
  junk, // games, addictive apps
  news, // news apps
  mindReset,
  rewire,
}

class ActivityLogModel {
  final String id;
  final String uid;
  final ActivityType type;
  final DateTime timestamp;
  final int durationSeconds;
  final int impactScore; // The calculated +/- change to brain rot
  final String? notes;
  final Map<String, dynamic>? metadata; // Add this for app tracking

  ActivityLogModel({
    required this.id,
    required this.uid,
    required this.type,
    required this.timestamp,
    required this.durationSeconds,
    required this.impactScore,
    this.notes,
    this.metadata,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'type': type.name,
      'timestamp': timestamp.toIso8601String(),
      'durationSeconds': durationSeconds,
      'impactScore': impactScore,
      'notes': notes,
      'metadata': metadata,
    };
  }

  factory ActivityLogModel.fromMap(Map<String, dynamic> data, String id) {
    DateTime parseTimestamp(dynamic ts) {
      if (ts is Timestamp) return ts.toDate();
      if (ts is String) return DateTime.tryParse(ts) ?? DateTime.now();
      return DateTime.now();
    }

    return ActivityLogModel(
      id: id,
      uid: data['uid'] ?? '',
      type: ActivityType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => ActivityType.social,
      ),
      timestamp: parseTimestamp(data['timestamp']),
      durationSeconds: data['durationSeconds'] ?? 0,
      impactScore: data['impactScore'] ?? 0,
      notes: data['notes'],
      metadata: data['metadata'] != null
          ? Map<String, dynamic>.from(data['metadata'])
          : null,
    );
  }

  // Parse from JSON (for usage stats)
  static ActivityLogModel fromUsageStats(
      Map<String, dynamic> json, String uid) {
    final packageName = json['packageName'] as String;
    final totalTimeInForeground = json['totalTimeInForeground'] as int;
    final now = DateTime.now();

    // Determine activity type based on package name
    final activityType = _getActivityType(packageName);
    final impactScore = _calculateImpact(activityType, totalTimeInForeground);

    return ActivityLogModel(
      id: 'usage_${now.millisecondsSinceEpoch}_$packageName',
      uid: uid,
      type: activityType,
      timestamp: now,
      durationSeconds:
          (totalTimeInForeground / 1000).round(), // Convert ms to seconds
      impactScore: impactScore,
      notes: 'Auto-tracked from $packageName',
      metadata: {
        'packageName': packageName,
        'launchCount': json['launchCount'] ?? 1,
        'appName': _getAppName(packageName),
      },
    );
  }

  // Determine activity type from package name
  static ActivityType _getActivityType(String packageName) {
    if (packageName.contains('instagram') ||
        packageName.contains('facebook') ||
        packageName.contains('twitter') ||
        packageName.contains('snapchat') ||
        packageName.contains('tiktok') ||
        packageName.contains('reddit')) {
      return ActivityType.social; // Social media = scrolling (bad)
    }

    if (packageName.contains('youtube') ||
        packageName.contains('netflix') ||
        packageName.contains('spotify') ||
        packageName.contains('twitch')) {
      return ActivityType.entertainment; // Entertainment
    }

    if (packageName.contains('chrome') ||
        packageName.contains('browser') ||
        packageName.contains('firefox') ||
        packageName.contains('edge') ||
        packageName.contains('whatsapp')) {
      return ActivityType.neutral; // neutral
    }

    if (packageName.contains('gmail') ||
        packageName.contains('outlook') ||
        packageName.contains('notes') ||
        packageName.contains('docs') ||
        packageName.contains('office') ||
        packageName.contains('word') ||
        packageName.contains('excel') ||
        packageName.contains('blackboard')) {
      return ActivityType.learning; // Productive apps = learning
    }

    if (packageName.contains('game') ||
        packageName.contains('com.rovio') ||
        packageName.contains('com.king') ||
        packageName.contains('com.zynga')) {
      return ActivityType.junk; // Games = junk (bad)
    }

    return ActivityType.neutral; // Default to neutral
  }

  // Get friendly app name from package name
  static String _getAppName(String packageName) {
    final parts = packageName.split('.');
    return parts.last;
  }

  // Calculate impact score based on activity type and duration
  static int _calculateImpact(ActivityType type, int durationMs) {
    final minutes = durationMs / 1000 / 60;

    switch (type) {
      case ActivityType.social:
        return (minutes * 2).round();

      case ActivityType.junk:
        return (minutes * 1.5).round();

      case ActivityType.news:
        return (minutes * 0.8).round();

      case ActivityType.entertainment:
        return (minutes * 1.0).round();

      case ActivityType.neutral:
        return (minutes * 0.5).round();

      case ActivityType.learning:
        return -(minutes * 0.5).round();

      case ActivityType.mindReset:
        return -15;

      case ActivityType.rewire:
        return -5;
    }
  }

  // Demo factory constructors
  factory ActivityLogModel.demoScrolling() {
    return ActivityLogModel(
      id: 'demo_1',
      uid: 'user_123',
      type: ActivityType.social,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      durationSeconds: 1800,
      impactScore: 15,
      notes: 'Scrolled through Instagram',
      metadata: {
        'appName': 'Instagram',
        'packageName': 'com.instagram.android'
      },
    );
  }

  factory ActivityLogModel.demoMindReset() {
    return ActivityLogModel(
      id: 'demo_2',
      uid: 'user_123',
      type: ActivityType.mindReset,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      durationSeconds: 120,
      impactScore: -5,
      notes: 'Breathing exercise',
      metadata: {'activity': 'Deep Breathing'},
    );
  }
}
