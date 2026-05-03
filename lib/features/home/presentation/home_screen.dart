import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:brainova/l10n/app_localizations.dart';
import '../../../core/theme/app_theme.dart';
import '../../tracking/data/activity_repository.dart';
import '../../tracking/presentation/widgets/brain_rot_meter.dart';
import '../../auth/data/auth_providers.dart';
import '../../challenges/presentation/widgets/dynamic_challenges_section.dart';
import '../../gamification/data/streak_controller.dart';
import '../../gamification/presentation/widgets/achievements_section.dart';
import '../../gamification/presentation/widgets/badge_unlock_celebration.dart';
import '../../gamification/domain/badge_service.dart';
import '../../tracking/domain/daily_stats_provider.dart';
import '../../tracking/data/activity_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.microtask(() async {
      final hasPermission = await ref
          .read(activityRepositoryProvider)
          .checkRealDataAvailability();
      if (hasPermission && mounted) {
        ref.invalidate(dailyStatsProvider);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint("DEBUG: App resumed, refreshing Brain Rot score...");
      ref.invalidate(brainRotScoreProvider);
    }
  }

  Future<void> _handleRefresh() async {
    debugPrint("DEBUG: Manual refresh triggered...");
    ref.invalidate(brainRotScoreProvider);
    ref.invalidate(dailyStatsProvider);
    await Future.wait([
      ref.read(brainRotScoreProvider.future),
      ref.read(dailyStatsProvider.future),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authStateAsync = ref.watch(authStateProvider);
    final brainRotScoreAsync = ref.watch(brainRotScoreProvider);
    final streakUser = ref.watch(streakControllerProvider);
    final currentStreak = streakUser?.currentStreak ?? 0;
    ref.watch(badgeServiceProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Stack(
          children: [
            SafeArea(
              child: authStateAsync.when(
                data: (user) => SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: AppTheme.primary,
                                backgroundImage: user?.photoUrl != null
                                    ? NetworkImage(user!.photoUrl!)
                                    : null,
                                child: user?.photoUrl == null
                                    ? Text(
                                        (user?.displayName ?? 'U')
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user?.displayName ?? l10n.commonUser,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                  '$currentStreak ${l10n.homeDaysLabel}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 400.ms)
                              .slideX(begin: 0.2),
                        ],
                      ),
                      const SizedBox(height: 32),
                      brainRotScoreAsync.when(
                        data: (score) => BrainRotMeterWidget(score: score)
                            .animate()
                            .fadeIn(duration: 600.ms)
                            .scale(begin: const Offset(0.9, 0.9)),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (e, st) => Text(l10n.commonError(e.toString())),
                      ),

                      const SizedBox(height: 24),
                      const DynamicChallengesSection(),

                      const SizedBox(height: 32),
                      Text(
                        l10n.homeQuickActions,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.4,
                        children: [
                          _QuickActionCard(
                            title: l10n.homeMindReset,
                            icon: LucideIcons.brainCircuit,
                            gradient: AppTheme.healingGradient,
                            onTap: () => context.push('/mind-reset'),
                          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2),
                          _QuickActionCard(
                            title: l10n.homeRewireMode,
                            icon: LucideIcons.compass,
                            gradient: AppTheme.primaryGradient,
                            onTap: () => context.push('/rewire'),
                          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                          _QuickActionCard(
                            title: l10n.homeRealityCheck,
                            icon: LucideIcons.activity,
                            gradient: AppTheme.focusGradient,
                            onTap: () => context.push('/reality-check'),
                          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2),
                          _QuickActionCard(
                            title: l10n.homeContentDiet,
                            icon: LucideIcons.layoutDashboard,
                            gradient: AppTheme.energyGradient,
                            onTap: () => context.push('/content-diet'),
                          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
                        ],
                      ),

                      const SizedBox(height: 32),
                      const AchievementsSection(),
                    ],
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text(l10n.commonError(e.toString()))),
              ),
            ),
            const BadgeUnlockCelebration(),
          ],
        ),
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
              color: (gradient as LinearGradient).colors.first.withValues(alpha: 0.3),
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
                color: Colors.white.withValues(alpha: 0.2),
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
