import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_theme.dart';
import '../data/admin_repository.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricsAsync = ref.watch(adminMetricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Console'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'System Overview',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              metricsAsync.when(
                data: (metrics) => GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.25,
                  children: [
                    _MetricCard(
                      title: 'Total Users',
                      value: metrics['totalUsers'].toString(),
                      icon: LucideIcons.users,
                      color: Colors.blue,
                    ),
                    _MetricCard(
                      title: 'Active Today',
                      value: metrics['activeToday'].toString(),
                      icon: LucideIcons.activity,
                      color: Colors.green,
                    ),
                    _MetricCard(
                      title: 'Avg Brain Rot',
                      value: '${metrics['avgBrainRot']}%',
                      icon: LucideIcons.brainCircuit,
                      color: Colors.orange,
                    ),
                    _MetricCard(
                      title: 'Resets Done',
                      value: metrics['mindResetsCompleted'].toString(),
                      icon: LucideIcons.checkSquare,
                      color: Colors.purple,
                    ),
                  ],
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Text('Error: $e'),
              ),
              const SizedBox(height: 32),
              Text(
                'Recent Alerts',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Card(
                child: ListTile(
                  title: Text('High Rot Detected: User 23'),
                  leading: Icon(Icons.warning, color: Colors.red),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text('New Challenge Created'),
                  leading: Icon(Icons.info, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final adminMetricsProvider = FutureProvider<Map<String, dynamic>>((ref) {
  return ref.read(adminRepositoryProvider).getSystemMetrics();
});

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(title, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
