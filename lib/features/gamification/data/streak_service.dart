import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/data/user_repository.dart';

final streakServiceProvider = Provider<StreakService>((ref) {
  return StreakService(ref.read(userRepositoryProvider));
});

class StreakService {
  final UserRepository _userRepo;

  StreakService(this._userRepo);

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Future<void> completeDailyTask(String uid) async {
    final user = await _userRepo.getUser(uid);
    if (user == null) return;

    final now = DateTime.now();
    final today = _normalizeDate(now);

    final lastActiveValue = user.lastActiveDate;
    final lastActiveDate =
        lastActiveValue != null ? _normalizeDate(lastActiveValue) : null;

    int newStreak = user.currentStreak;
    int newLongestStreak = user.longestStreak;

    if (lastActiveDate == null) {
      newStreak = 1;
    } else if (lastActiveDate == today) {
      return;
    } else if (lastActiveDate == today.subtract(const Duration(days: 1))) {
      newStreak += 1;
    } else {
      newStreak = 1;
    }
    if (newStreak > newLongestStreak) {
      newLongestStreak = newStreak;
    }
    await _userRepo.updateUser(user.copyWith(
      currentStreak: newStreak,
      longestStreak: newLongestStreak,
      lastActiveDate: now,
    ));
  }

  Future<void> checkAndResetStreak(String uid) async {
    final user = await _userRepo.getUser(uid);
    if (user == null) return;

    final now = DateTime.now();
    final today = _normalizeDate(now);
    final yesterday = today.subtract(const Duration(days: 1));

    final lastActiveValue = user.lastActiveDate;
    if (lastActiveValue == null) return;

    final lastActiveDate = _normalizeDate(lastActiveValue);
    bool resetStreak = lastActiveDate.isBefore(yesterday);
    bool resetDailyStats = lastActiveDate.isBefore(today);

    if (resetStreak || resetDailyStats) {
      await _userRepo.updateUser(user.copyWith(
        currentStreak: resetStreak ? 0 : user.currentStreak,
        dailyPoints: resetDailyStats ? 0 : user.dailyPoints,
        dailySessions: resetDailyStats ? 0 : user.dailySessions,
      ));
    }
  }
}
