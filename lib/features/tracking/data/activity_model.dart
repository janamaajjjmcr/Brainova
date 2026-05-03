import 'package:cloud_firestore/cloud_firestore.dart';

enum ActivityType {
  social,
  entertainment,
  neutral,
  learning,
  junk,
  mindReset,
  rewire,
}

class ActivityLogModel {
  final String id;
  final String uid;
  final ActivityType type;
  final DateTime timestamp;
  final int durationSeconds;
  final int impactScore;
  final String? notes;
  final Map<String, dynamic>? metadata;

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
      'timestamp': Timestamp.fromDate(timestamp),
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
  static ActivityLogModel fromUsageStats(Map<String, dynamic> json, String uid,
      {DateTime? timestamp}) {
    final packageName = json['packageName'] as String;
    final totalTimeInForeground = json['totalTimeInForeground'] as int;
    final now = timestamp ?? DateTime.now();
    final activityType = _getActivityType(packageName);
    final impactScore = _calculateImpact(activityType, totalTimeInForeground);

    return ActivityLogModel(
      id: 'usage_${now.millisecondsSinceEpoch}_$packageName',
      uid: uid,
      type: activityType,
      timestamp: now,
      durationSeconds:
          (totalTimeInForeground / 1000).round(),
      impactScore: impactScore,
      notes: 'Auto-tracked from $packageName',
      metadata: {
        'packageName': packageName,
        'launchCount': json['launchCount'] ?? 1,
        'appName': _getAppName(packageName),
      },
    );
  }
  static ActivityType _getActivityType(String packageName) {
    final pkg = packageName.toLowerCase();

    if (pkg.contains('youtube') ||
        pkg.contains('netflix') ||
        pkg.contains('disney') ||
        pkg.contains('primevideo') ||
        pkg.contains('hulu') ||
        pkg.contains('twitch')) {
      return ActivityType.entertainment;
    }

    if (pkg.contains('instagram') ||
        pkg.contains('facebook') ||
        pkg.contains('twitter') ||
        pkg.contains('x.android') ||
        pkg.contains('tiktok') ||
        pkg.contains('snapchat') ||
        pkg.contains('reddit') ||
        pkg.contains('telegram') ||
        pkg.contains('whatsapp')) {
      return ActivityType.social;
    }

    if (pkg.contains('chrome') ||
        pkg.contains('browser') ||
        pkg.contains('firefox') ||
        pkg.contains('edge') ||
        pkg.contains('safari')) {
      return ActivityType.neutral;
    }

    if (pkg.contains('gmail') ||
        pkg.contains('outlook') ||
        pkg.contains('notion') ||
        pkg.contains('trello') ||
        pkg.contains('slack') ||
        pkg.contains('asana') ||
        pkg.contains('zoom') ||
        pkg.contains('teams') ||
        pkg.contains('classroom') ||
        pkg.contains('notability') ||
        pkg.contains('duolingo') ||
        pkg.contains('anki') ||
        pkg.contains('coursera') ||
        pkg.contains('udemy') ||
        pkg.contains('khanacademy') ||
        pkg.contains('ted') ||
        pkg.contains('medium') ||
        pkg.contains('linkedin.learning') ||
        pkg.contains('calculator') ||
        pkg.contains('calendar')) {
      return ActivityType.learning;
    }

    if (pkg.contains('game') ||
        pkg.contains('pubg') ||
        pkg.contains('freefire') ||
        pkg.contains('roblox') ||
        pkg.contains('unity') ||
        pkg.contains('clash') ||
        pkg.contains('candy') ||
        pkg.contains('supercell') ||
        pkg.contains('epicgames') ||
        pkg.contains('ea.') ||
        pkg.contains('gameloft') ||
        pkg.contains('mojang') ||
        pkg.contains('tencent') ||
        pkg.contains('nintendo')) {
      return ActivityType.junk;
    }

    return ActivityType.neutral;
  }
  static String _getAppName(String packageName) {
    final parts = packageName.split('.');
    return parts.last;
  }
  static int _calculateImpact(ActivityType type, int durationMs) {
    final minutes = durationMs / 1000 / 60;

    switch (type) {
      case ActivityType.social:
        return (minutes * 2).round();

      case ActivityType.junk:
        return (minutes * 1.5).round();

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
