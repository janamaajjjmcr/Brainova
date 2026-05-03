import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/badge_model.dart';
import '../../../auth/data/user_model.dart';
import '../../data/streak_controller.dart';
import 'package:brainova/l10n/app_localizations.dart';

class BadgeCard extends ConsumerStatefulWidget {
  final BadgeModel badge;

  const BadgeCard({
    super.key,
    required this.badge,
  });

  @override
  ConsumerState<BadgeCard> createState() => _BadgeCardState();
}

class _BadgeCardState extends ConsumerState<BadgeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    if (widget.badge.isUnlocked) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant BadgeCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.badge.isUnlocked && widget.badge.isUnlocked) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (_controller.isAnimating) return;
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * pi;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(angle),
            child: angle < pi / 2
                ? _buildLocked()
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: _buildUnlocked(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildLocked() {
    final l10n = AppLocalizations.of(context);
    final user = ref.watch(streakControllerProvider);
    final progressInfo = _calculateProgress(user, l10n);
    final double progress = progressInfo.$1;
    final String progressText = progressInfo.$2;

    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Icon(
              _getIcon(widget.badge.iconName),
              size: 32,
              color: Colors.white.withValues(alpha: 0.15),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _getLocalizedTitle(widget.badge.id, l10n),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white.withValues(alpha: 0.4),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            progressText,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                  ),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LucideIcons.lock,
                  size: 10, color: Colors.white.withValues(alpha: 0.2)),
              const SizedBox(width: 4),
              Text(
                AppLocalizations.of(context).badgeLocked.toUpperCase(),
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withValues(alpha: 0.2),
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  (double, String) _calculateProgress(UserModel? user, AppLocalizations l10n) {
    final localizedUnit = _getLocalizedUnit(widget.badge.unitLabel, l10n);
    if (user == null) {
      return (
        0.0,
        "0 / ${widget.badge.conditionValue} $localizedUnit"
      );
    }

    int current = 0;
    int target = widget.badge.conditionValue;

    switch (widget.badge.conditionType) {
      case BadgeConditionType.streak:
        current = user.longestStreak;
        break;
      case BadgeConditionType.tasksCompleted:
        current = user.totalSessions;
        break;
      case BadgeConditionType.firstLogin:
        current = 0;
        break;
      case BadgeConditionType.consistency7Days:
        current = user.longestStreak;
        break;
      case BadgeConditionType.consistency30Days:
        current = user.longestStreak;
        break;
      case BadgeConditionType.profileComplete:
        current = _getProfileProgress(user);
        target = 4;
        break;
      case BadgeConditionType.dietLog:
        current = user.contentDietCount;
        break;
      case BadgeConditionType.custom:
        current = 0;
        break;
    }

    double percent = target > 0 ? (current / target) : 0.0;
    return (percent, "$current / $target $localizedUnit");
  }

  String _getLocalizedUnit(String unit, AppLocalizations l10n) {
    switch (unit.toLowerCase()) {
      case 'days':
        return l10n.badgeUnitDays;
      case 'sessions':
        return l10n.badgeUnitSessions;
      case 'tasks':
        return l10n.badgeUnitTasks;
      case 'entries':
        return l10n.badgeUnitEntries;
      case 'login':
        return l10n.badgeUnitLogin;
      case 'completed':
        return l10n.badgeUnitCompleted;
      default:
        return unit;
    }
  }

  int _getProfileProgress(UserModel user) {
    int count = 0;
    if (user.displayName != null && user.displayName!.trim().isNotEmpty) {
      count++;
    }
    if (user.photoUrl != null && user.photoUrl!.trim().isNotEmpty) count++;
    if (user.phoneNumber != null && user.phoneNumber!.trim().isNotEmpty) {
      count++;
    }
    if (user.country != null && user.country!.trim().isNotEmpty) count++;
    return count;
  }

  Widget _buildUnlocked() {
    final colorScheme = _getBadgeColors(widget.badge.iconName);

    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withValues(alpha: 0.2),
            AppTheme.surface,
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border:
            Border.all(color: colorScheme.primary.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.accent],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.5),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              _getIcon(widget.badge.iconName),
              size: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _getLocalizedTitle(widget.badge.id, AppLocalizations.of(context)),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.primary.withValues(alpha: 0.3)),
            ),
            child: Text(
              AppLocalizations.of(context).badgeEarned.toUpperCase(),
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    ).animate().shimmer(duration: 2.seconds, color: Colors.white10);
  }

  BadgeColorScheme _getBadgeColors(String iconName) {
    switch (iconName) {
      case 'flame':
        return BadgeColorScheme(
            primary: Colors.orange, accent: Colors.deepOrange);
      case 'trophy':
        return BadgeColorScheme(primary: Colors.amber, accent: Colors.orange);
      case 'medal':
        return BadgeColorScheme(
            primary: const Color(0xFF3B82F6), accent: Colors.indigo);
      case 'hand_waving':
        return BadgeColorScheme(
            primary: const Color(0xFF10B981), accent: Colors.teal);
      case 'user_check':
        return BadgeColorScheme(
            primary: Colors.purple, accent: Colors.deepPurple);
      default:
        return BadgeColorScheme(
            primary: AppTheme.primary, accent: Colors.blueAccent);
    }
  }

  String _getLocalizedTitle(String id, AppLocalizations l10n) {
    switch (id) {
      case 'welcome':
        return l10n.badgeTitleWelcome;
      case 'streak_3':
        return l10n.badgeTitleStreak3;
      case 'streak_7':
        return l10n.badgeTitleStreak7;
      case 'mind_reset_5':
        return l10n.badgeTitleMindReset5;
      case 'streak_30':
        return l10n.badgeTitleStreak30;
      case 'profile_complete':
        return l10n.badgeTitleProfileComplete;
      case 'content_diet_10':
        return l10n.badgeTitleContentDiet10;
      default:
        return widget.badge.title;
    }
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'medal':
        return LucideIcons.medal;
      case 'flame':
        return LucideIcons.flame;
      case 'trophy':
        return LucideIcons.trophy;
      case 'check_circle':
        return LucideIcons.checkCircle;
      case 'user_check':
        return LucideIcons.userCheck;
      case 'hand_waving':
        return LucideIcons.hand;
      case 'smartphone':
        return LucideIcons.smartphone;
      case 'leaf':
        return LucideIcons.leaf;
      case 'brain_circuit':
        return LucideIcons.brainCircuit;
      default:
        return LucideIcons.award;
    }
  }
}

class BadgeColorScheme {
  final Color primary;
  final Color accent;
  BadgeColorScheme({required this.primary, required this.accent});
}
