import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/data/user_model.dart';
import '../data/models/badge_model.dart';
import '../data/repositories/badge_repository.dart';
import '../data/streak_controller.dart';

final badgeServiceProvider = Provider<BadgeService>((ref) {
  final service = BadgeService(ref);
  service._initialize();
  return service;
});

final lastUnlockedBadgeProvider = StateProvider<BadgeModel?>((ref) => null);

class BadgeService {
  final Ref _ref;
  StreamSubscription? _streakSubscription;
  StreamSubscription? _badgesSubscription;

  List<BadgeModel> _allBadges = [];
  UserModel? _currentUser;
  final List<BadgeModel> _celebrationQueue = [];
  bool _isShowingCelebration = false;

  BadgeService(this._ref);

  void _initialize() {
    _ref.read(badgeRepositoryProvider).seedInitialBadges();
    _ref.listen<UserModel?>(streakControllerProvider, (previous, next) {
      if (next != null) {
        _currentUser = next;
        _checkConditions();
      }
    }, fireImmediately: true);
    _badgesSubscription =
        _ref.read(badgeRepositoryProvider).getBadgesStream().listen((badges) {
      _allBadges = badges;
      _checkConditions();
    });
  }

  void _checkConditions() {
    final user = _currentUser;
    if (user == null || _allBadges.isEmpty) return;

    final lockedBadges = _allBadges.where((b) => !b.isUnlocked).toList();

    for (final badge in lockedBadges) {
      bool met = false;

      switch (badge.conditionType) {
        case BadgeConditionType.streak:

          met = user.longestStreak >= badge.conditionValue;
          break;
        case BadgeConditionType.firstLogin:

          met = true;
          break;
        case BadgeConditionType.profileComplete:
          met = _isProfileComplete(user);
          break;
        case BadgeConditionType.consistency7Days:
          met = user.longestStreak >= badge.conditionValue;
          break;
        case BadgeConditionType.consistency30Days:
          met = user.longestStreak >= badge.conditionValue;
          break;
        case BadgeConditionType.tasksCompleted:

          met = user.totalSessions >= badge.conditionValue;
          break;
        case BadgeConditionType.dietLog:
          met = user.contentDietCount >= badge.conditionValue;
          break;
        case BadgeConditionType.custom:

          break;
      }

      if (met) {
        _unlockBadge(badge);
      }
    }
  }

  bool _isProfileComplete(UserModel user) {
    return user.displayName != null &&
        user.displayName!.isNotEmpty &&
        user.photoUrl != null &&
        user.photoUrl!.isNotEmpty &&
        user.phoneNumber != null &&
        user.phoneNumber!.isNotEmpty &&
        user.country != null &&
        user.country!.isNotEmpty;
  }

  Future<void> _unlockBadge(BadgeModel badge) async {
    await _ref.read(badgeRepositoryProvider).unlockBadge(badge.id);

    final unlockedBadge =
        badge.copyWith(isUnlocked: true, unlockedAt: DateTime.now());
    _celebrationQueue.add(unlockedBadge);
    _showNextCelebration();
  }

  void _showNextCelebration() {
    if (_isShowingCelebration || _celebrationQueue.isEmpty) return;

    _isShowingCelebration = true;
    final nextBadge = _celebrationQueue.removeAt(0);
    _ref.read(lastUnlockedBadgeProvider.notifier).state = nextBadge;
  }

  void dismissCelebration() {
    _ref.read(lastUnlockedBadgeProvider.notifier).state = null;
    _isShowingCelebration = false;
    Future.delayed(const Duration(milliseconds: 500), () {
      _showNextCelebration();
    });
  }

  void dispose() {
    _streakSubscription?.cancel();
    _badgesSubscription?.cancel();
  }
}
