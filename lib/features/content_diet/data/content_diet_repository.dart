import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'content_diet_model.dart';
import '../../auth/data/auth_repository.dart';
import '../../tracking/data/activity_repository.dart';
import '../../tracking/data/activity_model.dart';

final contentDietRepositoryProvider = Provider<ContentDietRepository>((ref) {
  return ContentDietRepository(
    ref.read(activityRepositoryProvider),
    FirebaseFirestore.instance,
  );
});

final recentDietEntriesProvider =
    FutureProvider.autoDispose<List<ContentDietEntry>>((ref) async {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) return [];
  return ref.watch(contentDietRepositoryProvider).getRecentEntries(user.uid);
});

class ContentDietRepository {
  final ActivityRepository _activityRepo;
  final FirebaseFirestore _firestore;

  ContentDietRepository(this._activityRepo, this._firestore);

  Future<void> addEntry(ContentDietEntry entry) async {
    // Log as activity for persistence and score calculation
    await _activityRepo.logActivity(
      uid: entry.uid,
      type: _mapCategoryToActivityType(entry.category),
      durationSeconds: entry.minutes * 60,
      impactScore: _calculateImpactScore(entry.category, entry.minutes),
      notes: entry.notes,
    );

    // 2. Increment global diet count in UserModel
    try {
      await _firestore.collection('users').doc(entry.uid).update({
        'contentDietCount': FieldValue.increment(1),
      });
      debugPrint("Content Diet count incremented in Firestore");
    } catch (e) {
      debugPrint("Error incrementing contentDietCount: $e");
    }
  }

  Future<List<ContentDietEntry>> getRecentEntries(String uid) async {
    final snapshot = await _firestore
        .collection('activities')
        .where('uid', isEqualTo: uid)
        .limit(40) // Fetch more to allow in-memory filtering/sorting
        .get();

    final entries = snapshot.docs.map((doc) {
      final data = doc.data();
      final typeStr = data['type'] as String;
      final type = ActivityType.values.firstWhere((e) => e.name == typeStr,
          orElse: () => ActivityType.junk);

      final timestampStr = data['timestamp'] as String?;

      return ContentDietEntry(
        id: doc.id,
        uid: uid,
        date: timestampStr != null
            ? DateTime.tryParse(timestampStr) ?? DateTime.now()
            : DateTime.now(),
        category: _mapActivityTypeToCategory(type),
        minutes: (data['durationSeconds'] as int) ~/ 60,
        notes: data['notes'],
      );
    }).toList();

    // Sort in memory to avoid index error
    entries.sort((a, b) => b.date.compareTo(a.date));
    return entries.take(20).toList();
  }

  ActivityType _mapCategoryToActivityType(DietCategory cat) {
    switch (cat) {
      case DietCategory.learning:
        return ActivityType.learning;
      case DietCategory.entertainment:
        return ActivityType.entertainment;
      case DietCategory.news:
        return ActivityType.news;
      case DietCategory.social:
        return ActivityType.social;
      case DietCategory.junk:
        return ActivityType.junk;
    }
  }

  DietCategory _mapActivityTypeToCategory(ActivityType type) {
    switch (type) {
      case ActivityType.learning:
      case ActivityType.rewire:
      case ActivityType.mindReset:
        return DietCategory.learning;
      case ActivityType.entertainment:
        return DietCategory.entertainment;
      case ActivityType.news:
        return DietCategory.news;
      case ActivityType.social:
        return DietCategory.social;
      case ActivityType.junk:
        return DietCategory.junk;
      default:
        return DietCategory.junk;
    }
  }

  int _calculateImpactScore(DietCategory type, int minutes) {
    switch (type) {
      case DietCategory.social:
        return (minutes * 2.0).round();
      case DietCategory.junk:
        return (minutes * 2.2).round();
      case DietCategory.news:
        return (minutes * 0.8).round();
      case DietCategory.entertainment:
        return (minutes * 1.5).round();
      case DietCategory.learning:
        return -(minutes * 0.5).round();
    }
  }
}
