import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:brainova/features/tracking/data/activity_repository.dart';
import 'package:brainova/features/auth/data/auth_repository.dart';
import 'package:brainova/core/service/notification_service.dart';

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
    // Skip on non-Android platforms
    final isAndroid =
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    if (!isAndroid) {
      // Give the router/context a moment to be ready
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) context.go('/home');
      return;
    }

    final auth = ref.read(authRepositoryProvider);
    final repo = ref.read(activityRepositoryProvider);
    final hasPermission = await repo.checkRealDataAvailability();

    if (!mounted) return;

    if (hasPermission) {
      if (auth.currentUser != null) {
        context.go('/home');
      } else {
        context.go('/intro');
      }
    } else {
      setState(() => _isChecking = false);
    }
  }

  Future<void> _openSettings() async {
    final repo = ref.read(activityRepositoryProvider);

    setState(() => _isChecking = true);

    await repo.openUsageSettings();

    // Wait a bit for user to return
    await Future.delayed(const Duration(seconds: 2));

    await _checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    if (_isChecking) {
      return _buildSplashScreen();
    }

    return _buildPermissionScreen();
  }

  Widget _buildSplashScreen() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildPermissionScreen() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer_outlined, size: 80),
            const SizedBox(height: 32),
            const Text(
              'Enable Usage Access',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Brainova needs usage access permission to track screen time and calculate your Brain Rot score.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _openSettings,
              child: const Text('Open Settings'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Triggering test notification...')),
                );
                await NotificationService().showNotification(
                  title: "Test Notification",
                  body: "If you see this, notifications are working!",
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Test Notification'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
