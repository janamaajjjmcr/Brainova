import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:brainova/l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/badge_service.dart';

class BadgeUnlockCelebration extends ConsumerStatefulWidget {
  const BadgeUnlockCelebration({super.key});

  @override
  ConsumerState<BadgeUnlockCelebration> createState() =>
      _BadgeUnlockCelebrationState();
}

class _BadgeUnlockCelebrationState
    extends ConsumerState<BadgeUnlockCelebration> {
  String? _lastShownBadgeId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lastBadge = ref.watch(lastUnlockedBadgeProvider);

    if (lastBadge != null) {
      print(
          'DEBUG: BadgeUnlockCelebration built with badge: ${lastBadge.title}');
    }

    if (lastBadge == null) {
      _lastShownBadgeId = null;
      return const SizedBox.shrink();
    }

    if (_lastShownBadgeId != lastBadge.id) {
      _lastShownBadgeId = lastBadge.id;
      HapticFeedback.heavyImpact();
    }

    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: ConfettiPainter(),
          ),
        ).animate().fadeIn(),

        Material(
          color: Colors.black.withValues(alpha: 0.85),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primary.withValues(alpha: 0.4),
                              blurRadius: 100,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .scale(
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1.2, 1.2),
                              duration: 2.seconds)
                          .blurXY(begin: 20, end: 40),
                      Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.primary, Color(0xFF6366F1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primary.withValues(alpha: 0.5),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          LucideIcons.medal,
                          size: 100,
                          color: Colors.white,
                        ),
                      )
                          .animate()
                          .scale(
                            duration: 800.ms,
                            curve: Curves.elasticOut,
                          )
                          .rotate(begin: -0.1, end: 0, duration: 800.ms),
                    ],
                  ),

                  const SizedBox(height: 48),
                  Text(
                    l10n.badgeCelebrationNewAchievement,
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),

                  const SizedBox(height: 16),
                  Text(
                    _getLocalizedTitle(lastBadge.id, l10n),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(delay: 600.ms)
                      .scale(begin: const Offset(0.9, 0.9))
                      .shimmer(duration: 2.seconds),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      _getLocalizedDesc(lastBadge.id, l10n),
                      style: TextStyle(
                        color: AppTheme.textSecondary.withValues(alpha: 0.8),
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ).animate().fadeIn(delay: 800.ms),

                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(badgeServiceProvider).dismissCelebration();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 10,
                      shadowColor: AppTheme.primary.withValues(alpha: 0.4),
                    ),
                    child: Text(
                      l10n.badgeCelebrationAwesome,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ).animate().fadeIn(delay: 1.seconds).scale(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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
        return "";
    }
  }

  String _getLocalizedDesc(String id, AppLocalizations l10n) {
    switch (id) {
      case 'welcome':
        return l10n.badgeDescWelcome;
      case 'streak_3':
        return l10n.badgeDescStreak3;
      case 'streak_7':
        return l10n.badgeDescStreak7;
      case 'mind_reset_5':
        return l10n.badgeDescMindReset5;
      case 'streak_30':
        return l10n.badgeDescStreak30;
      case 'profile_complete':
        return l10n.badgeDescProfileComplete;
      case 'content_diet_10':
        return l10n.badgeDescContentDiet10;
      default:
        return "";
    }
  }
}

class ConfettiPainter extends CustomPainter {
  final List<Particle> particles = List.generate(50, (index) => Particle());
  final double randomValue = Random().nextDouble();

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42);
    for (int i = 0; i < 60; i++) {
      final paint = Paint()
        ..color = [
          Colors.blue,
          Colors.purple,
          Colors.amber,
          Colors.pink,
          Colors.green
        ][random.nextInt(5)]
            .withValues(alpha: 0.6);

      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 8 + 2;

      if (random.nextBool()) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      } else {
        canvas.drawRect(Rect.fromLTWH(x, y, radius * 2, radius * 2), paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Particle {
  double x = 0, y = 0, size = 0;
  Color color = Colors.white;
}
