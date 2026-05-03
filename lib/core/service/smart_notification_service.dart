import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'notification_service.dart';

final smartNotificationServiceProvider =
    Provider<SmartNotificationService>((ref) {
  return SmartNotificationService(NotificationService());
});

class SmartNotificationService {
  final NotificationService _notificationService;

  SmartNotificationService(this._notificationService);

  Future<void> sendBrainRotWarning(int score) async {
    String title = "⚠️ Brain Rot Alert";
    String body =
        "You've been scrolling for too long. Your score is $score. Take a break!";

    if (score >= 80) {
      title = "🚨 High Brain Rot!";
      body =
          "Critical stimulation levels! Stop scrolling immediately and reset.";
    }

    await _notificationService.showNotification(
      title: title,
      body: body,
    );
  }

  Future<void> sendPositiveReinforcement(
      int previousScore, int currentScore) async {
    if (currentScore < previousScore) {
      await _notificationService.showNotification(
        title: "🧠 Focus Improving!",
        body: "Nice! You're improving your focus today. Keep it up!",
      );
    }
  }

  Future<void> sendStreakNotification(int streakDays) async {
    await _notificationService.showNotification(
      title: "🔥 Productivity Streak!",
      body: "You're on a $streakDays-day streak! Don't break it now.",
    );
  }

  Future<void> sendMotivationalFeedback() async {
    await _notificationService.showNotification(
      title: "🚀 Stay Focused",
      body: "Remember your goals. Small habits lead to big changes.",
    );
  }

  Future<void> sendAppUsageWarning(String appName) async {
    await _notificationService.showNotification(
      title: "📱 App Limit",
      body:
          "You've spent a lot of time on $appName. Consider switching to something productive.",
    );
  }
}
