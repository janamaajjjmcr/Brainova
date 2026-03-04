import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../tracking/domain/brain_rot_service.dart';
import '../../tracking/data/activity_repository.dart';
import 'reality_check_result.dart';
import '../../tracking/data/activity_model.dart';
import '../../../core/service/notification_service.dart';

final realityCheckServiceProvider = Provider<RealityCheckService>((ref) {
  return RealityCheckService(
    ref.read(brainRotServiceProvider),
    ref.read(activityRepositoryProvider),
  );
});
final realityCheckProvider = FutureProvider.family<RealityCheckResult, String>((
  ref,
  uid,
) async {
  final service = ref.read(realityCheckServiceProvider);
  return service.runRealityCheck(uid);
});

final weeklyBreakdownProvider =
    FutureProvider.family<Map<ActivityType, double>, String>((ref, uid) async {
  return ref.read(activityRepositoryProvider).getWeeklyBreakdown(uid);
});

final recentLogsProvider =
    FutureProvider.family<List<ActivityLogModel>, String>((ref, uid) async {
  return ref.read(activityRepositoryProvider).getRecentActivities(uid);
});

class RealityCheckService {
  final BrainRotService _brainRotService;
  final ActivityRepository _activityRepo;
  static String? _lastNotificationStatus;

  RealityCheckService(this._brainRotService, this._activityRepo);

  Future<RealityCheckResult> runRealityCheck(String uid) async {
    final now = DateTime.now();
    final start = now.subtract(const Duration(hours: 24));

    final activities = await _activityRepo.getActivitiesInRange(
      uid,
      start,
      now,
    );

    final score = await _brainRotService.calculateRollingScore(uid);
    print('DEBUG: Reality Check Score calculated: $score');
    double totalMinutes = 0;
    double social = 0;
    double junk = 0;
    double learning = 0;
    double entertainment = 0;
    double neutral = 0;
    double news = 0;

    for (final activity in activities) {
      final minutes = (activity.durationSeconds) / 60;
      totalMinutes += minutes;

      switch (activity.type) {
        case ActivityType.social:
          social += minutes;
          break;
        case ActivityType.junk:
          junk += minutes;
          break;
        case ActivityType.learning:
          learning += minutes;
          break;
        case ActivityType.entertainment:
          entertainment += minutes;
          break;
        case ActivityType.neutral:
          neutral += minutes;
          break;
        case ActivityType.news:
          news += minutes;
          break;
        case ActivityType.mindReset:
          break;
        case ActivityType.rewire:
          learning += minutes;
          break;
      }
    }

    if (totalMinutes == 0) {
      return RealityCheckResult(
        brainRotScore: score,
        categoryPercentages: {},
        status: "Healthy",
        message: "No significant activity detected.",
        shouldSuggestReset: false,
      );
    }

    double round(double value) => double.parse(value.toStringAsFixed(1));

    final breakdown = {
      "social": round((social / totalMinutes) * 100),
      "junk": round((junk / totalMinutes) * 100),
      "learning": round((learning / totalMinutes) * 100),
      "entertainment": round((entertainment / totalMinutes) * 100),
      "neutral": round((neutral / totalMinutes) * 100),
      "news": round((news / totalMinutes) * 100),
    };

    String status;
    String message;
    bool suggestReset = false;

    if (score >= 80) {
      status = "Danger";
      message =
          "High stimulation detected. Your digital habits may be affecting focus.";
      suggestReset = true;

      if (_lastNotificationStatus != "Danger") {
        print(
            'DEBUG: RealityCheckService triggering DANGER notification (Score: $score)');
        _lastNotificationStatus = "Danger";
        await NotificationService().showNotification(
          title: "Brain Rot: Danger",
          body: "Stop scrolling and reset. Your score is $score.",
        );
      }
    } else if (score >= 60) {
      status = "Caution";
      message = "You are leaning toward heavy stimulation. Consider a reset.";
      suggestReset = true;

      if (_lastNotificationStatus != "Caution") {
        print(
            'DEBUG: RealityCheckService triggering CAUTION notification (Score: $score)');
        _lastNotificationStatus = "Caution";
        await NotificationService().showNotification(
          title: "Brain Rot: Caution",
          body: "Your Brain Rot Meter hit $score.",
        );
      }
    } else {
      status = "Healthy";
      message = "Your digital balance looks stable. Keep it up.";
      if (_lastNotificationStatus != null) {
        print(
            'DEBUG: RealityCheckService resetting notification status from $_lastNotificationStatus to Healthy');
        _lastNotificationStatus = null;
      }
    }

    return RealityCheckResult(
      brainRotScore: score,
      categoryPercentages: breakdown,
      status: status,
      message: message,
      shouldSuggestReset: suggestReset,
    );
  }
}
