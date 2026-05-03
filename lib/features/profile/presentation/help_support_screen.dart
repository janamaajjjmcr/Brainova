import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_theme.dart';
import 'package:brainova/l10n/app_localizations.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.helpTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(l10n.helpFaq),
            const SizedBox(height: 16),
            _FAQToggleItem(
              question: l10n.helpQ1,
              answer: l10n.helpA1,
            ),
            _FAQToggleItem(
              question: l10n.helpQ2,
              answer: l10n.helpA2,
            ),
            _FAQToggleItem(
              question: l10n.helpQ3,
              answer: l10n.helpA3,
            ),
            _FAQToggleItem(
              question: l10n.helpQ4,
              answer: l10n.helpA4,
            ),
            _FAQToggleItem(
              question: l10n.helpQ5,
              answer: l10n.helpA5,
            ),
            _FAQToggleItem(
              question: l10n.helpQ6,
              answer: l10n.helpA6,
            ),
            _FAQToggleItem(
              question: l10n.helpQ7,
              answer: l10n.helpA7,
            ),
            _FAQToggleItem(
              question: l10n.helpQ8,
              answer: l10n.helpA8,
            ),
            _FAQToggleItem(
              question: l10n.helpQ9,
              answer: l10n.helpA9,
            ),
            const SizedBox(height: 32),
            _buildSectionHeader(l10n.helpTroubleshooting),
            const SizedBox(height: 16),
            _FAQStaticItem(
              question: l10n.helpT1Q,
              answer: l10n.helpT1A,
              icon: LucideIcons.alertCircle,
              color: AppTheme.warning,
            ),
            _FAQStaticItem(
              question: l10n.helpT2Q,
              answer: l10n.helpT2A,
              icon: LucideIcons.helpCircle,
              color: AppTheme.primary,
            ),
            _FAQStaticItem(
              question: l10n.helpT3Q,
              answer: l10n.helpT3A,
              icon: LucideIcons.bell,
              color: AppTheme.primary,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppTheme.primary,
      ),
    );
  }
}

class _FAQToggleItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQToggleItem({required this.question, required this.answer});

  @override
  State<_FAQToggleItem> createState() => _FAQToggleItemState();
}

class _FAQToggleItemState extends State<_FAQToggleItem> {
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
          trailing: Icon(
            _expanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
            color: AppTheme.primary,
            size: 18,
          ),
          title: Text(
            widget.question,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.answer,
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

class _FAQStaticItem extends StatelessWidget {
  final String question;
  final String answer;
  final IconData icon;
  final Color color;

  const _FAQStaticItem({
    required this.question,
    required this.answer,
    required this.icon,
    required this.color,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
