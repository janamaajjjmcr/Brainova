import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brainova/l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/admin_repository.dart';
import '../../data/admin_logger.dart';
import '../../../gamification/data/models/badge_model.dart';

class BadgeManagementView extends ConsumerWidget {
  const BadgeManagementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgesAsync = ref.watch(badgesStreamProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).adminAchievementBadges,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => showBadgeDialog(context, ref),
                icon: const Icon(LucideIcons.plus, size: 18),
                label: Text(AppLocalizations.of(context).adminNewBadge),
              ),
            ],
          ),
        ),
        Expanded(
          child: badgesAsync.when(
            data: (badges) => GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: badges.length,
              itemBuilder: (context, index) {
                final badge = badges[index];
                return _BadgeCard(badge: badge);
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }

  static void showBadgeDialog(BuildContext context, WidgetRef ref,
      [Map<String, dynamic>? badge]) {
    final isEditing = badge != null;
    final titleController = TextEditingController(text: badge?['title']);
    final descController = TextEditingController(text: badge?['description']);
    final iconController = TextEditingController(text: badge?['iconName']);
    final conditionValueController =
        TextEditingController(text: badge?['conditionValue']?.toString());
    BadgeConditionType selectedCondition = BadgeConditionType.values.firstWhere(
      (e) => e.name == badge?['conditionType'],
      orElse: () => BadgeConditionType.custom,
    );
    final unitLabelController =
        TextEditingController(text: badge?['unitLabel'] ?? 'days');

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: AppTheme.surface,
          title: Text(isEditing ? AppLocalizations.of(context).adminEditBadge : AppLocalizations.of(context).adminNewBadge),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: AppLocalizations.of(context).adminBadgeTitle),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(labelText: AppLocalizations.of(context).adminBadgeDesc),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: iconController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).adminBadgeIconName),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<BadgeConditionType>(
                  initialValue: selectedCondition,
                  decoration:
                      InputDecoration(labelText: AppLocalizations.of(context).adminBadgeConditionType),
                  dropdownColor: AppTheme.surface,
                  items: BadgeConditionType.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name,
                                style: const TextStyle(
                                    color: AppTheme.textPrimary)),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => selectedCondition = val);
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: conditionValueController,
                  decoration:
                      InputDecoration(labelText: AppLocalizations.of(context).adminBadgeConditionValue),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: unitLabelController,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).adminBadgeUnitLabel),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context).adminCancel),
            ),
            ElevatedButton(
              onPressed: () {
                final data = {
                  'title': titleController.text,
                  'description': descController.text,
                  'iconName': iconController.text,
                  'conditionType': selectedCondition.name,
                  'conditionValue':
                      int.tryParse(conditionValueController.text) ?? 0,
                  'unitLabel': unitLabelController.text,
                };

                if (isEditing) {
                  ref
                      .read(adminRepositoryProvider)
                      .updateBadge(badge['id'], data);
                  AdminLogger.logAction('Updated Badge',
                      metadata: {'title': data['title']});
                } else {
                  final customId =
                      titleController.text.toLowerCase().replaceAll(' ', '_');
                  ref.read(adminRepositoryProvider).addBadge(data, customId);
                  AdminLogger.logAction('Created Badge',
                      metadata: {'title': data['title']});
                }
                Navigator.pop(context);
              },
              child: Text(isEditing ? AppLocalizations.of(context).adminSaveChanges : AppLocalizations.of(context).adminNewBadge),
            ),
          ],
        ),
      ),
    );
  }
}

class _BadgeCard extends ConsumerWidget {
  final Map<String, dynamic> badge;
  const _BadgeCard({required this.badge});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(LucideIcons.award,
                color: AppTheme.primary, size: 32),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  badge['title'] ?? 'Badge',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  badge['description'] ?? '',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 10, color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(LucideIcons.edit2,
                    color: AppTheme.primary, size: 20),
                onPressed: () =>
                    BadgeManagementView.showBadgeDialog(context, ref, badge),
              ),
              IconButton(
                icon: const Icon(LucideIcons.trash2,
                    color: AppTheme.error, size: 20),
                onPressed: () {
                  ref.read(adminRepositoryProvider).deleteBadge(badge['id']);
                  AdminLogger.logAction('Deleted Badge',
                      metadata: {'title': badge['title']});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final badgesStreamProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  return ref.read(adminRepositoryProvider).watchBadges();
});
