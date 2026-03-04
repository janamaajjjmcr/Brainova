import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_theme.dart';
import '../data/mind_reset_repository.dart';
import '../data/mind_reset_model.dart';

class MindResetListScreen extends ConsumerWidget {
  const MindResetListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesAsync = ref.watch(mindResetActivitiesProvider);

    return SafeArea(
      child: activitiesAsync.when(
        data: (activities) => ListView.separated(
          padding: const EdgeInsets.all(24),
          itemCount: activities.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final activity = activities[index];
            return _ActivityCard(activity: activity, index: index);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

final mindResetActivitiesProvider = FutureProvider<List<MindResetActivity>>((
  ref,
) {
  return ref.read(mindResetRepositoryProvider).getActivities();
});

class _ActivityCard extends StatelessWidget {
  final MindResetActivity activity;
  final int index;

  const _ActivityCard({required this.activity, required this.index});

  @override
  Widget build(BuildContext context) {
    // Use Gradient based on type
    final Gradient? gradient = _getGradientForType(activity.type);

    return GestureDetector(
      onTap: () => context.push('/mind-reset/${activity.id}', extra: activity),
      child: Container(
        padding: const EdgeInsets.all(24),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getIconForType(activity.type),
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Icon(
                  LucideIcons.award,
                  color: Colors.white.withOpacity(0.5),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              activity.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              activity.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _Tag(
                  icon: LucideIcons.clock,
                  text: '${(activity.durationSeconds / 60).round()} min',
                ),
                const SizedBox(width: 8),
                _Tag(
                  icon: LucideIcons.zap,
                  text: '-${activity.pointsReward} Rot',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Gradient? _getGradientForType(MindResetType type) {
    switch (type) {
      case MindResetType.breathing:
        return AppTheme.healingGradient; // Teal/Blue
      case MindResetType.audio:
        return AppTheme.focusGradient; // Purple/Blue
      case MindResetType.stretch:
        return AppTheme.energyGradient; // Orange/Red
      case MindResetType.journaling:
        return AppTheme.primaryGradient; // Purple
    }
  }

  IconData _getIconForType(MindResetType type) {
    switch (type) {
      case MindResetType.breathing:
        return LucideIcons.wind;
      case MindResetType.audio:
        return LucideIcons.headphones;
      case MindResetType.stretch:
        return LucideIcons.activity;
      case MindResetType.journaling:
        return LucideIcons.pencil;
    }
  }
}

class _Tag extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Tag({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
