import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:brainova/l10n/app_localizations.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../core/localization/locale_provider.dart';
import '../../auth/data/auth_providers.dart';
import '../../gamification/data/streak_controller.dart';
import '../../gamification/presentation/widgets/streak_widget.dart';
import '../../tracking/domain/daily_stats_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final userProfileAsync = ref.watch(userProfileProvider);
    final streakUser = ref.watch(streakControllerProvider);
    final dailyStatsAsync = ref.watch(dailyStatsProvider);
    final currentStreak = streakUser?.currentStreak ?? 0;

    return SafeArea(
      child: userProfileAsync.when(
        data: (user) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.navProfile,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const _DayNightToggle(),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceHighlight,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.primary, width: 2),
                      ),
                      child: _buildAvatarPlaceholder(user?.displayName),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user?.displayName ?? l10n.commonUser,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user?.email ?? 'user@brainova.app',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppTheme.textSecondary
                            : AppTheme.lightTextSecondary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const StreakWidget(),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () => ref
                          .read(streakControllerProvider.notifier)
                          .completeDailyTask(),
                      icon: const Icon(LucideIcons.checkCircle, size: 18),
                      label: Text(l10n.profileCompleteDailyTask),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    l10n.profileYourStatistics,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppTheme.surface
                        : AppTheme.lightSurface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withValues(alpha: 0.05)
                          : AppTheme.lightSurfaceHighlight,
                    ),
                    boxShadow: Theme.of(context).brightness == Brightness.dark
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                  ),
                  child: dailyStatsAsync.when(
                    data: (stats) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatColumn(
                          value: (stats['resets'] ?? 0).toString(),
                          label: l10n.profileResets,
                          color: AppTheme.primary,
                          icon: LucideIcons.brainCircuit,
                        ),
                        _StatColumn(
                          value: currentStreak.toString(),
                          label: l10n.profileDayStreak,
                          color: AppTheme.warning,
                          icon: LucideIcons.flame,
                        ),
                        _StatColumn(
                          value: (stats['points'] ?? 0).toString(),
                          label: l10n.profilePointsToday,
                          color: AppTheme.pink,
                          icon: LucideIcons.award,
                        ),
                        _StatColumn(
                          value: (stats['tasks'] ?? 0).toString(),
                          label: l10n.profileTasksDone,
                          color: AppTheme.success,
                          icon: LucideIcons.checkSquare,
                        ),
                      ],
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Center(child: Text('Error: $e')),
                  ),
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    l10n.profileTrackDailyMood,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 16),
                const _MoodTracker(),
                const SizedBox(height: 32),

                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    l10n.profileAccount,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppTheme.textSecondary
                              : AppTheme.lightTextSecondary,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppTheme.surface
                        : AppTheme.lightSurface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: Theme.of(context).brightness == Brightness.dark
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                  ),
                  child: Column(
                    children: [
                      _SettingsTile(
                        icon: LucideIcons.user,
                        title: l10n.profilePersonalInformation,
                        onTap: () => context.push('/profile/personal-info'),
                      ),
                      Divider(
                        height: 1,
                        indent: 60,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppTheme.surfaceHighlight
                            : AppTheme.lightSurfaceHighlight,
                      ),
                      _SettingsTile(
                        icon: LucideIcons.languages,
                        title: l10n.profileLanguage,
                        onTap: () => _showLanguageDialog(context, ref, l10n),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    l10n.profileMore,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppTheme.textSecondary
                              : AppTheme.lightTextSecondary,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppTheme.surface
                        : AppTheme.lightSurface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: Theme.of(context).brightness == Brightness.dark
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                  ),
                  child: Column(
                    children: [
                      _SettingsTile(
                        icon: LucideIcons.shield,
                        title: l10n.profilePrivacySecurity,
                        onTap: () => context.push('/profile/privacy'),
                      ),
                      Divider(
                        height: 1,
                        indent: 60,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppTheme.surfaceHighlight
                            : AppTheme.lightSurfaceHighlight,
                      ),
                      _SettingsTile(
                        icon: LucideIcons.helpCircle,
                        title: l10n.profileHelpSupport,
                        onTap: () => context.push('/profile/help'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                TextButton.icon(
                  onPressed: () async {
                    await ref.read(authRepositoryProvider).signOut();
                    if (context.mounted) context.go('/login');
                  },
                  icon: const Icon(LucideIcons.logOut, color: AppTheme.error),
                  label: Text(l10n.profileSignOut,
                      style: const TextStyle(color: AppTheme.error)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(l10n.commonError(e.toString()))),
      ),
    );
  }

  Widget _buildAvatarPlaceholder(String? name) {
    return Center(
      child: Text(
        (name ?? 'U').substring(0, 1).toUpperCase(),
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showLanguageDialog(
      BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final currentLocale = ref.read(localeProvider);
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            l10n.profileSelectLanguage,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _LanguageOption(
                label: 'English',
                languageCode: 'en',
                isSelected: currentLocale.languageCode == 'en',
                onTap: () {
                  ref
                      .read(localeProvider.notifier)
                      .setLocale(const Locale('en'));
                  Navigator.of(dialogContext).pop();
                },
              ),
              const SizedBox(height: 8),
              _LanguageOption(
                label: 'العربية',
                languageCode: 'ar',
                isSelected: currentLocale.languageCode == 'ar',
                onTap: () {
                  ref
                      .read(localeProvider.notifier)
                      .setLocale(const Locale('ar'));
                  Navigator.of(dialogContext).pop();
                },
              ),
              const SizedBox(height: 8),
              _LanguageOption(
                label: 'Español',
                languageCode: 'es',
                isSelected: currentLocale.languageCode == 'es',
                onTap: () {
                  ref
                      .read(localeProvider.notifier)
                      .setLocale(const Locale('es'));
                  Navigator.of(dialogContext).pop();
                },
              ),
              const SizedBox(height: 8),
              _LanguageOption(
                label: 'Français',
                languageCode: 'fr',
                isSelected: currentLocale.languageCode == 'fr',
                onTap: () {
                  ref
                      .read(localeProvider.notifier)
                      .setLocale(const Locale('fr'));
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
  });

  final String value;
  final String label;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(
                alpha: Theme.of(context).brightness == Brightness.dark
                    ? 0.1
                    : 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppTheme.textSecondary
                : AppTheme.lightTextSecondary,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppTheme.surfaceHighlight
              : AppTheme.lightSurfaceHighlight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppTheme.primary, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          fontSize: 16,
        ),
      ),
      trailing: trailing ??
          Icon(LucideIcons.chevronRight,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppTheme.textSecondary
                  : AppTheme.lightTextSecondary,
              size: 18),
      onTap: onTap,
    );
  }
}

class _MoodTracker extends StatefulWidget {
  const _MoodTracker();

  @override
  State<_MoodTracker> createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<_MoodTracker> {
  int? _selectedIndex;

  final List<IconData> _moods = [
    LucideIcons.frown,
    LucideIcons.meh,
    LucideIcons.smile,
    LucideIcons.laugh,
    LucideIcons.partyPopper,
  ];

  final List<Color> _colors = [
    AppTheme.error,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    AppTheme.success,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppTheme.surface
            : AppTheme.lightSurface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: Theme.of(context).brightness == Brightness.dark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.05)
              : AppTheme.lightSurfaceHighlight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_moods.length, (index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? _colors[index].withValues(alpha: 0.2)
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(color: _colors[index], width: 2)
                    : null,
              ),
              child: Icon(
                _moods[index],
                color: isSelected ? _colors[index] : Colors.grey,
                size: 32,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.languageCode,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String languageCode;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primary.withValues(alpha: 0.15)
              : (Theme.of(context).brightness == Brightness.dark
                  ? AppTheme.surfaceHighlight
                  : AppTheme.lightSurfaceHighlight),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppTheme.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Text(
              languageCode == 'ar'
                  ? '🇸🇦'
                  : languageCode == 'es'
                      ? '🇪🇸'
                      : languageCode == 'fr'
                          ? '🇫🇷'
                          : '🇬🇧',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? AppTheme.primary
                      : (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppTheme.lightText),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppTheme.primary, size: 20),
          ],
        ),
      ),
    );
  }
}

class _DayNightToggle extends ConsumerWidget {
  const _DayNightToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return GestureDetector(
      onTap: () => ref.read(themeModeProvider.notifier).toggleTheme(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 76,
        height: 38,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: isDark
              ? const LinearGradient(
                  colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFFBAE6FD), Color(0xFF60A5FA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (isDark)
              ...List.generate(3, (i) => _ToggleDecoration(i)),
            
            AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              curve: Curves.elasticOut,
              alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  isDark ? LucideIcons.moon : LucideIcons.sun,
                  size: 18,
                  color: isDark ? const Color(0xFF1E293B) : Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleDecoration extends StatelessWidget {
  final int index;
  const _ToggleDecoration(this.index);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: index * 15.0 + 10,
      top: (index % 2) * 5.0 + 10,
      child: Container(
        width: 2,
        height: 2,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
