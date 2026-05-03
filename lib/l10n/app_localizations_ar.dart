// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'برينوفا';

  @override
  String get navDiet => 'النظام';

  @override
  String get navReset => 'إعادة';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navRewire => 'إعادة البرمجة';

  @override
  String get navProfile => 'الملف';

  @override
  String get navAdmin => 'المدير';

  @override
  String get adminDashboardTitle => 'نظرة عامة على لوحة القيادة';

  @override
  String get adminChallengeManagement => 'إدارة التحديات';

  @override
  String get adminUserManagement => 'إدارة المستخدمين';

  @override
  String get adminAnalyticsReports => 'التحليلات والتقارير';

  @override
  String get adminBadgeManagement => 'إدارة الأوسمة';

  @override
  String get adminAppSettings => 'مركز معلومات برينوفا';

  @override
  String get adminExit => 'خروج من الإدارة';

  @override
  String get adminBackToOverview => 'العودة لنظرة عامة';

  @override
  String get adminSystemHealth => 'صحة النظام';

  @override
  String get adminTotalUsers => 'إجمالي المستخدمين';

  @override
  String get adminActiveToday => 'النشطون اليوم';

  @override
  String get adminAvgBrain_rot => 'متوسط تعفن الدماغ';

  @override
  String get adminResetsDone => 'عمليات إعادة الضبط';

  @override
  String get adminManagementActions => 'إجراءات الإدارة';

  @override
  String get adminHome => 'الرئيسية';

  @override
  String get adminChallenges => 'التحديات';

  @override
  String get adminUsers => 'المستخدمون';

  @override
  String get adminStats => 'الإحصائيات';

  @override
  String get adminBadges => 'الأوسمة';

  @override
  String get adminInfo => 'المعلومات';

  @override
  String get adminSettings => 'الإعدادات';

  @override
  String get homeQuickActions => 'الإجراءات السريعة';

  @override
  String get homeMindReset => 'إعادة تشغيل الذهن';

  @override
  String get homeRewireMode => 'وضع إعادة البرمجة';

  @override
  String get homeRealityCheck => 'فحص الواقع';

  @override
  String get homeContentDiet => 'نظام المحتوى';

  @override
  String get homeDaysLabel => 'أيام';

  @override
  String get brainRotMeterTitle => 'مقياس تعفن الدماغ';

  @override
  String get brainRotStatusHealthy => 'صحي';

  @override
  String get brainRotStatusCaution => 'تحذير';

  @override
  String get brainRotStatusDanger => 'خطر';

  @override
  String get brainRotCurrentStreak => 'الأيام المتتالية';

  @override
  String brainRotDays(int count) {
    return '$count أيام';
  }

  @override
  String get brainRotMindResets => 'إعادة تشغيل';

  @override
  String challengePeopleJoined(int count) {
    return '$count شخص انضم';
  }

  @override
  String get challengeJoin => 'انضم للتحدي';

  @override
  String get challengeCompleted => 'اكتمل';

  @override
  String get challengeActive => 'التحدي نشط';

  @override
  String get challengeLeave => 'مغادرة التحدي';

  @override
  String get challengeLeaveTitle => 'مغادرة التحدي';

  @override
  String get challengeLeaveBody => 'هل أنت متأكد أنك تريد مغادرة التحدي؟';

  @override
  String get challengeCancel => 'إلغاء';

  @override
  String get challengeDone => 'تم';

  @override
  String challengeDonePercent(int percent) {
    return '$percent% مكتمل';
  }

  @override
  String challengeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام',
      two: 'يومان',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get badgeLocked => 'مغلق';

  @override
  String get badgeEarned => 'محقق';

  @override
  String homeDaysStreak(int count) {
    return '$count أيام';
  }

  @override
  String get profileYourStatistics => 'إحصائياتك';

  @override
  String get profileTrackDailyMood => 'تتبع مزاجك اليومي';

  @override
  String get profileAccount => 'الحساب';

  @override
  String get profileMore => 'المزيد';

  @override
  String get profilePersonalInformation => 'المعلومات الشخصية';

  @override
  String get profilePrivacySecurity => 'الخصوصية والأمان';

  @override
  String get profileHelpSupport => 'المساعدة والدعم';

  @override
  String get profileSignOut => 'تسجيل الخروج';

  @override
  String get profileLanguage => 'اللغة';

  @override
  String get profileCompleteDailyTask => 'أكمل المهمة اليومية';

  @override
  String get profileSelectLanguage => 'اختر اللغة';

  @override
  String get profileTheme => 'الوضع الداكن';

  @override
  String get profileResets => 'عمليات الإعادة';

  @override
  String get profileDayStreak => 'أيام متتالية';

  @override
  String get profilePointsToday => 'نقاط اليوم';

  @override
  String get profileTasksDone => 'المهام المنجزة';

  @override
  String get loginWelcomeBack => 'مرحباً بعودتك';

  @override
  String get loginSubtitle => 'واصل رحلتك نحو عقل أكثر صحة';

  @override
  String get loginEmailHint => 'Example@gmail.com';

  @override
  String get loginPasswordHint => 'كلمة المرور (8+ أحرف، رقم، حرف كبير، رمز)';

  @override
  String get loginForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get loginNoAccount => 'ليس لديك حساب؟';

  @override
  String get loginSignUp => 'إنشاء حساب';

  @override
  String get loginOr => 'أو';

  @override
  String get loginContinueWithGoogle => 'المتابعة باستخدام Google';

  @override
  String get signupCreateAccount => 'إنشاء حساب';

  @override
  String get signupSubtitle => 'ابدأ رحلة إزالة السموم الرقمية اليوم';

  @override
  String get signupFullName => 'الاسم الكامل';

  @override
  String get signupEmailHint => 'Example@gmail.com';

  @override
  String get signupPasswordHint => 'كلمة المرور (8+ أحرف، رقم، حرف كبير، رمز)';

  @override
  String get signupConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get signupButton => 'إنشاء حساب';

  @override
  String get signupOr => 'أو';

  @override
  String get signupContinueWithGoogle => 'المتابعة باستخدام Google';

  @override
  String get signupAlreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get signupLogIn => 'تسجيل الدخول';

  @override
  String get signupPasswordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get signupSuccess =>
      'تم إنشاء الحساب! تم إرسال بريد إلكتروني للتحقق إلى صندوق بريدك.';

  @override
  String get realityCheckTitle => 'فحص الواقع';

  @override
  String get realityCheckPleaseLogin => 'يرجى تسجيل الدخول';

  @override
  String get realityCheckSuggestedAction => 'الإجراء المقترح';

  @override
  String get realityCheckStartMindReset => 'ابدأ إعادة تشغيل الذهن';

  @override
  String get realityCheckTryRewireMode => 'جرب وضع إعادة البرمجة';

  @override
  String get realityCheckStatusHealthy => 'صحي';

  @override
  String get realityCheckStatusCaution => 'تحذير';

  @override
  String get realityCheckStatusDanger => 'خطر';

  @override
  String get realityCheckMessageHealthy =>
      'توازنك الرقمي يبدو مستقراً. استمر على ذلك.';

  @override
  String get realityCheckMessageCaution =>
      'أنت تميل نحو التحفيز العالي. فكر في إعادة التشغيل.';

  @override
  String get realityCheckMessageDanger =>
      'تم اكتشاف تحفيز عالٍ. قد تؤثر عاداتك الرقمية على تركيزك.';

  @override
  String get realityCheckNoActivity => 'لم يتم اكتشاف نشاط ملحوظ.';

  @override
  String get realityCheckCategorySocial => 'اجتماعي';

  @override
  String get realityCheckCategoryJunk => 'مضيعة للوقت';

  @override
  String get realityCheckCategoryLearning => 'تعليم';

  @override
  String get realityCheckCategoryEntertainment => 'ترفيه';

  @override
  String get realityCheckCategoryNeutral => 'محايد';

  @override
  String get realityCheckSummary => 'ملخص النشاط';

  @override
  String get rewireSubmitAnswer => 'إرسال الإجابة';

  @override
  String get rewireTypeAnswer => 'اكتب إجابتك هنا...';

  @override
  String rewireCorrect(int points) {
    return 'صحيح! -$points نقطة فساد';
  }

  @override
  String get rewireIncorrect => 'خطأ، حاول مجدداً!';

  @override
  String get rewireTryAgain => 'حاول مجدداً';

  @override
  String get rewireExit => 'خروج';

  @override
  String get rewireNextTask => 'المهمة التالية';

  @override
  String get mindResetBreathing => 'التنفس';

  @override
  String get mindResetAudio => 'الصوت';

  @override
  String get mindResetStretch => 'الإطالة';

  @override
  String get mindResetJournaling => 'التدوين';

  @override
  String get mindResetMeditation => 'التأمل';

  @override
  String mindResetStepOf(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get mindResetInstructions => 'التعليمات';

  @override
  String get mindResetActivityCompleted => 'اكتملت النشاط!';

  @override
  String get mindResetDone => 'تم';

  @override
  String get mindResetFocusOnSound => 'ركز على الصوت...';

  @override
  String get mindResetPressPlay => 'اضغط تشغيل للبدء';

  @override
  String mindResetMin(int count) {
    return '$count دقيقة';
  }

  @override
  String get mindResetClearMind => 'صفِّ ذهنك ودع الأفكار تتدفق...';

  @override
  String get mindResetTitle1 => 'تنفس المربع';

  @override
  String get mindResetDesc1 =>
      'تقنية تنفس قوية تستخدم لتهدئة العقل بسرعة وإعادة ضبط جهازك العصبي.';

  @override
  String get mindResetTitle2 => 'إعادة ضبط الرقبة والكتف';

  @override
  String get mindResetDesc2 =>
      'تخلص من التوتر في رقبتك وكتفيك بعد فترات طويلة من وقت الشاشة.';

  @override
  String get mindResetTitle3 => 'أصوات المطر';

  @override
  String get mindResetDesc3 => 'دع صوت المطر يغسل الضوضاء الذهنية.';

  @override
  String get mindResetTitle4 => 'تمرين العين';

  @override
  String get mindResetDesc4 =>
      'إنعاش العيون المتعبة وتقليل الإجهاد بعد جلسات طويلة من استخدام الشاشة.';

  @override
  String get mindResetTitle5 => 'تفريغ الدماغ';

  @override
  String get mindResetDesc5 =>
      'فرغ أفكارك على الورق لتصفية ذهنك واستعادة التركيز.';

  @override
  String get mindResetTitle6 => 'التخلص من السموم الرقمية';

  @override
  String get mindResetDesc6 => 'ضع هاتفك جانباً وأعد الاتصال بالواقع.';

  @override
  String get mindResetStep1_1 => 'استنشق من خلال أنفك لمدة 4 ثوانٍ.';

  @override
  String get mindResetStep1_2 => 'احبس أنفاسك لمدة 4 ثوانٍ.';

  @override
  String get mindResetStep1_3 => 'أخرج زفيراً ببطء لمدة 4 ثوانٍ.';

  @override
  String get mindResetStep1_4 => 'ابقَ فارغاً لمدة 4 ثوانٍ. كرر العملية.';

  @override
  String get mindResetStep2_1 => 'اجلس بشكل مستقيم مع استرخاء الكتفين.';

  @override
  String get mindResetStep2_2 =>
      'أنزل أذنك اليمنى إلى كتفك الأيمن. ابقَ 10 ثوانٍ.';

  @override
  String get mindResetStep2_3 => 'دحرج رأسك للأمام نحو صدرك. ابقَ 10 ثوانٍ.';

  @override
  String get mindResetStep2_4 =>
      'أنزل أذنك اليسرى إلى كتفك الأيسر. ابقَ 10 ثوانٍ.';

  @override
  String get mindResetStep2_5 => 'دحرج كتفيك للخلف 5 مرات.';

  @override
  String get mindResetStep2_6 => 'مد ذراعيك فوق رأسك.';

  @override
  String get mindResetStep3_1 => 'ضع سماعات الرأس.';

  @override
  String get mindResetStep3_2 => 'أغمض عينيك أو خفف نظرك.';

  @override
  String get mindResetStep3_3 => 'دع الصوت يملأ انتباهك بالكامل.';

  @override
  String get mindResetStep3_4 => 'كلما شرد ذهنك، عد إلى صوت المطر.';

  @override
  String get mindResetStep4_1 =>
      'انظر للأعلى لثلاث ثوانٍ، ثم للأسفل لثلاث ثوانٍ. كرر 3 مرات.';

  @override
  String get mindResetStep4_2 =>
      'انظر لليمين لثلاث ثوانٍ، ثم لليسار لثلاث ثوانٍ. كرر 3 مرات.';

  @override
  String get mindResetStep4_3 =>
      'انظر لأعلى اليسار 3 ثوانٍ، ثم لأعلى اليمين 3 ثوانٍ. كرر 3 مرات.';

  @override
  String get mindResetStep4_4 =>
      'دحرج مقل عينيك 3 مرات لليمين، ثم 3 مرات لليسار. ارمش للاسترخاء.';

  @override
  String get mindResetStep4_5 => 'أغمض عينيك بشدة لمدة 10 ثوانٍ. استرخِ.';

  @override
  String get mindResetStep4_6 =>
      'افتح عينيك على اتساعهما لمدة 10 ثوانٍ. ارمش بشكل متكرر للإنهاء.';

  @override
  String get mindResetStep5_1 => 'افتح تطبيق ملاحظات أو أحضر ورقة.';

  @override
  String get mindResetStep5_2 => 'اكتب كل فكرة أو قلق أو مهمة.';

  @override
  String get mindResetStep5_3 => 'لا تصفِّ أو تحكم، فقط اكتب.';

  @override
  String get mindResetStep5_4 => 'اشطب الأشياء التي لا يمكنك التحكم فيها.';

  @override
  String get mindResetStep5_5 => 'ضع دائرة حول الشيء الوحيد الأكثر أهمية.';

  @override
  String get mindResetStep6_1 => 'ضع هاتفك جانباً وابتعد عن الشاشة.';

  @override
  String get mindResetStep6_2 => 'خذ نفساً عميقاً وبطيئاً وأرخِ جسمك.';

  @override
  String get mindResetStep6_3 => 'انظر حولك ولاحظ محيطك.';

  @override
  String get mindResetStep6_4 => 'ركز على اللحظة الحالية بدلاً من جهازك.';

  @override
  String get mindResetStep6_5 => 'استمتع باستراحة قصيرة من التحفيز الرقمي.';

  @override
  String get contentDietLogContent => 'تسجيل المحتوى';

  @override
  String get contentDietHowDidYouSpend => 'كيف قضيت وقتك؟';

  @override
  String get contentDietRecentLogs => 'السجلات الأخيرة';

  @override
  String get contentDietDuration => 'المدة (بالدقائق)';

  @override
  String get contentDietNotes => 'ملاحظات (اختياري)';

  @override
  String get contentDietSaveEntry => 'حفظ السجل';

  @override
  String get contentDietEntryAdded => 'تمت الإضافة!';

  @override
  String get contentDietNoEntries => 'لا توجد سجلات بعد.';

  @override
  String get contentDietWeeklySummary => 'الملخص الأسبوعي';

  @override
  String get contentDietNoData => 'لا توجد بيانات';

  @override
  String get contentDietLearning => 'تعليم';

  @override
  String get contentDietEntertainment => 'ترفيه';

  @override
  String get contentDietJunk => 'مضيعة';

  @override
  String get contentDietSocial => 'اجتماعي';

  @override
  String get contentDietLearningFull => 'تعليم';

  @override
  String get contentDietEntertainmentFull => 'ترفيه';

  @override
  String get contentDietJunkFull => 'مضيعة';

  @override
  String get contentDietSocialFull => 'اجتماعي';

  @override
  String get achievementsTitle => 'الإنجازات';

  @override
  String achievementsUnlocked(int count, int total) {
    return '$count / $total مفتوحة';
  }

  @override
  String get achievementsNoBadges => 'لا توجد شارات متاحة بعد.';

  @override
  String streakDayStreak(int count) {
    return 'سلسلة $count أيام';
  }

  @override
  String get streakKeepItUp => 'استمر!';

  @override
  String get challengesNone =>
      'لا توجد تحديات نشطة بعد.\nلم يُنشئ المدير أي منها.';

  @override
  String get accessRestricted => 'الوصول مقيد';

  @override
  String get accessRestrictedBody =>
      'تم تقييد حسابك من قِبل المدير. يرجى التواصل مع الدعم إذا كنت تعتقد أن هذا خطأ.';

  @override
  String get logOut => 'تسجيل الخروج';

  @override
  String errorGeneric(String message) {
    return 'خطأ: $message';
  }

  @override
  String get privacyTitle => 'الخصوصية والأمان';

  @override
  String get privacyDataCollection => 'جمع البيانات';

  @override
  String get privacyDataCollectionContent =>
      'تجمع برينوفا بيانات استخدام تطبيقاتك على جهازك لحساب مقياس تعفن الدماغ ورؤى فحص الواقع. تُخزَّن هذه البيانات بشكل آمن في حسابك الشخصي ولا تُشارَك أبداً مع أطراف ثالثة.';

  @override
  String get privacyWhatWeTrack => 'ما الذي نتتبعه';

  @override
  String get privacyWhatWeTrackContent =>
      'نتتبع التطبيقات التي تستخدمها ومدة استخدامها. يشمل ذلك تطبيقات الترفيه ووسائل التواصل الاجتماعي وأدوات الإنتاجية. لا نصل إلى محتوى تطبيقاتك أو رسائلك.';

  @override
  String get privacyDataSecurity => 'أمان البيانات';

  @override
  String get privacyDataSecurityContent =>
      'يتم تخزين بياناتك بأمان باستخدام Firebase. الوصول إلى بيانات نشاطك محمي عبر المصادقة والاتصالات المشفرة للحفاظ على أمان معلوماتك.';

  @override
  String get privacyYourRights => 'حقوقك';

  @override
  String get privacyYourRightsContent =>
      'لديك الحق في حذف بياناتك في أي وقت. يمكنك أيضاً إلغاء أذونات استخدام التطبيقات من إعدادات جهازك في أي وقت. سيؤدي حذف حسابك إلى إزالة جميع بياناتك المخزنة بشكل دائم.';

  @override
  String get privacyReliabilitySettings => 'إعدادات الموثوقية';

  @override
  String get privacyBackgroundAlerts => 'التنبيهات في الخلفية';

  @override
  String get privacyBackgroundAlertsDesc =>
      'لتلقي التنبيهات حتى عندما لا تستخدم التطبيق، يرجى التأكد من تفعيل استخدام البطارية \"غير المقيد\" لبرينوفا.';

  @override
  String get privacyEnableReliableAlerts => 'تفعيل التنبيهات الموثوقة';

  @override
  String get privacyPermissionsUsed => 'الأذونات المستخدمة';

  @override
  String get privacyUsageAccess => 'وصول الاستخدام';

  @override
  String get privacyUsageAccessDesc =>
      'وصول الاستخدام — لتتبع التطبيقات التي تستخدمها.';

  @override
  String get privacyNotifications => 'الإشعارات';

  @override
  String get privacyNotificationsDesc =>
      'الإشعارات — لتنبيهك عند ارتفاع درجات تعفن الدماغ.';

  @override
  String get privacyInternet => 'الإنترنت';

  @override
  String get privacyInternetDesc => 'الإنترنت — لمزامنة بياناتك بأمان.';

  @override
  String get helpTitle => 'المساعدة والدعم';

  @override
  String get helpFaq => 'الأسئلة الشائعة';

  @override
  String get helpTroubleshooting => 'استكشاف الأخطاء';

  @override
  String get helpQ1 => 'ما هو مقياس تعفن الدماغ؟';

  @override
  String get helpA1 =>
      'يقيس مقياس تعفن الدماغ عادات استهلاكك الرقمي خلال الـ 24 ساعة الماضية. كلما ارتفعت الدرجة، زاد الوقت الذي قضيته في أنشطة الشاشة غير المنتجة. تستند الدرجة إلى نشاطك خلال الـ 24 ساعة الماضية وتتحدث تلقائياً على مدار اليوم.';

  @override
  String get helpQ2 => 'كيف تُحسب درجتي؟';

  @override
  String get helpA2 =>
      'تعتمد درجتك على مدة استخدامك لتطبيقات معينة. تطبيقات الترفيه ووسائل التواصل الاجتماعي ترفع درجتك، بينما تطبيقات التعلم والإنتاجية تخفضها. كما تساهم جلسات إعادة تشغيل الذهن وإعادة البرمجة في تخفيض درجتك.';

  @override
  String get helpQ3 => 'ما هي إعادة تشغيل الذهن؟';

  @override
  String get helpA3 =>
      'إعادة تشغيل الذهن هي نشاط قصير يساعد على مكافحة تعفن الدماغ. يؤدي إكمالها إلى تخفيض درجة تعفن دماغك بشكل ملحوظ.';

  @override
  String get helpQ4 => 'ما هو وضع إعادة البرمجة؟';

  @override
  String get helpA4 =>
      'يمنحك وضع إعادة البرمجة مهاماً منتجة لتحل محل وقت الشاشة السلبي. يكسبك إتمام مهام إعادة البرمجة نقاطاً ويخفض درجة تعفن دماغك.';

  @override
  String get helpQ5 => 'لماذا يحتاج التطبيق إذن وصول الاستخدام؟';

  @override
  String get helpA5 =>
      'يتيح إذن وصول الاستخدام لبرينوفا اكتشاف التطبيقات التي تستخدمها ومدة استخدامها. بدون هذا الإذن، لا يستطيع التطبيق تتبع عاداتك الرقمية تلقائياً.';

  @override
  String get helpQ6 => 'كيف أحسّن درجتي؟';

  @override
  String get helpA6 =>
      'استخدم تطبيقات التعلم، وأكمل جلسات إعادة تشغيل الذهن، وقم بمهام إعادة البرمجة، وقلل استهلاك وسائل التواصل الاجتماعي والترفيه، وحافظ على سلسلة يومية.';

  @override
  String get helpQ7 => 'هل بياناتي خاصة؟';

  @override
  String get helpA7 =>
      'نعم. تُخزَّن بياناتك بشكل آمن ولا يمكن الوصول إليها إلا من خلالك. نحن لا نشارك بيانات استخدامك الشخصية مع أطراف ثالثة أبداً.';

  @override
  String get helpQ8 => 'كيف أحذف بياناتي؟';

  @override
  String get helpA8 =>
      'يمكنك حذف حسابك من شاشة الملف الشخصي. سيؤدي ذلك إلى إزالة وصولك وبيانات نشاطك المرتبطة بشكل دائم.';

  @override
  String get helpQ9 => 'ما الفرق بين مقياس تعفن الدماغ وفحص الواقع؟';

  @override
  String get helpA9 =>
      'يُظهر مقياس تعفن الدماغ درجة التحفيز الإجمالية بناءً على نشاطك خلال الـ 24 ساعة الماضية. يحلل فحص الواقع توازن عاداتك الرقمية ويقدم رؤى حول ما إذا كان استخدامك الحالي صحياً أم مفرط التحفيز.';

  @override
  String get helpT1Q => 'لماذا لا تتحدث درجتي؟';

  @override
  String get helpT1A =>
      'تأكد من تفعيل إذن وصول الاستخدام لبرينوفا حتى يتمكن التطبيق من اكتشاف التطبيقات التي تستخدمها. تأكد أيضاً من أن التطبيق غير مقيد بإعدادات تحسين البطارية. قد يستغرق تسجيل بيانات النشاط الجديدة وعكسها في درجتك بعض الوقت.';

  @override
  String get helpT2Q => 'هل يمكنني إعادة تعيين درجة تعفن دماغي يدوياً؟';

  @override
  String get helpT2A =>
      'تُحسب درجة تعفن الدماغ من نشاطك خلال الـ 24 ساعة الماضية، لذا تنخفض تدريجياً مع انتهاء صلاحية النشاط القديم. يمكن أيضاً لإكمال أنشطة إعادة تشغيل الذهن أو مهام إعادة البرمجة المساعدة في تخفيض درجتك خلال اليوم.';

  @override
  String get helpT3Q => 'لماذا أتلقى إشعارات؟';

  @override
  String get helpT3A =>
      'ترسل برينوفا إشعارات لمساعدتك على الوعي بعاداتك الرقمية. قد تتلقى تنبيهات عند ارتفاع درجة تعفن دماغك أو تذكيرات لإكمال نشاط إعادة تشغيل الذهن أو إعادة البرمجة.';

  @override
  String get personalInfoTitle => 'المعلومات الشخصية';

  @override
  String get personalInfoSave => 'حفظ';

  @override
  String get personalInfoFullName => 'الاسم الكامل';

  @override
  String get personalInfoEmailAddress => 'البريد الإلكتروني';

  @override
  String get personalInfoVerified => 'موثّق';

  @override
  String get personalInfoNotVerified => 'غير موثّق';

  @override
  String get personalInfoPhoneNumber => 'رقم الهاتف';

  @override
  String get personalInfoDateOfBirth => 'تاريخ الميلاد';

  @override
  String get personalInfoSelectDate => 'اختر التاريخ';

  @override
  String get personalInfoGender => 'الجنس';

  @override
  String get personalInfoMale => 'ذكر';

  @override
  String get personalInfoFemale => 'أنثى';

  @override
  String get personalInfoPreferNotToSay => 'أفضل عدم الإفصاح';

  @override
  String get personalInfoCountry => 'البلد / المنطقة';

  @override
  String get personalInfoSelect => 'اختر';

  @override
  String get personalInfoRequired => 'مطلوب';

  @override
  String get personalInfoSavedSuccess => 'تم حفظ الملف الشخصي بنجاح';

  @override
  String get personalInfoChangePassword => 'تغيير كلمة المرور';

  @override
  String get personalInfoDeleteAccount => 'حذف الحساب';

  @override
  String get personalInfoCurrentPassword => 'كلمة المرور الحالية';

  @override
  String get personalInfoNewPassword => 'كلمة المرور الجديدة';

  @override
  String get personalInfoCancel => 'إلغاء';

  @override
  String get personalInfoUpdate => 'تحديث';

  @override
  String get personalInfoPasswordUpdated => 'تم تحديث كلمة المرور';

  @override
  String get personalInfoDeleteWarning =>
      'هذا الإجراء لا رجعة فيه. سيتم حذف جميع بياناتك بشكل دائم.';

  @override
  String get personalInfoConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get personalInfoConfirmWithGoogle => 'التأكيد عبر Google';

  @override
  String get personalInfoDelete => 'حذف';

  @override
  String get personalInfoCountryUSA => 'الولايات المتحدة';

  @override
  String get personalInfoCountryUK => 'المملكة المتحدة';

  @override
  String get personalInfoCountryEgypt => 'مصر';

  @override
  String get personalInfoCountryUAE => 'الإمارات';

  @override
  String get personalInfoCountrySaudi => 'السعودية';

  @override
  String get personalInfoCountryKuwait => 'الكويت';

  @override
  String get personalInfoCountryJordan => 'الأردن';

  @override
  String get badgeCelebrationNewAchievement => 'إنجاز جديد';

  @override
  String get badgeCelebrationAwesome => 'رائع!';

  @override
  String get badgeUnitDays => 'أيام';

  @override
  String get badgeUnitSessions => 'جلسات';

  @override
  String get badgeUnitTasks => 'مهام';

  @override
  String get badgeUnitEntries => 'مدخلات';

  @override
  String get badgeUnitLogin => 'مرات تسجيل الدخول';

  @override
  String get badgeUnitCompleted => 'مكتمل';

  @override
  String get badgeTitleWelcome => 'بداية جديدة';

  @override
  String get badgeDescWelcome =>
      'لقد اتخذت الخطوة الأولى نحو حياة أفضل. مرحباً بك في برينوفا!';

  @override
  String get badgeTitleStreak3 => 'الشرارة';

  @override
  String get badgeDescStreak3 =>
      'سلسلة من 3 أيام هي الشرارة التي تشعل نار التغيير. استمر!';

  @override
  String get badgeTitleStreak7 => 'زخم نقي';

  @override
  String get badgeDescStreak7 =>
      'أسبوع كامل من النجاح! بدأ دماغك في إعادة برمجة نفسه.';

  @override
  String get badgeTitleMindReset5 => 'سيد إعادة تشغيل الذهن';

  @override
  String get badgeDescMindReset5 =>
      'أكملت 5 جلسات إعادة تشغيل. سلامك النفسي ينمو!';

  @override
  String get badgeTitleStreak30 => 'لا يتوقف';

  @override
  String get badgeDescStreak30 =>
      '30 يوماً من الانضباط. أنت الآن تسيطر على بيولوجيتك الخاصة.';

  @override
  String get badgeTitleProfileComplete => 'هوية كاملة';

  @override
  String get badgeDescProfileComplete =>
      'ملفك الشخصي مكتمل تماماً! أنت الآن معروف بالكامل.';

  @override
  String get badgeTitleContentDiet10 => 'مكتشف نظام المحتوى';

  @override
  String get badgeDescContentDiet10 =>
      'سجلت 10 عناصر في نظام المحتوى الخاص بك. الوعي هو المفتاح!';

  @override
  String get authOr => 'أو';

  @override
  String get authContinueWithGoogle => 'المتابعة باستخدام Google';

  @override
  String get authDontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get authHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get authForgotSuccess =>
      'تم إرسال رابط إعادة التعيين إلى بريدك الإلكتروني!';

  @override
  String get authAccountCreated =>
      'تم إنشاء الحساب! تم إرسال بريد إلكتروني للتحقق إلى صندوق بريدك.';

  @override
  String get authEmailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get introSlogan => 'حول تعفن الدماغ إلى نمو للدماغ';

  @override
  String get introGetStarted => 'ابدأ الآن';

  @override
  String get introWelcome => 'مرحباً بك في برينوفا🧠';

  @override
  String get introDescription =>
      'تساعدك برينوفا على التحرر من دورة التحفيز الزائد. أعد برمجة دماغك، واستعد تركيزك، وابدأ العيش بهدف.';

  @override
  String get introStartUsing => 'ابدأ استخدام برينوفا';

  @override
  String get permissionTitle => 'تفعيل وصول الاستخدام';

  @override
  String get permissionDescription =>
      'تحتاج برينوفا إلى وصول الاستخدام لمراقبة عاداتك الرقمية وحساب درجة تعفن الدماغ. تبقى هذه البيانات على جهازك ولا تتم مشاركتها أبداً.';

  @override
  String get permissionOpenSettings => 'افتح الإعدادات';

  @override
  String get commonUser => 'مستخدم';

  @override
  String commonError(String error) {
    return 'خطأ: $error';
  }

  @override
  String get rewireTask1Title => 'أسئلة العواصم';

  @override
  String get rewireTask1Content => 'ما هي عاصمة منغوليا؟';

  @override
  String get rewireTask1Option1 => 'أولان باتور';

  @override
  String get rewireTask1Option2 => 'أستانا';

  @override
  String get rewireTask1Option3 => 'كاتماندو';

  @override
  String get rewireTask1Option4 => 'تيمفو';

  @override
  String get rewireTask2Title => 'لغز رياضيات';

  @override
  String get rewireTask2Content => 'ما هي قيمة 15% من 80؟';

  @override
  String get rewireTask2Option1 => '12';

  @override
  String get rewireTask2Option2 => '10';

  @override
  String get rewireTask2Option3 => '15';

  @override
  String get rewireTask2Option4 => '14';

  @override
  String get rewireTask3Title => 'الامتنان';

  @override
  String get rewireTask3Content => 'اذكر 3 أشياء تشعر بالامتنان لها الآن.';

  @override
  String get rewireTask4Title => 'منطق الأنماط';

  @override
  String get rewireTask4Content => 'إذا كان A=1، B=2، C=3، فما هي كلمة BAD؟';

  @override
  String get rewireTask4Option1 => '214';

  @override
  String get rewireTask4Option2 => '216';

  @override
  String get rewireTask4Option3 => '124';

  @override
  String get rewireTask4Option4 => '142';

  @override
  String get rewireTask5Title => 'رياضيات سريعة';

  @override
  String get rewireTask5Content => 'ما هو ناتج 7 × 8؟';

  @override
  String get rewireTask5Option1 => '54';

  @override
  String get rewireTask5Option2 => '56';

  @override
  String get rewireTask5Option3 => '58';

  @override
  String get rewireTask5Option4 => '62';

  @override
  String get rewireTask6Title => 'اختبار الألوان';

  @override
  String get rewireTask6Content => 'أي لون يرتبط بكلمة \"حسد\"؟';

  @override
  String get rewireTask6Option1 => 'أحمر';

  @override
  String get rewireTask6Option2 => 'أخضر';

  @override
  String get rewireTask6Option3 => 'أزرق';

  @override
  String get rewireTask6Option4 => 'أصفر';

  @override
  String get rewireTask7Title => 'منطق المتواليات';

  @override
  String get rewireTask7Content => '2، 4، 8، 16، ...؟';

  @override
  String get rewireTask7Option1 => '24';

  @override
  String get rewireTask7Option2 => '30';

  @override
  String get rewireTask7Option3 => '32';

  @override
  String get rewireTask7Option4 => '64';

  @override
  String get rewireTask8Title => 'اليقظة';

  @override
  String get rewireTask8Content => 'سمِّ شيئاً واحداً يمكنك شمه الآن.';

  @override
  String get rewireTask9Title => 'الجغرافيا';

  @override
  String get rewireTask9Content => 'في أي قارة تقع الصحراء الكبرى؟';

  @override
  String get rewireTask9Option1 => 'آسيا';

  @override
  String get rewireTask9Option2 => 'أفريقيا';

  @override
  String get rewireTask9Option3 => 'أمريكا الجنوبية';

  @override
  String get rewireTask9Option4 => 'أستراليا';

  @override
  String get rewireTask10Title => 'الكود الثنائي';

  @override
  String get rewireTask10Content => 'ما هي قيمة 1010 بالنظام العشري؟';

  @override
  String get rewireTask10Option1 => '8';

  @override
  String get rewireTask10Option2 => '10';

  @override
  String get rewireTask10Option3 => '12';

  @override
  String get rewireTask10Option4 => '5';

  @override
  String get rewireTask11Title => 'تداعي الكلمات';

  @override
  String get rewireTask11Content => 'عكس كلمة \"محسن\" (Benevolent)؟';

  @override
  String get rewireTask11Option1 => 'طيب';

  @override
  String get rewireTask11Option2 => 'شرير';

  @override
  String get rewireTask11Option3 => 'سخي';

  @override
  String get rewireTask11Option4 => 'سعيد';

  @override
  String get rewireTask12Title => 'أسئلة البرمجة';

  @override
  String get rewireTask12Content => 'أي لغة تُستخدم لبرمجة Flutter؟';

  @override
  String get rewireTask12Option1 => 'Java';

  @override
  String get rewireTask12Option2 => 'Python';

  @override
  String get rewireTask12Option3 => 'Dart';

  @override
  String get rewireTask12Option4 => 'Swift';

  @override
  String get rewireTask13Title => 'فحص التركيز';

  @override
  String get rewireTask13Content => 'خذ نفساً عميقاً واكتب \"أنا مركز\".';

  @override
  String get rewireTask14Title => 'الكيمياء';

  @override
  String get rewireTask14Content => 'رمز الذهب؟';

  @override
  String get rewireTask14Option1 => 'Ag';

  @override
  String get rewireTask14Option2 => 'Au';

  @override
  String get rewireTask14Option3 => 'Fe';

  @override
  String get rewireTask14Option4 => 'Cu';

  @override
  String get rewireTask15Title => 'عاصمة';

  @override
  String get rewireTask15Content => 'عاصمة كندا؟';

  @override
  String get rewireTask15Option1 => 'تورونتو';

  @override
  String get rewireTask15Option2 => 'فانكوفر';

  @override
  String get rewireTask15Option3 => 'أوتاوا';

  @override
  String get rewireTask15Option4 => 'مونتريال';

  @override
  String get rewireTask16Title => 'علم الفلك';

  @override
  String get rewireTask16Content => 'أي كوكب يسمى \"الكوكب الأحمر\"؟';

  @override
  String get rewireTask16Option1 => 'الزهرة';

  @override
  String get rewireTask16Option2 => 'المريخ';

  @override
  String get rewireTask16Option3 => 'المشتري';

  @override
  String get rewireTask16Option4 => 'زحل';

  @override
  String get rewireTask17Title => 'جناس';

  @override
  String get rewireTask17Content => 'رتب الحروف: EFOLI';

  @override
  String get rewireTask17Option1 => 'حياة';

  @override
  String get rewireTask17Option2 => 'ملف';

  @override
  String get rewireTask17Option3 => 'رقاقة';

  @override
  String get rewireTask17Option4 => 'حياة/ملف';

  @override
  String get rewireTask17bTitle => 'جناس';

  @override
  String get rewireTask17bContent => 'رتب الحروف: T R A E H';

  @override
  String get rewireTask17bOption1 => 'قلب';

  @override
  String get rewireTask17bOption2 => 'أرض';

  @override
  String get rewireTask17bOption3 => 'كاره';

  @override
  String get rewireTask17bOption4 => 'الكل';

  @override
  String get rewireTask18Title => 'تأمل';

  @override
  String get rewireTask18Content => 'ما هو هدفك الصغير لهذا اليوم؟';

  @override
  String get rewireTask19Title => 'الفيزياء';

  @override
  String get rewireTask19Content => 'سرعة الضوء تقريباً؟';

  @override
  String get rewireTask19Option1 => '300 ألف كم/ث';

  @override
  String get rewireTask19Option2 => '150 ألف كم/ث';

  @override
  String get rewireTask19Option3 => '1 مليون كم/ث';

  @override
  String get rewireTask19Option4 => 'سرعة الصوت';

  @override
  String get rewireTask20Title => 'التاريخ';

  @override
  String get rewireTask20Content => 'عام أول هبوط على القمر؟';

  @override
  String get rewireTask20Option1 => '1965';

  @override
  String get rewireTask20Option2 => '1969';

  @override
  String get rewireTask20Option3 => '1972';

  @override
  String get rewireTask20Option4 => '1959';

  @override
  String get rewireTask21Title => 'التشريح';

  @override
  String get rewireTask21Content => 'أكبر عضو في جسم الإنسان؟';

  @override
  String get rewireTask21Option1 => 'الدماغ';

  @override
  String get rewireTask21Option2 => 'الكبد';

  @override
  String get rewireTask21Option3 => 'الجلد';

  @override
  String get rewireTask21Option4 => 'القلب';

  @override
  String get rewireTask22Title => 'حزورة';

  @override
  String get rewireTask22Content => 'ما الذي ينزل ولا يصعد أبداً؟';

  @override
  String get rewireTask22Option1 => 'المطر';

  @override
  String get rewireTask22Option2 => 'البخار';

  @override
  String get rewireTask22Option3 => 'بالون';

  @override
  String get rewireTask22Option4 => 'دخان';

  @override
  String get adminSearchUsers => 'البحث بالبريد أو الاسم...';

  @override
  String get adminUnknownUser => 'مستخدم غير معروف';

  @override
  String get adminNoEmail => 'لا يوجد بريد';

  @override
  String get adminUserStreak => 'السلسلة';

  @override
  String get adminUserActivity => 'النشاط';

  @override
  String get adminUserPoints => 'النقاط';

  @override
  String get adminRestrictUser => 'تقييد المستخدم';

  @override
  String get adminUnrestrictUser => 'إلغاء التقييد';

  @override
  String get adminDeleteUser => 'حذف حساب المستخدم';

  @override
  String get adminDeleteUserConfirm => 'حذف المستخدم؟';

  @override
  String get adminDeleteUserWarning =>
      'سيؤدي هذا إلى حذف بيانات المستخدم نهائياً من Firestore. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get adminActiveChallenges => 'التحديات النشطة';

  @override
  String get adminNewChallenge => 'تحدي جديد';

  @override
  String get adminCreateChallenge => 'إنشاء تحدٍ';

  @override
  String get adminEditChallenge => 'تعديل التحدي';

  @override
  String get adminChallengeTitle => 'العنوان';

  @override
  String get adminChallengeDesc => 'الوصف';

  @override
  String get adminChallengeStartDate => 'تاريخ البدء';

  @override
  String get adminChallengeEndDate => 'تاريخ الانتهاء';

  @override
  String get adminChallengeDuration => 'المدة (أيام)';

  @override
  String get adminChallengePoints => 'مكافأة النقاط';

  @override
  String get adminChallengeCategory => 'الفئة';

  @override
  String get adminSave => 'حفظ';

  @override
  String get adminCancel => 'إلغاء';

  @override
  String get adminDelete => 'حذف';

  @override
  String challengePointsLabel(Object count) {
    return '$count نقاط';
  }

  @override
  String get challengeTitleMorningMeditation => 'تأمل الصباح';

  @override
  String get challengeDescMorningMeditation =>
      'ابدأ يومك بوضوح. 10 دقائق تركيز.';

  @override
  String get challengeTitleDigitalSunset => 'الغروب الرقمي';

  @override
  String get challengeDescDigitalSunset => 'لا شاشات قبل ساعة من النوم.';

  @override
  String get challengeTitleSocialMediaFast => 'صيام التواصل الاجتماعي';

  @override
  String get challengeDescSocialMediaFast => '24 ساعة بدون تصفح.';

  @override
  String get challengeTitleDeepWork => 'تركيز العمل العميق';

  @override
  String get challengeDescDeepWork => 'ساعتان من العمل المركز يوميًا.';

  @override
  String mindResetRotLabel(Object count) {
    return '-$count فساد';
  }

  @override
  String get categoryDopamineFast => 'صيام الدوبامين';

  @override
  String get categoryMentalReset => 'إعادة ضبط ذهني';

  @override
  String get categoryPhysical => 'بدني';

  @override
  String get categoryGeneral => 'عام';

  @override
  String get adminAnalyticsTitle => 'تحليلات متعمقة';

  @override
  String get adminContentDietTitle => 'توزيع حمية المحتوى';

  @override
  String get adminContentDietSubtitle => 'تفاعل المستخدم حسب الفئة (اليوم)';

  @override
  String get adminBrainRotDistribution => 'توزيع فساد الدماغ';

  @override
  String get adminBrainRotWeeklySubtitle => 'المتوسط الأسبوعي لكل يوم';

  @override
  String get adminMostUsedMindReset => 'إعادة ضبط الذهن الأكثر استخداماً:';

  @override
  String get adminTopActiveChallenge => 'التحدي النشط الأعلى:';

  @override
  String get adminAchievementBadges => 'أوسمة الإنجاز';

  @override
  String get adminBadgeTitle => 'عنوان الوسام';

  @override
  String get adminBadgeDesc => 'الوصف';

  @override
  String get adminBadgeIconName => 'اسم الأيقونة (مثلاً: trophy, flame)';

  @override
  String get adminBadgeConditionType => 'نوع الشرط';

  @override
  String get adminBadgeConditionValue => 'قيمة الشرط';

  @override
  String get adminBadgeUnitLabel => 'تسمية الوحدة (مثلاً: days, sessions)';

  @override
  String get adminSaveChanges => 'حفظ التغييرات';

  @override
  String get adminInfoCenter => 'مركز المعلومات';

  @override
  String get adminActivityLogs => 'سجلات النشاط';

  @override
  String get adminBrainRotThresholds => 'عتبات فساد الدماغ';

  @override
  String get adminHealthyZone => 'المنطقة الصحية';

  @override
  String get adminHealthyZoneDesc =>
      'استخدام رقمي متوازن. ركز على الإنتاجية والتفاعلات الواقعية.';

  @override
  String get adminCautionZone => 'منطقة الحذر';

  @override
  String get adminCautionZoneDesc =>
      'استهلاك سلبي متزايد. فكر في إعادة ضبط ذهني قصيرة.';

  @override
  String get adminDangerZone => 'منطقة الخطر';

  @override
  String get adminDangerZoneDesc =>
      'تم اكتشاف استهلاك سلبي مرتفع. يوصى باتخاذ إجراء فوري.';

  @override
  String get adminPointsSystem => 'نظام النقاط';

  @override
  String get adminRewireReward => 'مكافأة وضع إعادة الأسلاك';

  @override
  String get adminRewireRewardSubtitle => 'أكمل التمارين القصيرة.';

  @override
  String get adminMindResetReward => 'مكافأة إعادة ضبط الذهن';

  @override
  String get adminMindResetRewardSubtitle =>
      'أكمل مهام التجديد البدني أو الذهني.';

  @override
  String get adminChallengeReward => 'إكمال التحدي';

  @override
  String get adminChallengeRewardSubtitle =>
      'أنهِ التحديات المجتمعية للحصول على أقصى قدر من المكافآت.';

  @override
  String get adminPointsUsageFooter =>
      'يمكن استخدام النقاط لفتح إنجازات حصرية وتسلق التصنيفات المجتمعية.';

  @override
  String get adminSystemFeatures => 'ميزات النظام';

  @override
  String get adminBrainRotMeterTitle => 'مقياس فساد الدماغ';

  @override
  String get adminBrainRotMeterDesc =>
      'يتتبع الاستهلاك الرقمي اليومي ويحسب درجة فساد الدماغ في الوقت الفعلي.';

  @override
  String get adminCommunityChallengesTitle => 'التحديات المجتمعية';

  @override
  String get adminCommunityChallengesDesc =>
      'شارك في الفعاليات العالمية لتقليل وقت الشاشة السلبي الجماعي.';

  @override
  String get adminSmartNotificationsTitle => 'الإشعارات الذكية';

  @override
  String get adminSmartNotificationsDesc =>
      'تنبيهات تحفيزية تشجع على عادات رقمية أكثر صحة وعمليات إعادة ضبط في الوقت المناسب.';

  @override
  String get adminRealtimeAnalyticsTitle => 'تحليلات الوقت الفعلي';

  @override
  String get adminRealtimeAnalyticsDesc =>
      'يوفر ملخصاً للنشاط الرقمي للمستخدم بناءً على استخدام التطبيق المسجل.';

  @override
  String get adminHowBrainovaWorks => 'كيف يعمل برينوفا';

  @override
  String get adminStep1 => 'تتبع استخدام التطبيق اليومي تلقائياً.';

  @override
  String get adminStep2 => 'حساب أنماط درجة فساد الدماغ بناءً على الأنشطة.';

  @override
  String get adminStep3 => 'اقتراح أنشطة إعادة ضبط الذهن ووضع إعادة الأسلاك.';

  @override
  String get adminStep4 => 'مكافأة العادات الصحية بالنقاط والأوسمة.';

  @override
  String get adminAppDetails => 'تفاصيل التطبيق';

  @override
  String get adminAppVersion => 'إصدار التطبيق';

  @override
  String get adminDeveloper => 'المطور';

  @override
  String get adminSystemStatus => 'حالة النظام';

  @override
  String get adminOperational => 'قيد التشغيل';

  @override
  String get brainovaStartMessage =>
      'هذا هو المكان الذي يبدأ فيه تطبيق برينوفا الفعلي!';

  @override
  String get commonNone => 'لا يوجد';

  @override
  String get mindResetTypeText => 'اكتب أفكارك هنا...';

  @override
  String get adminNewBadge => 'وسام جديد';

  @override
  String get adminEditBadge => 'تعديل الوسام';

  @override
  String get adminAvgBrainRot => 'متوسط تلف الدماغ';
}
