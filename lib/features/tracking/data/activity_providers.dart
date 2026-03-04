import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'activity_repository.dart';
import 'activity_model.dart';
import '../domain/brain_rot_service.dart';

// ---------------------------
// Last 24h Activities
// ---------------------------

final last24hActivitiesProvider =
    FutureProvider<List<ActivityLogModel>>((ref) async {
  final repo = ref.read(activityRepositoryProvider);
  final uid = 'current_user';

  final now = DateTime.now();
  final start = now.subtract(const Duration(hours: 24));

  return repo.getActivitiesInRange(uid, start, now);
});

// ---------------------------
// Brain Rot Level (Rolling 24h)
// ---------------------------

final brainRotLevelProvider =
    FutureProvider<int>((ref) async {
  final service = ref.read(brainRotServiceProvider);
  final uid = 'current_user';

  return service.calculateRollingScore(uid);
});

// ---------------------------
// Social Activities
// ---------------------------

final socialActivitiesProvider =
    FutureProvider<List<ActivityLogModel>>((ref) async {
  final repo = ref.read(activityRepositoryProvider);
  final uid = 'current_user';

  return repo.getActivitiesByType(uid, ActivityType.social);
});

// ---------------------------
// Learning Activities
// ---------------------------

final learningActivitiesProvider =
    FutureProvider<List<ActivityLogModel>>((ref) async {
  final repo = ref.read(activityRepositoryProvider);
  final uid = 'current_user';

  return repo.getActivitiesByType(uid, ActivityType.learning);
});

// ---------------------------
// Real Data Permission
// ---------------------------

final realDataAvailableProvider =
    FutureProvider<bool>((ref) async {
  final repo = ref.read(activityRepositoryProvider);
  return repo.checkRealDataAvailability();
});