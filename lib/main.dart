import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:brainova/l10n/app_localizations.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/service/notification_service.dart';
import 'core/service/daily_reset_service.dart';
import 'core/localization/locale_provider.dart';
import 'core/theme/theme_provider.dart';

import 'features/gamification/domain/badge_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // try {
    //   await FirebaseAppCheck.instance.activate(
    //     androidProvider: AndroidProvider.debug,
    //     appleProvider: AppleProvider.debug,
    //   );
    // } catch (e) {
    //   debugPrint('App Check initialization failed (non-fatal): $e');
    // }

    await NotificationService().init();
  } catch (e) {
    debugPrint('Initialization error: $e');
  }
  runApp(const ProviderScope(child: BrainovaApp()));
}

class BrainovaApp extends ConsumerWidget {
  const BrainovaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() async {
      // if (!kIsWeb) {
      //   await ref.read(backgroundNotificationServiceProvider).initializeService();
      // }
      ref.read(badgeServiceProvider);
      await ref.read(dailyResetServiceProvider).checkAndResetIfNeeded();
    });

    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Brainova',
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('es'),
        Locale('fr'),
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
