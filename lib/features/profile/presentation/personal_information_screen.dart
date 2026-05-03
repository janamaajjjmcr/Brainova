import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/data/auth_providers.dart';
import 'package:brainova/l10n/app_localizations.dart';

class PersonalInformationScreen extends ConsumerStatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  ConsumerState<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState
    extends ConsumerState<PersonalInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  DateTime? _selectedDate;
  String? _selectedGender;
  String? _selectedCountry;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final user = ref.read(authRepositoryProvider).currentUser;
    _nameController = TextEditingController(text: user?.displayName);
    _phoneController = TextEditingController(text: user?.phoneNumber);
    _selectedDate = user?.dateOfBirth;
    _selectedGender = user?.gender;
    _selectedCountry = user?.country;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    final l10n = AppLocalizations.of(context);
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await ref.read(authRepositoryProvider).updateProfile(
            displayName: _nameController.text.trim(),
            phoneNumber: _phoneController.text.trim().isEmpty
                ? null
                : _phoneController.text.trim(),
            dateOfBirth: _selectedDate,
            gender: _selectedGender,
            country: _selectedCountry,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.personalInfoSavedSuccess)));
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.commonError(e.toString()))));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = ref.watch(userProfileProvider).value;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppTheme.background
          : AppTheme.lightBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.personalInfoTitle,
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold)),
        actions: [
          if (_isLoading)
            const Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CircularProgressIndicator(strokeWidth: 2)))
          else
            TextButton(
              onPressed: _saveProfile,
              child: Text(l10n.personalInfoSave,
                  style: const TextStyle(
                      color: AppTheme.primary, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? AppTheme.surfaceHighlight
                          : AppTheme.lightSurfaceHighlight,
                  child: Text(
                    (user?.displayName != null && user!.displayName!.isNotEmpty
                            ? user.displayName![0]
                            : 'U')
                        .toUpperCase(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black87),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              _buildTextField(l10n.personalInfoFullName, _nameController,
                  LucideIcons.user,
                  validator: (v) =>
                      v!.isEmpty ? l10n.personalInfoRequired : null),
              const SizedBox(height: 20),

              _buildReadOnlyField(l10n.personalInfoEmailAddress,
                  user?.email ?? '', LucideIcons.mail,
                  trailing: Text(
                      user != null &&
                              FirebaseAuth
                                      .instance.currentUser?.emailVerified ==
                              true
                          ? l10n.personalInfoVerified
                          : l10n.personalInfoNotVerified,
                      style: TextStyle(
                          color: user != null &&
                                  FirebaseAuth.instance.currentUser
                                          ?.emailVerified ==
                                      true
                              ? Colors.green
                              : Colors.orange,
                          fontSize: 12))),
              const SizedBox(height: 20),

              _buildTextField(l10n.personalInfoPhoneNumber, _phoneController,
                  LucideIcons.phone,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              _buildPickerField(
                  l10n.personalInfoDateOfBirth,
                  _selectedDate == null
                      ? l10n.personalInfoSelectDate
                      : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                  LucideIcons.calendar, () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ??
                      DateTime.now().subtract(const Duration(days: 365 * 20)),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: Theme.of(context).brightness == Brightness.dark
                            ? const ColorScheme.dark(primary: AppTheme.primary)
                            : const ColorScheme.light(primary: AppTheme.primary),
                      ),
                      child: child!,
                    );
                  },
                );
                if (date != null) setState(() => _selectedDate = date);
              }),
              const SizedBox(height: 20),

              _buildDropdownField(
                  l10n.personalInfoGender,
                  _getLocalizedGender(_selectedGender, l10n),
                  LucideIcons.users,
                  [
                    l10n.personalInfoMale,
                    l10n.personalInfoFemale,
                    l10n.personalInfoPreferNotToSay,
                  ],
                  (v) => setState(() => _selectedGender = v)),
              const SizedBox(height: 20),

              _buildDropdownField(
                  l10n.personalInfoCountry,
                  _getLocalizedCountry(_selectedCountry, l10n),
                  LucideIcons.globe,
                  [
                    l10n.personalInfoCountryUSA,
                    l10n.personalInfoCountryUK,
                    l10n.personalInfoCountryEgypt,
                    l10n.personalInfoCountryUAE,
                    l10n.personalInfoCountrySaudi,
                    l10n.personalInfoCountryKuwait,
                    l10n.personalInfoCountryJordan,
                  ],
                  (v) => setState(() => _selectedCountry = v)),
              const SizedBox(height: 32),

              _buildActionTile(l10n.personalInfoChangePassword, LucideIcons.lock,
                  () => _showChangePasswordDialog()),
              const SizedBox(height: 16),
              _buildActionTile(
                  l10n.personalInfoDeleteAccount, LucideIcons.trash2,
                  () => _showDeleteAccountDialog(),
                  color: AppTheme.error),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {String? Function(String?)? validator, TextInputType? keyboardType}) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: isDark ? AppTheme.textSecondary : AppTheme.lightTextSecondary,
                fontSize: 13)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey, size: 20),
            filled: true,
            fillColor: isDark ? AppTheme.surface : AppTheme.lightSurfaceHighlight,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildReadOnlyField(String label, String value, IconData icon,
      {Widget? trailing}) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: isDark ? AppTheme.textSecondary : AppTheme.lightTextSecondary,
                fontSize: 13)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              color: isDark ? AppTheme.surface : AppTheme.lightSurfaceHighlight,
              borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(icon, color: Colors.grey, size: 20),
            title: Text(value,
                style: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
            trailing: trailing,
          ),
        ),
      ],
    );
  }

  Widget _buildPickerField(
      String label, String value, IconData icon, VoidCallback onTap) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: isDark ? AppTheme.textSecondary : AppTheme.lightTextSecondary,
                fontSize: 13)),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isDark ? AppTheme.surface : AppTheme.lightSurfaceHighlight,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Icon(icon, color: Colors.grey, size: 20),
                const SizedBox(width: 16),
                Text(value,
                    style: TextStyle(color: isDark ? Colors.white : Colors.black87)),
                const Spacer(),
                const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String? value, IconData icon,
      List<String> items, Function(String?) onChanged) {
    final l10n = AppLocalizations.of(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final safeValue = (value != null && items.contains(value)) ? value : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: isDark ? AppTheme.textSecondary : AppTheme.lightTextSecondary,
                fontSize: 13)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: isDark ? AppTheme.surface : AppTheme.lightSurfaceHighlight,
              borderRadius: BorderRadius.circular(16)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: safeValue,
              isExpanded: true,
              dropdownColor: isDark ? AppTheme.surface : AppTheme.lightSurface,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              hint: Text(l10n.personalInfoSelect,
                  style: TextStyle(color: isDark ? Colors.white54 : Colors.black45)),
              items: items
                  .map((String item) => DropdownMenuItem(
                      value: item,
                      child: Text(item,
                          style: TextStyle(
                              color: isDark ? Colors.white : Colors.black87))))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  String? _getLocalizedGender(String? gender, AppLocalizations l10n) {
    if (gender == null) return null;
    if (gender == 'Male' || gender == 'ذكر' || gender == 'Masculino') return l10n.personalInfoMale;
    if (gender == 'Female' || gender == 'أنثى' || gender == 'Femenino') return l10n.personalInfoFemale;
    if (gender == 'Prefer not to say' || gender == 'أفضل عدم الإفصاح' || gender == 'Prefiero no decirlo') {
      return l10n.personalInfoPreferNotToSay;
    }
    return gender;
  }

  String? _getLocalizedCountry(String? country, AppLocalizations l10n) {
    if (country == null) return null;
    final map = {
      'USA': l10n.personalInfoCountryUSA,
      'الولايات المتحدة': l10n.personalInfoCountryUSA,
      'EE.UU.': l10n.personalInfoCountryUSA,
      'UK': l10n.personalInfoCountryUK,
      'المملكة المتحدة': l10n.personalInfoCountryUK,
      'Reino Unido': l10n.personalInfoCountryUK,
      'Egypt': l10n.personalInfoCountryEgypt,
      'مصر': l10n.personalInfoCountryEgypt,
      'Egipto': l10n.personalInfoCountryEgypt,
      'UAE': l10n.personalInfoCountryUAE,
      'الإمارات': l10n.personalInfoCountryUAE,
      'Saudi Arabia': l10n.personalInfoCountrySaudi,
      'السعودية': l10n.personalInfoCountrySaudi,
      'Arabia Saudita': l10n.personalInfoCountrySaudi,
      'Kuwait': l10n.personalInfoCountryKuwait,
      'الكويت': l10n.personalInfoCountryKuwait,
      'Jordan': l10n.personalInfoCountryJordan,
      'الأردن': l10n.personalInfoCountryJordan,
      'Jordania': l10n.personalInfoCountryJordan,
    };

    return map[country] ?? country;
  }

  Widget _buildActionTile(String title, IconData icon, VoidCallback onTap,
      {Color? color}) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveColor = color ?? (isDark ? Colors.white : Colors.black87);
    
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: effectiveColor, size: 20),
      title: Text(title,
          style: TextStyle(color: effectiveColor, fontWeight: FontWeight.bold)),
      trailing:
          Icon(Icons.chevron_right, color: effectiveColor.withValues(alpha: 0.5), size: 16),
      tileColor: isDark ? AppTheme.surface : AppTheme.lightSurfaceHighlight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  void _showChangePasswordDialog() {
    final l10n = AppLocalizations.of(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final currentController = TextEditingController();
    final newController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? AppTheme.surface : AppTheme.lightSurface,
        title: Text(l10n.personalInfoChangePassword,
            style: TextStyle(color: isDark ? Colors.white : Colors.black87)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: currentController,
                style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                decoration: InputDecoration(
                    labelText: l10n.personalInfoCurrentPassword,
                    labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                obscureText: true),
            TextField(
                controller: newController,
                style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                decoration:
                    InputDecoration(
                      labelText: l10n.personalInfoNewPassword,
                      labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                obscureText: true),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => context.pop(),
              child: Text(l10n.personalInfoCancel)),
          TextButton(
            onPressed: () async {
              try {
                await ref
                    .read(authRepositoryProvider)
                    .updatePassword(currentController.text, newController.text);
                if (context.mounted) {
                  context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(l10n.personalInfoPasswordUpdated)));
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(l10n.commonError(e.toString()))));
                }
              }
            },
            child: Text(l10n.personalInfoUpdate),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    final l10n = AppLocalizations.of(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final isGoogle = FirebaseAuth.instance.currentUser?.providerData
            .any((p) => p.providerId == 'google.com') ??
        false;
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? AppTheme.surface : AppTheme.lightSurface,
        title: Text(l10n.personalInfoDeleteAccount,
            style: const TextStyle(color: AppTheme.error)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.personalInfoDeleteWarning,
                style: TextStyle(color: isDark ? Colors.white70 : Colors.black87)),
            if (!isGoogle) ...[
              const SizedBox(height: 16),
              TextField(
                  controller: passwordController,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                  decoration: InputDecoration(
                      labelText: l10n.personalInfoConfirmPassword,
                      labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                  obscureText: true),
            ],
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => context.pop(),
              child: Text(l10n.personalInfoCancel)),
          TextButton(
            onPressed: () async {
              try {
                setState(() => _isLoading = true);
                context.pop();
                await ref.read(authRepositoryProvider).deleteAccount(
                    password: isGoogle ? null : passwordController.text);
                if (mounted) context.go('/login');
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(l10n.commonError(e.toString()))));
                }
              } finally {
                if (mounted) setState(() => _isLoading = false);
              }
            },
            child: Text(
                isGoogle
                    ? l10n.personalInfoConfirmWithGoogle
                    : l10n.personalInfoDelete,
                style: const TextStyle(color: AppTheme.error)),
          ),
        ],
      ),
    );
  }
}
