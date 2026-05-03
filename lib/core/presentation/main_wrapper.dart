import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:brainova/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../../features/auth/data/auth_providers.dart';

class MainWrapper extends ConsumerWidget {
  final Widget child;

  const MainWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final userProfile = ref.watch(userProfileProvider).valueOrNull;

    if (userProfile?.isRestricted == true) {
      return _RestrictedScreen();
    }
    final bool isAdmin =
        (userProfile?.email ?? '').trim().toLowerCase() == 'erer40464@gmail.com';
    final int itemCount = isAdmin ? 6 : 5;

    final int selectedIndex = _calculateSelectedIndex(context, isAdmin);

    final String location = GoRouterState.of(context).uri.toString();
    final bool hideNav = location.startsWith('/admin');

    return Scaffold(
      body: child,
      bottomNavigationBar: hideNav
          ? null
          : Container(
              height: 100,
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 80),
                    painter: _NavBarPainter(
                      selectedIndex: selectedIndex,
                      itemCount: itemCount,
                      color: AppTheme.surface,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: _NavBarItem(
                            icon: LucideIcons.layoutGrid,
                            label: l10n.navDiet,
                            isSelected: selectedIndex == 0,
                            onTap: () => _onItemTapped(0, context, isAdmin),
                          ),
                        ),
                        Expanded(
                          child: _NavBarItem(
                            icon: LucideIcons.zap,
                            label: l10n.navReset,
                            isSelected: selectedIndex == 1,
                            onTap: () => _onItemTapped(1, context, isAdmin),
                          ),
                        ),
                        Expanded(
                          child: _NavBarItem(
                            icon: LucideIcons.home,
                            label: l10n.navHome,
                            isSelected: selectedIndex == 2,
                            onTap: () => _onItemTapped(2, context, isAdmin),
                          ),
                        ),
                        Expanded(
                          child: _NavBarItem(
                            icon: LucideIcons.gamepad2,
                            label: l10n.navRewire,
                            isSelected: selectedIndex == 3,
                            onTap: () => _onItemTapped(3, context, isAdmin),
                          ),
                        ),
                        Expanded(
                          child: _NavBarItem(
                            icon: LucideIcons.user,
                            label: l10n.navProfile,
                            isSelected: selectedIndex == 4,
                            onTap: () => _onItemTapped(4, context, isAdmin),
                          ),
                        ),
                        if (isAdmin)
                          Expanded(
                            child: _NavBarItem(
                              icon: LucideIcons.shieldCheck,
                              label: l10n.navAdmin,
                              isSelected: selectedIndex == 5,
                              onTap: () => _onItemTapped(5, context, isAdmin),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
  int _calculateSelectedIndex(BuildContext context, bool isAdmin) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/content-diet')) return 0;
    if (location.startsWith('/mind-reset')) return 1;
    if (location.startsWith('/home')) return 2;
    if (location.startsWith('/rewire')) return 3;
    if (location.startsWith('/profile')) return 4;
    if (isAdmin && location.startsWith('/admin')) return 5;
    return 2;
  }

  void _onItemTapped(int index, BuildContext context, bool isAdmin) {
    switch (index) {
      case 0:
        context.go('/content-diet');
        break;
      case 1:
        context.go('/mind-reset');
        break;
      case 2:
        context.go('/home');
        break;
      case 3:
        context.go('/rewire');
        break;
      case 4:
        context.go('/profile');
        break;
      case 5:
        if (isAdmin) {
          context.go('/admin');
        }
        break;
    }
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              transform: Matrix4.translationValues(0, isSelected ? -35 : 0, 0),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primary : Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: isSelected
                        ? AppTheme.primary.withValues(alpha: 0.4)
                        : Colors.transparent,
                    blurRadius: isSelected ? 10 : 0,
                    spreadRadius: 0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 24,
              ),
            ),
            if (!isSelected) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
            if (isSelected)
              const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _NavBarPainter extends CustomPainter {
  final int selectedIndex;
  final int itemCount;
  final Color color;

  _NavBarPainter({
    required this.selectedIndex,
    required this.itemCount,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final itemWidth = size.width / itemCount;
    final center = itemWidth * selectedIndex + (itemWidth / 2);
    path.moveTo(0, 0);
    const double notchDepth = 40;
    const double notchWidth = 70;
    path.lineTo(center - notchWidth / 2 - 10, 0);
    path.cubicTo(
      center - notchWidth / 2,
      0,
      center - notchWidth / 2,
      notchDepth,
      center,
      notchDepth,
    );
    path.cubicTo(
      center + notchWidth / 2,
      notchDepth,
      center + notchWidth / 2,
      0,
      center + notchWidth / 2 + 10,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _NavBarPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex ||
        oldDelegate.color != color;
  }
}

class _RestrictedScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(LucideIcons.ban,
                    color: AppTheme.error, size: 64),
              ),
              const SizedBox(height: 32),
              Text(
                l10n.accessRestricted,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.accessRestrictedBody,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 16),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => ref.read(authRepositoryProvider).signOut(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.error,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(l10n.logOut),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
