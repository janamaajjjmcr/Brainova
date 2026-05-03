import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:brainova/l10n/app_localizations.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppTheme.primary,
            tabs: [
              Tab(text: AppLocalizations.of(context).adminInfoCenter),
              Tab(text: AppLocalizations.of(context).adminActivityLogs),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _SettingsTab(),
                _LogsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
              title: AppLocalizations.of(context).adminBrainRotThresholds, icon: LucideIcons.activity),
          _ThresholdInfoCard(
            label: AppLocalizations.of(context).adminHealthyZone,
            range: '0–40',
            description:
                AppLocalizations.of(context).adminHealthyZoneDesc,
            color: AppTheme.success,
          ),
          _ThresholdInfoCard(
            label: AppLocalizations.of(context).adminCautionZone,
            range: '41–70',
            description:
                AppLocalizations.of(context).adminCautionZoneDesc,
            color: AppTheme.warning,
          ),
          _ThresholdInfoCard(
            label: AppLocalizations.of(context).adminDangerZone,
            range: '71–100',
            description:
                AppLocalizations.of(context).adminDangerZoneDesc,
            color: AppTheme.error,
          ),
          const SizedBox(height: 32),
          _SectionHeader(title: AppLocalizations.of(context).adminPointsSystem, icon: LucideIcons.coins),
          _InfoListTile(
            title: AppLocalizations.of(context).adminRewireReward,
            value: '5 pts',
            subtitle: AppLocalizations.of(context).adminRewireRewardSubtitle,
            icon: LucideIcons.checkCircle2,
          ),
          _InfoListTile(
            title: AppLocalizations.of(context).adminMindResetReward,
            value: '15 pts',
            subtitle: AppLocalizations.of(context).adminMindResetRewardSubtitle,
            icon: LucideIcons.refreshCw,
          ),
          _InfoListTile(
            title: AppLocalizations.of(context).adminChallengeReward,
            value: AppLocalizations.of(context).adminChallengeRewardSubtitle,
            subtitle: AppLocalizations.of(context).adminChallengeRewardSubtitle,
            icon: LucideIcons.trophy,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              AppLocalizations.of(context).adminPointsUsageFooter,
              style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 32),
          _SectionHeader(title: AppLocalizations.of(context).adminSystemFeatures, icon: LucideIcons.layers),
          _FeatureInfoCard(
            title: AppLocalizations.of(context).adminBrainRotMeterTitle,
            description:
                AppLocalizations.of(context).adminBrainRotMeterDesc,
            icon: LucideIcons.gauge,
          ),
          _FeatureInfoCard(
            title: AppLocalizations.of(context).adminCommunityChallengesTitle,
            description:
                AppLocalizations.of(context).adminCommunityChallengesDesc,
            icon: LucideIcons.users2,
          ),
          _FeatureInfoCard(
            title: AppLocalizations.of(context).adminSmartNotificationsTitle,
            description:
                AppLocalizations.of(context).adminSmartNotificationsDesc,
            icon: LucideIcons.bellRing,
          ),
          _FeatureInfoCard(
            title: AppLocalizations.of(context).adminRealtimeAnalyticsTitle,
            description:
                AppLocalizations.of(context).adminRealtimeAnalyticsDesc,
            icon: LucideIcons.barChart3,
          ),
          const SizedBox(height: 32),
          _SectionHeader(
              title: AppLocalizations.of(context).adminHowBrainovaWorks, icon: LucideIcons.helpCircle),
          _StepFlowItem(
              step: '1', text: AppLocalizations.of(context).adminStep1),
          _StepFlowItem(
              step: '2',
              text: AppLocalizations.of(context).adminStep2),
          _StepFlowItem(
              step: '3', text: AppLocalizations.of(context).adminStep3),
          _StepFlowItem(
              step: '4', text: AppLocalizations.of(context).adminStep4),
          const SizedBox(height: 32),
          _SectionHeader(title: AppLocalizations.of(context).adminAppDetails, icon: LucideIcons.info),
          _DetailRow(label: AppLocalizations.of(context).adminAppVersion, value: '1.0.0'),
          _DetailRow(label: AppLocalizations.of(context).adminDeveloper, value: 'Brainova Team'),
          _DetailRow(
              label: AppLocalizations.of(context).adminSystemStatus,
              value: AppLocalizations.of(context).adminOperational,
              color: AppTheme.success),
        ],
      ),
    );
  }
}

class _LogsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('admin_logs')
          .orderBy('timestamp', descending: true)
          .limit(50)
          .snapshots(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snap.data!.docs;

        return ListView.separated(
          padding: const EdgeInsets.all(24),
          itemCount: docs.length,
          separatorBuilder: (_, __) => const Divider(color: Colors.white10),
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            final ts = data['timestamp'] as Timestamp?;
            final date = ts != null
                ? DateFormat('MMM d, HH:mm').format(ts.toDate())
                : '...';

            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle),
                child: const Icon(LucideIcons.scrollText,
                    color: AppTheme.primary, size: 18),
              ),
              title: Text(data['action'] ?? 'Unknown Action',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Text('${data['adminEmail']} • $date',
                  style: const TextStyle(
                      fontSize: 11, color: AppTheme.textSecondary)),
            );
          },
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionHeader({required this.title, required this.icon});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppTheme.primary),
            const SizedBox(width: 12),
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      );
}

class _ThresholdInfoCard extends StatelessWidget {
  final String label;
  final String range;
  final String description;
  final Color color;

  const _ThresholdInfoCard({
    required this.label,
    required this.range,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(range,
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description,
                style: const TextStyle(
                    fontSize: 13, color: AppTheme.textSecondary)),
          ],
        ),
      );
}

class _InfoListTile extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  const _InfoListTile({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 20, color: AppTheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 11, color: AppTheme.textSecondary)),
                ],
              ),
            ),
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                    fontSize: 14)),
          ],
        ),
      );
}

class _FeatureInfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _FeatureInfoCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24, color: AppTheme.primaryVariant),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(description,
                      style: const TextStyle(
                          fontSize: 12, color: AppTheme.textSecondary)),
                ],
              ),
            ),
          ],
        ),
      );
}

class _StepFlowItem extends StatelessWidget {
  final String step;
  final String text;

  const _StepFlowItem({required this.step, required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ],
              ),
              child: Text(step,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      );
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _DetailRow({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 14, color: AppTheme.textSecondary)),
            Text(value,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color ?? Colors.white)),
          ],
        ),
      );
}
