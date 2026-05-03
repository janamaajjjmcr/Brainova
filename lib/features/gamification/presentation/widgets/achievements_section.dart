import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brainova/l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/repositories/badge_repository.dart';
import 'badge_card.dart';

class AchievementsSection extends ConsumerWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final achievementsAsync = ref.watch(badgesStreamProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.achievementsTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                achievementsAsync.when(
                  data: (badges) {
                    final unlockedCount =
                        badges.where((b) => b.isUnlocked).length;
                    return Text(
                      l10n.achievementsUnlocked(unlockedCount, badges.length),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 210,
          child: achievementsAsync.when(
            data: (badges) {
              if (badges.isEmpty) {
                return Center(child: Text(l10n.achievementsNoBadges));
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: badges.length,
                padding: const EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: BadgeCard(badge: badges[index]),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(l10n.commonError(e.toString()))),
          ),
        ),
      ],
    );
  }
}
