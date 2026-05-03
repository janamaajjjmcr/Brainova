import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/challenge_provider.dart';
import 'challenge_card.dart';
import 'package:brainova/l10n/app_localizations.dart';

class DynamicChallengesSection extends ConsumerWidget {
  const DynamicChallengesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeChallengesAsync = ref.watch(activeChallengesProvider);

    return activeChallengesAsync.when(
      data: (challenges) {
        debugPrint(
            "DEBUG: DynamicChallengesSection - Loaded ${challenges.length} challenges");
        if (challenges.isEmpty) {
          return Center(
            child: Column(
              children: [
                Icon(LucideIcons.frown,
                    color: AppTheme.textSecondary.withValues(alpha: 0.5), size: 48),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context).challengesNone,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppTheme.textSecondary),
                ),
              ],
            ),
          );
        }

        return Column(
          children: challenges.map((challenge) {
            debugPrint("DEBUG: Rendering challenge: ${challenge.title}");
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ChallengeCard(challenge: challenge),
            )
                .animate()
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: 0.1);
          }).toList(),
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, st) {
        debugPrint("DEBUG: Error in DynamicChallengesSection: $e\n$st");
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppLocalizations.of(context).commonError(e.toString()),
              style: const TextStyle(color: Colors.redAccent),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
