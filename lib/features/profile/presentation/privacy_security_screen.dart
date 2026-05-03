import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/service/notification_service.dart';
import 'package:brainova/l10n/app_localizations.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.privacyTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PrivacyToggleItem(
              icon: LucideIcons.database,
              title: l10n.privacyDataCollection,
              content: l10n.privacyDataCollectionContent,
            ),
            _PrivacyToggleItem(
              icon: LucideIcons.eye,
              title: l10n.privacyWhatWeTrack,
              content: l10n.privacyWhatWeTrackContent,
            ),
            _PrivacyToggleItem(
              icon: LucideIcons.shieldCheck,
              title: l10n.privacyDataSecurity,
              content: l10n.privacyDataSecurityContent,
            ),
            _PrivacyToggleItem(
              icon: LucideIcons.userX,
              title: l10n.privacyYourRights,
              content: l10n.privacyYourRightsContent,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.privacyReliabilitySettings,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.privacyBackgroundAlerts,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.privacyBackgroundAlertsDesc,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          NotificationService().requestBatteryOptimizationExemption(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary.withValues(alpha: 0.1),
                        foregroundColor: AppTheme.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: AppTheme.primary.withValues(alpha: 0.2)),
                        ),
                      ),
                      child: Text(l10n.privacyEnableReliableAlerts),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.privacyPermissionsUsed,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            _PrivacyStaticItem(
              icon: LucideIcons.activity,
              title: l10n.privacyUsageAccess,
              description: l10n.privacyUsageAccessDesc,
            ),
            _PrivacyStaticItem(
              icon: LucideIcons.bell,
              title: l10n.privacyNotifications,
              description: l10n.privacyNotificationsDesc,
            ),
            _PrivacyStaticItem(
              icon: LucideIcons.globe,
              title: l10n.privacyInternet,
              description: l10n.privacyInternetDesc,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _PrivacyToggleItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;

  const _PrivacyToggleItem({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  State<_PrivacyToggleItem> createState() => _PrivacyToggleItemState();
}

class _PrivacyToggleItemState extends State<_PrivacyToggleItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          onExpansionChanged: (val) => setState(() => _expanded = val),
          leading: Icon(
            widget.icon,
            color: AppTheme.primary,
            size: 20,
          ),
          trailing: Icon(
            _expanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
            color: AppTheme.primary,
            size: 18,
          ),
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.content,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrivacyStaticItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _PrivacyStaticItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.textSecondary, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
