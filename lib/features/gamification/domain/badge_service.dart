import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/data/user_model.dart';
import '../data/models/badge_model.dart';
import '../data/repositories/badge_repository.dart';
import '../data/streak_controller.dart';

final badgeServiceProvider = Provider<BadgeService>((ref) {
  final service = BadgeService(ref);
  // Initialize the service by listening to relevant providers
  service._initialize();
  return service;
});

/// A provider to notify the UI when a badge is unlocked for celebration
final lastUnlockedBadgeProvider = StateProvider<BadgeModel?>((ref) => null);

class BadgeService {
  final Ref _ref;
  StreamSubscription? _streakSubscription;
  StreamSubscription? _badgesSubscription;

  List<BadgeModel> _allBadges = [];
  UserModel? _currentUser;

  BadgeService(this._ref);

  void _initialize() {
    // Seed badges automatically on first load
    _ref.read(badgeRepositoryProvider).seedInitialBadges();

    // Listen to user stats
    _ref.listen<UserModel?>(streakControllerProvider, (previous, next) {
      if (next != null) {
        _currentUser = next;
        _checkConditions();
      }
    }, fireImmediately: true);

    // Listen to all badges to keep a local cache
    _badgesSubscription =
        _ref.read(badgeRepositoryProvider).getBadgesStream().listen((badges) {
      _allBadges = badges;
      _checkConditions();
    });
  }

  /// Forces a celebration for testing purposes
  void testUnlock() {
    print('DEBUG: BadgeService.testUnlock called');

    BadgeModel badge;
    if (_allBadges.isNotEmpty) {
      badge = _allBadges.firstWhere((b) => b.id == 'streak_3',
          orElse: () => _allBadges.first);
    } else {
      print('DEBUG: _allBadges is empty, using fallback badge');
      badge = BadgeModel(
        id: 'test_badge',
        title: 'Super Star!',
        description: 'You are doing amazing things!',
        iconName: 'medal',
        conditionType: BadgeConditionType.streak,
        conditionValue: 1,
        unitLabel: 'days',
      );
    }

    print('DEBUG: Triggering celebration for badge: ${badge.title}');
    _ref.read(lastUnlockedBadgeProvider.notifier).state =
        badge.copyWith(isUnlocked: true, unlockedAt: DateTime.now());
  }

  /// The main logic to check all locked badges against user stats
  void _checkConditions() {
    final user = _currentUser;
    if (user == null || _allBadges.isEmpty) return;

    final lockedBadges = _allBadges.where((b) => !b.isUnlocked).toList();

    for (final badge in lockedBadges) {
      bool met = false;

      switch (badge.conditionType) {
        case BadgeConditionType.streak:
          met = user.currentStreak >= badge.conditionValue;
          break;
        case BadgeConditionType.firstLogin:
          // If the user exists and is logged in, they've met first login
          met = true;
          break;
        case BadgeConditionType.profileComplete:
          met = _isProfileComplete(user);
          break;
        case BadgeConditionType.consistency7Days:
          met = user.longestStreak >= 7;
          break;
        case BadgeConditionType.consistency30Days:
          met = user.longestStreak >= 30;
          break;
        case BadgeConditionType.tasksCompleted:
          // Assuming we track tasks in points or a similar field for now
          // or we might need a specific field in the future
          met = user.points >=
              (badge.conditionValue * 10); // Dummy logic: 10 points per task
          break;
        case BadgeConditionType.dietLog:
          met = user.contentDietCount >= badge.conditionValue;
          break;
        case BadgeConditionType.custom:
          // Handle custom logic if needed
          break;
      }

      if (met) {
        _unlockBadge(badge);
      }
    }
  }

  bool _isProfileComplete(UserModel user) {
    return user.displayName != null &&
        user.photoUrl != null &&
        user.phoneNumber != null &&
        user.country != null;
  }

  Future<void> _unlockBadge(BadgeModel badge) async {
    await _ref.read(badgeRepositoryProvider).unlockBadge(badge.id);

    // Notify UI for celebration
    _ref.read(lastUnlockedBadgeProvider.notifier).state =
        badge.copyWith(isUnlocked: true, unlockedAt: DateTime.now());

    // Clear the notification after some time (optional, UI can handle clearing)
    Future.delayed(const Duration(seconds: 5), () {
      if (_ref.read(lastUnlockedBadgeProvider.notifier).state?.id == badge.id) {
        _ref.read(lastUnlockedBadgeProvider.notifier).state = null;
      }
    });
  }

  void dispose() {
    _streakSubscription?.cancel();
    _badgesSubscription?.cancel();
  }
}
