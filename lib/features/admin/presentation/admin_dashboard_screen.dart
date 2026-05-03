import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:brainova/l10n/app_localizations.dart';
import '../../../core/theme/app_theme.dart';
import 'widgets/admin_overview_view.dart';
import 'widgets/challenge_management_view.dart';
import 'widgets/user_management_view.dart';
import 'widgets/analytics_reports_view.dart';
import 'widgets/badge_management_view.dart';
import 'widgets/app_settings_view.dart';

final adminViewProvider = StateProvider<int>((ref) => 0);

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedView = ref.watch(adminViewProvider);
    final l10n = AppLocalizations.of(context);

    final List<Widget> views = [
      const AdminOverviewView(),
      const ChallengeManagementView(),
      const UserManagementView(),
      const AnalyticsReportsView(),
      const BadgeManagementView(),
      const AppSettingsView(),
    ];

    final List<String> titles = [
      l10n.adminDashboardTitle,
      l10n.adminChallengeManagement,
      l10n.adminUserManagement,
      l10n.adminAnalyticsReports,
      l10n.adminBadgeManagement,
      l10n.adminAppSettings,
    ];

    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.background : AppTheme.lightBackground,
      appBar: AppBar(
        title: Text(
          titles[selectedView],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.logOut),
            onPressed: () => context.go('/home'),
            tooltip: l10n.adminExit,
          ),
          if (selectedView != 0)
            IconButton(
              icon: const Icon(LucideIcons.layoutDashboard),
              onPressed: () => ref.read(adminViewProvider.notifier).state = 0,
              tooltip: l10n.adminBackToOverview,
            ),
        ],
      ),
      body: SafeArea(
        child: views[selectedView],
      ),
      bottomNavigationBar: _AdminMiniNav(selectedView: selectedView),
    );
  }
}

class _AdminMiniNav extends ConsumerWidget {
  final int selectedView;
  const _AdminMiniNav({required this.selectedView});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: isDark ? AppTheme.surface : AppTheme.lightSurface,
          border: Border(
              top: BorderSide(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.black.withValues(alpha: 0.05))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: _NavIcon(
                    index: 0,
                    icon: LucideIcons.layoutDashboard,
                    label: l10n.adminHome)),
            Expanded(
                child: _NavIcon(
                    index: 1,
                    icon: LucideIcons.trophy,
                    label: l10n.adminChallenges)),
            Expanded(
                child: _NavIcon(
                    index: 2, icon: LucideIcons.users, label: l10n.adminUsers)),
            Expanded(
                child: _NavIcon(
                    index: 3,
                    icon: LucideIcons.barChart,
                    label: l10n.adminStats)),
            Expanded(
                child: _NavIcon(
                    index: 4, icon: LucideIcons.award, label: l10n.adminBadges)),
            Expanded(
                child: _NavIcon(
                    index: 5, icon: LucideIcons.info, label: l10n.adminInfo)),
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends ConsumerWidget {
  final int index;
  final IconData icon;
  final String label;

  const _NavIcon(
      {required this.index, required this.icon, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(adminViewProvider);
    final isSelected = current == index;

    return GestureDetector(
      onTap: () => ref.read(adminViewProvider.notifier).state = index,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? AppTheme.primary
                : (Theme.of(context).brightness == Brightness.dark
                    ? AppTheme.textSecondary
                    : AppTheme.lightTextSecondary),
            size: 24,
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected
                    ? AppTheme.primary
                    : (Theme.of(context).brightness == Brightness.dark
                        ? AppTheme.textSecondary
                        : AppTheme.lightTextSecondary),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
