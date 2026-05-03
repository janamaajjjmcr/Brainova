import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/connectivity_service.dart';
import '../theme/app_theme.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(connectivityServiceProvider);

    if (status != ConnectivityStatus.isDisconnected) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      color: AppTheme.error.withValues(alpha: 0.9),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.white, size: 14),
          SizedBox(width: 8),
          Text(
            'You are offline. Changes will sync when you reconnect.',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
