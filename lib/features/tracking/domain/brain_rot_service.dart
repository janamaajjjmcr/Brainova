import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/data/auth_repository.dart';
import '../data/activity_repository.dart';
import '../data/activity_model.dart';

final brainRotServiceProvider = Provider<BrainRotService>((ref) {
  return BrainRotService(
    ref.read(activityRepositoryProvider),
    ref.read(authRepositoryProvider),
  );
});

final brainRotLevelProvider = FutureProvider<int>((ref) async {
  final auth = ref.watch(authRepositoryProvider);
  final user = auth.currentUser;
  if (user == null) return 0;

  final service = ref.read(brainRotServiceProvider);
  return await service.calculateRollingScore(user.uid);
});

class BrainRotService {
  final ActivityRepository _activityRepo;
  final AuthRepository _authRepo;

  BrainRotService(this._activityRepo, this._authRepo);

  // ===== WEIGHTS =====
  static const double socialWeight = 2.0;
  static const double entertainmentWeight = 1.5;
  static const double neutralWeight = 1.0;
  static const double learningWeight = 0.3;
  static const double newsWeight = 0.8;

  static const double normalizationConstant = 600.0;

  // ===== ROLLING 24H SCORE =====
  Future<int> calculateRollingScore(String uid) async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(hours: 24));

    final activities =
        await _activityRepo.getActivitiesInRange(uid, start, now);

    double rawImpact = 0;

    for (final activity in activities) {
      final minutes = activity.durationSeconds / 60;

      switch (activity.type) {
        case ActivityType.social:
          rawImpact += minutes * socialWeight;
          break;

        case ActivityType.entertainment:
          rawImpact += minutes * entertainmentWeight;
          break;

        case ActivityType.neutral:
          rawImpact += minutes * neutralWeight;
          break;

        case ActivityType.learning:
          rawImpact += minutes * learningWeight;
          break;

        case ActivityType.news:
          rawImpact += minutes * newsWeight;
          break;

        case ActivityType.mindReset:
          rawImpact -= 20; // strong recovery
          break;

        case ActivityType.rewire:
          rawImpact -= 10; // moderate recovery
          break;

        case ActivityType.junk:
          rawImpact += minutes * 2.2; // strongest negative
          break;
      }
    }

    double score = (rawImpact / normalizationConstant) * 100;

    if (score < 0) score = 0;
    if (score > 100) score = 100;

    return score.round();
  }

  // ===== CATEGORY BREAKDOWN =====
  Future<Map<String, double>> getCategoryBreakdown(String uid) async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(hours: 24));

    final activities =
        await _activityRepo.getActivitiesInRange(uid, start, now);

    double totalMinutes = 0;
    double social = 0;
    double entertainment = 0;
    double neutral = 0;
    double learning = 0;
    double junk = 0;
    double news = 0;

    for (final activity in activities) {
      final minutes = activity.durationSeconds / 60;
      totalMinutes += minutes;

      switch (activity.type) {
        case ActivityType.social:
          social += minutes;
          break;

        case ActivityType.entertainment:
          entertainment += minutes;
          break;

        case ActivityType.neutral:
          neutral += minutes;
          break;

        case ActivityType.learning:
          learning += minutes;
          break;

        case ActivityType.junk:
          junk += minutes;
          break;

        case ActivityType.news:
          news += minutes;
          break;

        default:
          break;
      }
    }

    if (totalMinutes == 0) {
      return {
        'social': 0,
        'entertainment': 0,
        'neutral': 0,
        'learning': 0,
        'junk': 0,
        'news': 0,
      };
    }

    double round(double value) => double.parse(value.toStringAsFixed(1));

    return {
      'social': round((social / totalMinutes) * 100),
      'entertainment': round((entertainment / totalMinutes) * 100),
      'neutral': round((neutral / totalMinutes) * 100),
      'learning': round((learning / totalMinutes) * 100),
      'junk': round((junk / totalMinutes) * 100),
      'news': round((news / totalMinutes) * 100),
    };
  }

  // ===== COMPLETE REWIRE =====
  Future<void> completeRewire(String taskTitle, {int points = 10}) async {
    final user = _authRepo.currentUser;
    if (user == null) return;

    // Log through repository (handles both local and Firestore activities collection)
    await _activityRepo.logActivity(
      uid: user.uid,
      type: ActivityType.rewire,
      durationSeconds: 60,
      impactScore: -points, // Negative for recovery
      notes: taskTitle,
    );
  }

  // ===== COMPLETE MIND RESET =====
  Future<void> completeMindReset(String activityTitle,
      {int points = 20, int durationSeconds = 60}) async {
    final user = _authRepo.currentUser;
    if (user == null) return;

    // Log through repository (handles both local and Firestore activities collection)
    await _activityRepo.logActivity(
      uid: user.uid,
      type: ActivityType.mindReset,
      durationSeconds: durationSeconds,
      impactScore: -points, // Negative for recovery
      notes: activityTitle,
    );
  }
}
