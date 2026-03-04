import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../tracking/domain/brain_rot_service.dart';
import '../../tracking/presentation/widgets/brain_rot_meter.dart';
import '../../auth/data/auth_repository.dart';
import '../../challenges/presentation/widgets/challenge_card.dart';
import '../../gamification/data/streak_controller.dart';
import '../../gamification/presentation/widgets/achievements_section.dart';
import '../../gamification/presentation/widgets/badge_unlock_celebration.dart';
import '../../gamification/domain/badge_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateProvider);
    final brainRotLevelAsync = ref.watch(brainRotLevelProvider);
    final streakUser = ref.watch(streakControllerProvider);
    final currentStreak = streakUser?.currentStreak ?? 0;

    // Ensure BadgeService is initialized and listening
    ref.watch(badgeServiceProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SafeArea(
            child: authStateAsync.when(
              data: (user) => SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppTheme.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  (user?.displayName ?? 'U')
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user?.displayName ?? 'User',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Level 1',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(begin: -0.2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceHighlight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                LucideIcons.flame,
                                color: Colors.orange,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '$currentStreak Days',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(duration: 400.ms).slideX(begin: 0.2),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Brain Rot Meter
                    brainRotLevelAsync.when(
                      data: (level) => BrainRotMeterWidget(level: level)
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .scale(begin: const Offset(0.9, 0.9)),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, st) => Text('Error: $e'),
                    ),

                    const SizedBox(height: 24),
                    // Challenges Section
                    const ChallengeCard()
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .slideY(begin: 0.1),

                    const SizedBox(height: 32),
                    Text(
                      'Quick Actions',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),

                    // Quick Actions Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.4,
                      children: [
                        _QuickActionCard(
                          title: 'Mind Reset',
                          icon: LucideIcons.brainCircuit,
                          gradient: AppTheme.healingGradient,
                          onTap: () => context.push('/mind-reset'),
                        ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2),
                        _QuickActionCard(
                          title: 'Rewire Mode',
                          icon: LucideIcons.compass,
                          gradient: AppTheme.primaryGradient,
                          onTap: () => context.push('/rewire'),
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                        _QuickActionCard(
                          title: 'Reality Check',
                          icon: LucideIcons.activity,
                          gradient: AppTheme.focusGradient,
                          onTap: () => context.push('/reality-check'),
                        ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2),
                        _QuickActionCard(
                          title: 'Content Diet',
                          icon: LucideIcons.layoutDashboard,
                          gradient: AppTheme.energyGradient,
                          onTap: () => context.push('/content-diet'),
                        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
                      ],
                    ),

                    const SizedBox(height: 32),
                    // Your Stats / Activity Breakdown
                    Text('Your Stats',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _StatItem(
                            value: '12h',
                            label: 'Screen Time',
                            color: AppTheme.textPrimary,
                          ),
                          _StatItem(
                            value: '85%',
                            label: 'Focus Score',
                            color: AppTheme.success,
                          ),
                          _StatItem(
                            value: '14',
                            label: 'Tasks Done',
                            color: AppTheme.primary,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                    // Dynamic Achievements Section
                    const AchievementsSection(),
                  ],
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
          // Badge Unlock Celebration Overlay
          const BadgeUnlockCelebration(),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: (gradient as LinearGradient).colors.first.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}
