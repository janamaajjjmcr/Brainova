import 'package:cloud_firestore/cloud_firestore.dart';

enum BadgeConditionType {
  streak,
  tasksCompleted,
  firstLogin,
  consistency7Days,
  consistency30Days,
  profileComplete,
  dietLog,
  custom,
}

class BadgeModel {
  final String id;
  final String title;
  final String description;
  final String iconName; // Name of the icon to be used with a helper
  final BadgeConditionType conditionType;
  final int conditionValue;
  final String unitLabel; // e.g., 'days', 'sessions', 'tasks'
  final bool isUnlocked;
  final DateTime? unlockedAt;

  BadgeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconName,
    required this.conditionType,
    required this.conditionValue,
    required this.unitLabel,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  factory BadgeModel.fromFirestore(Map<String, dynamic> data, String id,
      {Map<String, dynamic>? userBadgeData}) {
    bool unlocked = false;
    DateTime? unlockedAtDate;

    if (userBadgeData != null) {
      unlocked = userBadgeData['isUnlocked'] ?? false;
      if (userBadgeData['unlockedAt'] != null) {
        unlockedAtDate = (userBadgeData['unlockedAt'] as Timestamp).toDate();
      }
    }

    return BadgeModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconName: data['iconName'] ?? 'medal',
      conditionType: BadgeConditionType.values.firstWhere(
        (e) => e.name == data['conditionType'],
        orElse: () => BadgeConditionType.custom,
      ),
      conditionValue: data['conditionValue'] ?? 0,
      unitLabel: data['unitLabel'] ?? 'days',
      isUnlocked: unlocked,
      unlockedAt: unlockedAtDate,
    );
  }

  Map<String, dynamic> toUserBadgeMap() {
    return {
      'isUnlocked': isUnlocked,
      'unlockedAt': unlockedAt != null
          ? Timestamp.fromDate(unlockedAt!)
          : FieldValue.serverTimestamp(),
    };
  }

  BadgeModel copyWith({
    bool? isUnlocked,
    DateTime? unlockedAt,
  }) {
    return BadgeModel(
      id: id,
      title: title,
      description: description,
      iconName: iconName,
      conditionType: conditionType,
      conditionValue: conditionValue,
      unitLabel: unitLabel,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }
}
