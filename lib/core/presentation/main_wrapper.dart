import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class MainWrapper extends StatelessWidget {
  final Widget child;

  const MainWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = _calculateSelectedIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // The Background Bar with Curve
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 80),
              painter: _NavBarPainter(
                selectedIndex: selectedIndex,
                itemCount: 6,
                color: AppTheme.surface,
              ),
            ),
            // The Icons
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: _NavBarItem(
                      icon: LucideIcons.layoutGrid,
                      label: 'Diet',
                      isSelected: selectedIndex == 0,
                      onTap: () => _onItemTapped(0, context),
                    ),
                  ),
                  Expanded(
                    child: _NavBarItem(
                      icon: LucideIcons.zap,
                      label: 'Reset',
                      isSelected: selectedIndex == 1,
                      onTap: () => _onItemTapped(1, context),
                    ),
                  ),
                  Expanded(
                    child: _NavBarItem(
                      icon: LucideIcons.home,
                      label: 'Home',
                      isSelected: selectedIndex == 2,
                      onTap: () => _onItemTapped(2, context),
                    ),
                  ),
                  Expanded(
                    child: _NavBarItem(
                      icon: LucideIcons.gamepad2,
                      label: 'Rewire',
                      isSelected: selectedIndex == 3,
                      onTap: () => _onItemTapped(3, context),
                    ),
                  ),
                  Expanded(
                    child: _NavBarItem(
                      icon: LucideIcons.user,
                      label: 'Profile',
                      isSelected: selectedIndex == 4,
                      onTap: () => _onItemTapped(4, context),
                    ),
                  ),
                  Expanded(
                    child: _NavBarItem(
                      icon: LucideIcons.shieldCheck,
                      label: 'Admin',
                      isSelected: selectedIndex == 5,
                      onTap: () => _onItemTapped(5, context),
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

  // Calculate index based on route
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/content-diet')) return 0;
    if (location.startsWith('/mind-reset')) return 1;
    if (location.startsWith('/home')) return 2;
    if (location.startsWith('/rewire')) return 3;
    if (location.startsWith('/profile')) return 4;
    if (location.startsWith('/admin')) return 5;
    return 2; // Default to Home
  }

  void _onItemTapped(int index, BuildContext context) {
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
        context.go('/admin');
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
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppTheme.primary.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ]
                    : null,
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
              const SizedBox(height: 16), // Spacing for layout stability
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

    // Start
    path.moveTo(0, 0);

    // The Notch
    // A nice smooth bezier curve
    const double notchDepth = 40;
    const double notchWidth = 70;

    // Left shoulder
    path.lineTo(center - notchWidth / 2 - 10, 0);

    // Curve down
    path.cubicTo(
      center - notchWidth / 2,
      0, // Control point 1
      center - notchWidth / 2,
      notchDepth, // Control point 2
      center,
      notchDepth, // Target point (bottom of notch)
    );

    // Curve up
    path.cubicTo(
      center + notchWidth / 2,
      notchDepth, // Control point 1
      center + notchWidth / 2,
      0, // Control point 2
      center + notchWidth / 2 + 10,
      0, // Target point
    );

    // End
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
