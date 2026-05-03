import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brainova/features/tracking/data/activity_repository.dart';
import 'package:brainova/features/auth/data/auth_providers.dart';
import 'package:brainova/l10n/app_localizations.dart';

class PermissionCheckerScreen extends ConsumerStatefulWidget {
  const PermissionCheckerScreen({super.key});

  @override
  ConsumerState<PermissionCheckerScreen> createState() =>
      _PermissionCheckerScreenState();
}

class _PermissionCheckerScreenState
    extends ConsumerState<PermissionCheckerScreen> {
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final isAndroid =
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    if (!isAndroid) {
      return;
    }

    final repo = ref.read(activityRepositoryProvider);
    final hasPermission = await repo.checkRealDataAvailability();

    if (!mounted) return;

    if (!hasPermission) {
      setState(() => _isChecking = false);
    } else {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (mounted) {
        _navigateToNext(firebaseUser != null);
      }
    }
  }

  void _navigateToNext(bool isLoggedIn) {
    if (!mounted) return;
    if (isLoggedIn) {
      context.go('/home');
    } else {
      context.go('/intro-slogan');
    }
  }

  Future<void> _openSettings() async {
    final repo = ref.read(activityRepositoryProvider);

    setState(() => _isChecking = true);

    await repo.openUsageSettings();
    await Future.delayed(const Duration(seconds: 2));

    await _checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<UserModel?>>(authStateProvider, (previous, next) {
      next.whenData((user) async {
        final isAndroid =
            !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

        if (!isAndroid) {
          _navigateToNext(user != null);
          return;
        }

        final repo = ref.read(activityRepositoryProvider);
        final hasPermission = await repo.checkRealDataAvailability();

        if (hasPermission && mounted) {
          _navigateToNext(user != null);
        }
      });
    });

    if (_isChecking) {
      return _buildSplashScreen();
    }

    return _buildPermissionScreen();
  }

  Widget _buildSplashScreen() {
    return const Scaffold(
      backgroundColor: Color(0xFF0F172A),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPermissionScreen() {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer_outlined, size: 80),
            const SizedBox(height: 32),
            Text(
              l10n.permissionTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.permissionDescription,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _openSettings,
              child: Text(l10n.permissionOpenSettings),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
