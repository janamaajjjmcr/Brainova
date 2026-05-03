import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Brainova'**
  String get appTitle;

  /// No description provided for @navDiet.
  ///
  /// In en, this message translates to:
  /// **'Diet'**
  String get navDiet;

  /// No description provided for @navReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get navReset;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navRewire.
  ///
  /// In en, this message translates to:
  /// **'Rewire'**
  String get navRewire;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @navAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get navAdmin;

  /// No description provided for @adminDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard Overview'**
  String get adminDashboardTitle;

  /// No description provided for @adminChallengeManagement.
  ///
  /// In en, this message translates to:
  /// **'Challenge Management'**
  String get adminChallengeManagement;

  /// No description provided for @adminUserManagement.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get adminUserManagement;

  /// No description provided for @adminAnalyticsReports.
  ///
  /// In en, this message translates to:
  /// **'Analytics & Reports'**
  String get adminAnalyticsReports;

  /// No description provided for @adminBadgeManagement.
  ///
  /// In en, this message translates to:
  /// **'Badge Management'**
  String get adminBadgeManagement;

  /// No description provided for @adminAppSettings.
  ///
  /// In en, this message translates to:
  /// **'Brainova Information Center'**
  String get adminAppSettings;

  /// No description provided for @adminExit.
  ///
  /// In en, this message translates to:
  /// **'Exit Admin'**
  String get adminExit;

  /// No description provided for @adminBackToOverview.
  ///
  /// In en, this message translates to:
  /// **'Back to Overview'**
  String get adminBackToOverview;

  /// No description provided for @adminSystemHealth.
  ///
  /// In en, this message translates to:
  /// **'System Health'**
  String get adminSystemHealth;

  /// No description provided for @adminTotalUsers.
  ///
  /// In en, this message translates to:
  /// **'Total Users'**
  String get adminTotalUsers;

  /// No description provided for @adminActiveToday.
  ///
  /// In en, this message translates to:
  /// **'Active Today'**
  String get adminActiveToday;

  /// No description provided for @adminAvgBrain_rot.
  ///
  /// In en, this message translates to:
  /// **'Avg. Brain Rot'**
  String get adminAvgBrain_rot;

  /// No description provided for @adminResetsDone.
  ///
  /// In en, this message translates to:
  /// **'Resets Done'**
  String get adminResetsDone;

  /// No description provided for @adminManagementActions.
  ///
  /// In en, this message translates to:
  /// **'Management Actions'**
  String get adminManagementActions;

  /// No description provided for @adminHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get adminHome;

  /// No description provided for @adminChallenges.
  ///
  /// In en, this message translates to:
  /// **'Challenges'**
  String get adminChallenges;

  /// No description provided for @adminUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get adminUsers;

  /// No description provided for @adminStats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get adminStats;

  /// No description provided for @adminBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges'**
  String get adminBadges;

  /// No description provided for @adminInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get adminInfo;

  /// No description provided for @adminSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get adminSettings;

  /// No description provided for @homeQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get homeQuickActions;

  /// No description provided for @homeMindReset.
  ///
  /// In en, this message translates to:
  /// **'Mind Reset'**
  String get homeMindReset;

  /// No description provided for @homeRewireMode.
  ///
  /// In en, this message translates to:
  /// **'Rewire Mode'**
  String get homeRewireMode;

  /// No description provided for @homeRealityCheck.
  ///
  /// In en, this message translates to:
  /// **'Reality Check'**
  String get homeRealityCheck;

  /// No description provided for @homeContentDiet.
  ///
  /// In en, this message translates to:
  /// **'Content Diet'**
  String get homeContentDiet;

  /// No description provided for @homeDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get homeDaysLabel;

  /// No description provided for @brainRotMeterTitle.
  ///
  /// In en, this message translates to:
  /// **'Brain Rot Meter'**
  String get brainRotMeterTitle;

  /// No description provided for @brainRotStatusHealthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get brainRotStatusHealthy;

  /// No description provided for @brainRotStatusCaution.
  ///
  /// In en, this message translates to:
  /// **'Caution'**
  String get brainRotStatusCaution;

  /// No description provided for @brainRotStatusDanger.
  ///
  /// In en, this message translates to:
  /// **'Danger'**
  String get brainRotStatusDanger;

  /// No description provided for @brainRotCurrentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get brainRotCurrentStreak;

  /// No description provided for @brainRotDays.
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String brainRotDays(int count);

  /// No description provided for @brainRotMindResets.
  ///
  /// In en, this message translates to:
  /// **'Mind Resets'**
  String get brainRotMindResets;

  /// No description provided for @challengePeopleJoined.
  ///
  /// In en, this message translates to:
  /// **'{count} People Joined'**
  String challengePeopleJoined(int count);

  /// No description provided for @challengeJoin.
  ///
  /// In en, this message translates to:
  /// **'Join Challenge'**
  String get challengeJoin;

  /// No description provided for @challengeCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get challengeCompleted;

  /// No description provided for @challengeActive.
  ///
  /// In en, this message translates to:
  /// **'Challenge Active'**
  String get challengeActive;

  /// No description provided for @challengeLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave Challenge'**
  String get challengeLeave;

  /// No description provided for @challengeLeaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave Challenge'**
  String get challengeLeaveTitle;

  /// No description provided for @challengeLeaveBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave the challenge?'**
  String get challengeLeaveBody;

  /// No description provided for @challengeCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get challengeCancel;

  /// No description provided for @challengeDone.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get challengeDone;

  /// No description provided for @challengeDonePercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Done'**
  String challengeDonePercent(int percent);

  /// No description provided for @challengeDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Day} other{{count} Days}}'**
  String challengeDays(int count);

  /// No description provided for @badgeLocked.
  ///
  /// In en, this message translates to:
  /// **'LOCKED'**
  String get badgeLocked;

  /// No description provided for @badgeEarned.
  ///
  /// In en, this message translates to:
  /// **'EARNED'**
  String get badgeEarned;

  /// No description provided for @homeDaysStreak.
  ///
  /// In en, this message translates to:
  /// **'{count} Days'**
  String homeDaysStreak(int count);

  /// No description provided for @profileYourStatistics.
  ///
  /// In en, this message translates to:
  /// **'Your Statistics'**
  String get profileYourStatistics;

  /// No description provided for @profileTrackDailyMood.
  ///
  /// In en, this message translates to:
  /// **'Track Your Daily Mood'**
  String get profileTrackDailyMood;

  /// No description provided for @profileAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileAccount;

  /// No description provided for @profileMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get profileMore;

  /// No description provided for @profilePersonalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get profilePersonalInformation;

  /// No description provided for @profilePrivacySecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get profilePrivacySecurity;

  /// No description provided for @profileHelpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileHelpSupport;

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOut;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// No description provided for @profileCompleteDailyTask.
  ///
  /// In en, this message translates to:
  /// **'Complete Daily Task'**
  String get profileCompleteDailyTask;

  /// No description provided for @profileSelectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get profileSelectLanguage;

  /// No description provided for @profileTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get profileTheme;

  /// No description provided for @profileResets.
  ///
  /// In en, this message translates to:
  /// **'Resets'**
  String get profileResets;

  /// No description provided for @profileDayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get profileDayStreak;

  /// No description provided for @profilePointsToday.
  ///
  /// In en, this message translates to:
  /// **'Points Today'**
  String get profilePointsToday;

  /// No description provided for @profileTasksDone.
  ///
  /// In en, this message translates to:
  /// **'Tasks Done'**
  String get profileTasksDone;

  /// No description provided for @loginWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get loginWelcomeBack;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Continue your journey to a healthier mind'**
  String get loginSubtitle;

  /// No description provided for @loginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Example@gmail.com'**
  String get loginEmailHint;

  /// No description provided for @loginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password (8+ chars, upper, number, symbol)'**
  String get loginPasswordHint;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get loginForgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginButton;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginNoAccount;

  /// No description provided for @loginSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get loginSignUp;

  /// No description provided for @loginOr.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get loginOr;

  /// No description provided for @loginContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginContinueWithGoogle;

  /// No description provided for @signupCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signupCreateAccount;

  /// No description provided for @signupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start your digital detox journey today'**
  String get signupSubtitle;

  /// No description provided for @signupFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get signupFullName;

  /// No description provided for @signupEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Example@gmail.com'**
  String get signupEmailHint;

  /// No description provided for @signupPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password (8+ chars, upper, number, symbol)'**
  String get signupPasswordHint;

  /// No description provided for @signupConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get signupConfirmPassword;

  /// No description provided for @signupButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupButton;

  /// No description provided for @signupOr.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get signupOr;

  /// No description provided for @signupContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get signupContinueWithGoogle;

  /// No description provided for @signupAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get signupAlreadyHaveAccount;

  /// No description provided for @signupLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get signupLogIn;

  /// No description provided for @signupPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get signupPasswordMismatch;

  /// No description provided for @signupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created! A verification email has been sent to your inbox.'**
  String get signupSuccess;

  /// No description provided for @realityCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'Reality Check'**
  String get realityCheckTitle;

  /// No description provided for @realityCheckPleaseLogin.
  ///
  /// In en, this message translates to:
  /// **'Please Login'**
  String get realityCheckPleaseLogin;

  /// No description provided for @realityCheckSuggestedAction.
  ///
  /// In en, this message translates to:
  /// **'Suggested Action'**
  String get realityCheckSuggestedAction;

  /// No description provided for @realityCheckStartMindReset.
  ///
  /// In en, this message translates to:
  /// **'Start Mind Reset'**
  String get realityCheckStartMindReset;

  /// No description provided for @realityCheckTryRewireMode.
  ///
  /// In en, this message translates to:
  /// **'Try Rewire Mode'**
  String get realityCheckTryRewireMode;

  /// No description provided for @realityCheckStatusHealthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get realityCheckStatusHealthy;

  /// No description provided for @realityCheckStatusCaution.
  ///
  /// In en, this message translates to:
  /// **'Caution'**
  String get realityCheckStatusCaution;

  /// No description provided for @realityCheckStatusDanger.
  ///
  /// In en, this message translates to:
  /// **'Danger'**
  String get realityCheckStatusDanger;

  /// No description provided for @realityCheckMessageHealthy.
  ///
  /// In en, this message translates to:
  /// **'Your digital balance looks stable. Keep it up.'**
  String get realityCheckMessageHealthy;

  /// No description provided for @realityCheckMessageCaution.
  ///
  /// In en, this message translates to:
  /// **'You are leaning toward heavy stimulation. Consider a reset.'**
  String get realityCheckMessageCaution;

  /// No description provided for @realityCheckMessageDanger.
  ///
  /// In en, this message translates to:
  /// **'High stimulation detected. Your digital habits may be affecting focus.'**
  String get realityCheckMessageDanger;

  /// No description provided for @realityCheckNoActivity.
  ///
  /// In en, this message translates to:
  /// **'No significant activity detected.'**
  String get realityCheckNoActivity;

  /// No description provided for @realityCheckCategorySocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get realityCheckCategorySocial;

  /// No description provided for @realityCheckCategoryJunk.
  ///
  /// In en, this message translates to:
  /// **'Junk'**
  String get realityCheckCategoryJunk;

  /// No description provided for @realityCheckCategoryLearning.
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get realityCheckCategoryLearning;

  /// No description provided for @realityCheckCategoryEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get realityCheckCategoryEntertainment;

  /// No description provided for @realityCheckCategoryNeutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get realityCheckCategoryNeutral;

  /// No description provided for @realityCheckSummary.
  ///
  /// In en, this message translates to:
  /// **'Activity Summary'**
  String get realityCheckSummary;

  /// No description provided for @rewireSubmitAnswer.
  ///
  /// In en, this message translates to:
  /// **'Submit Answer'**
  String get rewireSubmitAnswer;

  /// No description provided for @rewireTypeAnswer.
  ///
  /// In en, this message translates to:
  /// **'Type your answer here...'**
  String get rewireTypeAnswer;

  /// No description provided for @rewireCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct! -{points} Rot'**
  String rewireCorrect(int points);

  /// No description provided for @rewireIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect, try again!'**
  String get rewireIncorrect;

  /// No description provided for @rewireTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get rewireTryAgain;

  /// No description provided for @rewireExit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get rewireExit;

  /// No description provided for @rewireNextTask.
  ///
  /// In en, this message translates to:
  /// **'Next Task'**
  String get rewireNextTask;

  /// No description provided for @mindResetBreathing.
  ///
  /// In en, this message translates to:
  /// **'Breathing'**
  String get mindResetBreathing;

  /// No description provided for @mindResetAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get mindResetAudio;

  /// No description provided for @mindResetStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get mindResetStretch;

  /// No description provided for @mindResetJournaling.
  ///
  /// In en, this message translates to:
  /// **'Journaling'**
  String get mindResetJournaling;

  /// No description provided for @mindResetMeditation.
  ///
  /// In en, this message translates to:
  /// **'Meditation'**
  String get mindResetMeditation;

  /// No description provided for @mindResetStepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String mindResetStepOf(int current, int total);

  /// No description provided for @mindResetInstructions.
  ///
  /// In en, this message translates to:
  /// **'INSTRUCTIONS'**
  String get mindResetInstructions;

  /// No description provided for @mindResetActivityCompleted.
  ///
  /// In en, this message translates to:
  /// **'Activity Completed!'**
  String get mindResetActivityCompleted;

  /// No description provided for @mindResetDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get mindResetDone;

  /// No description provided for @mindResetFocusOnSound.
  ///
  /// In en, this message translates to:
  /// **'Focus on the sound...'**
  String get mindResetFocusOnSound;

  /// No description provided for @mindResetPressPlay.
  ///
  /// In en, this message translates to:
  /// **'Press play to start'**
  String get mindResetPressPlay;

  /// No description provided for @mindResetMin.
  ///
  /// In en, this message translates to:
  /// **'{count} min'**
  String mindResetMin(int count);

  /// No description provided for @mindResetClearMind.
  ///
  /// In en, this message translates to:
  /// **'Clear your mind and let thoughts flow...'**
  String get mindResetClearMind;

  /// No description provided for @mindResetTitle1.
  ///
  /// In en, this message translates to:
  /// **'Box Breathing'**
  String get mindResetTitle1;

  /// No description provided for @mindResetDesc1.
  ///
  /// In en, this message translates to:
  /// **'A powerful breathing technique used to quickly calm the mind and reset your nervous system.'**
  String get mindResetDesc1;

  /// No description provided for @mindResetTitle2.
  ///
  /// In en, this message translates to:
  /// **'Neck & Shoulder Reset'**
  String get mindResetTitle2;

  /// No description provided for @mindResetDesc2.
  ///
  /// In en, this message translates to:
  /// **'Release tension in your neck and shoulders after long periods of screen time.'**
  String get mindResetDesc2;

  /// No description provided for @mindResetTitle3.
  ///
  /// In en, this message translates to:
  /// **'Rain Sounds'**
  String get mindResetTitle3;

  /// No description provided for @mindResetDesc3.
  ///
  /// In en, this message translates to:
  /// **'Let the sound of rain wash away mental noise.'**
  String get mindResetDesc3;

  /// No description provided for @mindResetTitle4.
  ///
  /// In en, this message translates to:
  /// **'Eye Workout'**
  String get mindResetTitle4;

  /// No description provided for @mindResetDesc4.
  ///
  /// In en, this message translates to:
  /// **'Refresh tired eyes and reduce strain after long sessions of screen use.'**
  String get mindResetDesc4;

  /// No description provided for @mindResetTitle5.
  ///
  /// In en, this message translates to:
  /// **'Brain Dump'**
  String get mindResetTitle5;

  /// No description provided for @mindResetDesc5.
  ///
  /// In en, this message translates to:
  /// **'Unload your thoughts onto paper to clear your mind and regain focus.'**
  String get mindResetDesc5;

  /// No description provided for @mindResetTitle6.
  ///
  /// In en, this message translates to:
  /// **'Digital Detox'**
  String get mindResetTitle6;

  /// No description provided for @mindResetDesc6.
  ///
  /// In en, this message translates to:
  /// **'Put your phone down and reconnect with reality.'**
  String get mindResetDesc6;

  /// No description provided for @mindResetStep1_1.
  ///
  /// In en, this message translates to:
  /// **'Inhale through your nose for 4 seconds.'**
  String get mindResetStep1_1;

  /// No description provided for @mindResetStep1_2.
  ///
  /// In en, this message translates to:
  /// **'Hold your breath for 4 seconds.'**
  String get mindResetStep1_2;

  /// No description provided for @mindResetStep1_3.
  ///
  /// In en, this message translates to:
  /// **'Exhale slowly for 4 seconds.'**
  String get mindResetStep1_3;

  /// No description provided for @mindResetStep1_4.
  ///
  /// In en, this message translates to:
  /// **'Hold empty for 4 seconds. Repeat.'**
  String get mindResetStep1_4;

  /// No description provided for @mindResetStep2_1.
  ///
  /// In en, this message translates to:
  /// **'Sit up straight, shoulders relaxed.'**
  String get mindResetStep2_1;

  /// No description provided for @mindResetStep2_2.
  ///
  /// In en, this message translates to:
  /// **'Drop right ear to right shoulder. Hold 10s.'**
  String get mindResetStep2_2;

  /// No description provided for @mindResetStep2_3.
  ///
  /// In en, this message translates to:
  /// **'Roll head forward to chest. Hold 10s.'**
  String get mindResetStep2_3;

  /// No description provided for @mindResetStep2_4.
  ///
  /// In en, this message translates to:
  /// **'Drop left ear to left shoulder. Hold 10s.'**
  String get mindResetStep2_4;

  /// No description provided for @mindResetStep2_5.
  ///
  /// In en, this message translates to:
  /// **'Roll both shoulders backward 5 times.'**
  String get mindResetStep2_5;

  /// No description provided for @mindResetStep2_6.
  ///
  /// In en, this message translates to:
  /// **'Stretch arms above your head.'**
  String get mindResetStep2_6;

  /// No description provided for @mindResetStep3_1.
  ///
  /// In en, this message translates to:
  /// **'Put on headphones.'**
  String get mindResetStep3_1;

  /// No description provided for @mindResetStep3_2.
  ///
  /// In en, this message translates to:
  /// **'Close your eyes or soften your gaze.'**
  String get mindResetStep3_2;

  /// No description provided for @mindResetStep3_3.
  ///
  /// In en, this message translates to:
  /// **'Let the sound fill your attention completely.'**
  String get mindResetStep3_3;

  /// No description provided for @mindResetStep3_4.
  ///
  /// In en, this message translates to:
  /// **'Whenever your mind drifts, come back to the sound of the rain.'**
  String get mindResetStep3_4;

  /// No description provided for @mindResetStep4_1.
  ///
  /// In en, this message translates to:
  /// **'Look up and hold 3s, look down and hold 3s. Repeat 3 times.'**
  String get mindResetStep4_1;

  /// No description provided for @mindResetStep4_2.
  ///
  /// In en, this message translates to:
  /// **'Look right and hold 3s, look left and hold 3s. Repeat 3 times.'**
  String get mindResetStep4_2;

  /// No description provided for @mindResetStep4_3.
  ///
  /// In en, this message translates to:
  /// **'Look top-left 3s, look top-right 3s. Repeat 3 times.'**
  String get mindResetStep4_3;

  /// No description provided for @mindResetStep4_4.
  ///
  /// In en, this message translates to:
  /// **'Rotate eyeballs 3 times right, then 3 times left. Blink to relax.'**
  String get mindResetStep4_4;

  /// No description provided for @mindResetStep4_5.
  ///
  /// In en, this message translates to:
  /// **'Close eyes tight and hold for 10 seconds. Relax.'**
  String get mindResetStep4_5;

  /// No description provided for @mindResetStep4_6.
  ///
  /// In en, this message translates to:
  /// **'Open eyes wide and hold 10 seconds. Blink repeatedly to finish.'**
  String get mindResetStep4_6;

  /// No description provided for @mindResetStep5_1.
  ///
  /// In en, this message translates to:
  /// **'Open a notes app or grab paper.'**
  String get mindResetStep5_1;

  /// No description provided for @mindResetStep5_2.
  ///
  /// In en, this message translates to:
  /// **'Write every thought, worry, or task.'**
  String get mindResetStep5_2;

  /// No description provided for @mindResetStep5_3.
  ///
  /// In en, this message translates to:
  /// **'Do not filter or judge just write.'**
  String get mindResetStep5_3;

  /// No description provided for @mindResetStep5_4.
  ///
  /// In en, this message translates to:
  /// **'Cross out things you cannot control.'**
  String get mindResetStep5_4;

  /// No description provided for @mindResetStep5_5.
  ///
  /// In en, this message translates to:
  /// **'Circle the one thing that matters most.'**
  String get mindResetStep5_5;

  /// No description provided for @mindResetStep6_1.
  ///
  /// In en, this message translates to:
  /// **'Put your phone down and step away from the screen.'**
  String get mindResetStep6_1;

  /// No description provided for @mindResetStep6_2.
  ///
  /// In en, this message translates to:
  /// **'Take a slow deep breath and relax your body.'**
  String get mindResetStep6_2;

  /// No description provided for @mindResetStep6_3.
  ///
  /// In en, this message translates to:
  /// **'Look around and notice your surroundings.'**
  String get mindResetStep6_3;

  /// No description provided for @mindResetStep6_4.
  ///
  /// In en, this message translates to:
  /// **'Focus on the present moment instead of your device.'**
  String get mindResetStep6_4;

  /// No description provided for @mindResetStep6_5.
  ///
  /// In en, this message translates to:
  /// **'Enjoy a short break from digital stimulation.'**
  String get mindResetStep6_5;

  /// No description provided for @contentDietLogContent.
  ///
  /// In en, this message translates to:
  /// **'Log Content'**
  String get contentDietLogContent;

  /// No description provided for @contentDietHowDidYouSpend.
  ///
  /// In en, this message translates to:
  /// **'How did you spend your time?'**
  String get contentDietHowDidYouSpend;

  /// No description provided for @contentDietRecentLogs.
  ///
  /// In en, this message translates to:
  /// **'Recent Logs'**
  String get contentDietRecentLogs;

  /// No description provided for @contentDietDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration (minutes)'**
  String get contentDietDuration;

  /// No description provided for @contentDietNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get contentDietNotes;

  /// No description provided for @contentDietSaveEntry.
  ///
  /// In en, this message translates to:
  /// **'Save Entry'**
  String get contentDietSaveEntry;

  /// No description provided for @contentDietEntryAdded.
  ///
  /// In en, this message translates to:
  /// **'Entry Added!'**
  String get contentDietEntryAdded;

  /// No description provided for @contentDietNoEntries.
  ///
  /// In en, this message translates to:
  /// **'No entries yet.'**
  String get contentDietNoEntries;

  /// No description provided for @contentDietWeeklySummary.
  ///
  /// In en, this message translates to:
  /// **'Weekly Summary'**
  String get contentDietWeeklySummary;

  /// No description provided for @contentDietNoData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get contentDietNoData;

  /// No description provided for @contentDietLearning.
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get contentDietLearning;

  /// No description provided for @contentDietEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entert.'**
  String get contentDietEntertainment;

  /// No description provided for @contentDietJunk.
  ///
  /// In en, this message translates to:
  /// **'Junk'**
  String get contentDietJunk;

  /// No description provided for @contentDietSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get contentDietSocial;

  /// No description provided for @contentDietLearningFull.
  ///
  /// In en, this message translates to:
  /// **'LEARNING'**
  String get contentDietLearningFull;

  /// No description provided for @contentDietEntertainmentFull.
  ///
  /// In en, this message translates to:
  /// **'ENTERTAINMENT'**
  String get contentDietEntertainmentFull;

  /// No description provided for @contentDietJunkFull.
  ///
  /// In en, this message translates to:
  /// **'JUNK'**
  String get contentDietJunkFull;

  /// No description provided for @contentDietSocialFull.
  ///
  /// In en, this message translates to:
  /// **'SOCIAL'**
  String get contentDietSocialFull;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @achievementsUnlocked.
  ///
  /// In en, this message translates to:
  /// **'{count} / {total} Unlocked'**
  String achievementsUnlocked(int count, int total);

  /// No description provided for @achievementsNoBadges.
  ///
  /// In en, this message translates to:
  /// **'No badges available yet.'**
  String get achievementsNoBadges;

  /// No description provided for @streakDayStreak.
  ///
  /// In en, this message translates to:
  /// **'{count} Day Streak'**
  String streakDayStreak(int count);

  /// No description provided for @streakKeepItUp.
  ///
  /// In en, this message translates to:
  /// **'Keep it up!'**
  String get streakKeepItUp;

  /// No description provided for @challengesNone.
  ///
  /// In en, this message translates to:
  /// **'No active challenges yet.\nAdmin hasn\'t created any.'**
  String get challengesNone;

  /// No description provided for @accessRestricted.
  ///
  /// In en, this message translates to:
  /// **'Access Restricted'**
  String get accessRestricted;

  /// No description provided for @accessRestrictedBody.
  ///
  /// In en, this message translates to:
  /// **'Your account has been restricted by the administrator. Please contact support if you believe this is a mistake.'**
  String get accessRestrictedBody;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String errorGeneric(String message);

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get privacyTitle;

  /// No description provided for @privacyDataCollection.
  ///
  /// In en, this message translates to:
  /// **'Data Collection'**
  String get privacyDataCollection;

  /// No description provided for @privacyDataCollectionContent.
  ///
  /// In en, this message translates to:
  /// **'Brainova collects your app usage data on your device to calculate your Brain Rot meter and Reality Check insights. This data is stored securely in your personal account and is never shared with third parties.'**
  String get privacyDataCollectionContent;

  /// No description provided for @privacyWhatWeTrack.
  ///
  /// In en, this message translates to:
  /// **'What We Track'**
  String get privacyWhatWeTrack;

  /// No description provided for @privacyWhatWeTrackContent.
  ///
  /// In en, this message translates to:
  /// **'We track which apps you use and for how long. This includes entertainment apps, social media, and productivity tools. We do not access the content of your apps or messages.'**
  String get privacyWhatWeTrackContent;

  /// No description provided for @privacyDataSecurity.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get privacyDataSecurity;

  /// No description provided for @privacyDataSecurityContent.
  ///
  /// In en, this message translates to:
  /// **'Your data is securely stored using Firebase. Access to your activity data is protected through authentication and encrypted connections to keep your information safe.'**
  String get privacyDataSecurityContent;

  /// No description provided for @privacyYourRights.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get privacyYourRights;

  /// No description provided for @privacyYourRightsContent.
  ///
  /// In en, this message translates to:
  /// **'You have the right to delete your data at any time. You can also revoke app usage permissions from your device settings at any time. Deleting your account will permanently remove all your stored data.'**
  String get privacyYourRightsContent;

  /// No description provided for @privacyReliabilitySettings.
  ///
  /// In en, this message translates to:
  /// **'Reliability Settings'**
  String get privacyReliabilitySettings;

  /// No description provided for @privacyBackgroundAlerts.
  ///
  /// In en, this message translates to:
  /// **'Background Alerts'**
  String get privacyBackgroundAlerts;

  /// No description provided for @privacyBackgroundAlertsDesc.
  ///
  /// In en, this message translates to:
  /// **'To receive alerts even when you are not using the app, please ensure \"Unrestricted\" battery usage is enabled for Brainova.'**
  String get privacyBackgroundAlertsDesc;

  /// No description provided for @privacyEnableReliableAlerts.
  ///
  /// In en, this message translates to:
  /// **'Enable Reliable Alerts'**
  String get privacyEnableReliableAlerts;

  /// No description provided for @privacyPermissionsUsed.
  ///
  /// In en, this message translates to:
  /// **'Permissions Used'**
  String get privacyPermissionsUsed;

  /// No description provided for @privacyUsageAccess.
  ///
  /// In en, this message translates to:
  /// **'Usage Access'**
  String get privacyUsageAccess;

  /// No description provided for @privacyUsageAccessDesc.
  ///
  /// In en, this message translates to:
  /// **'Usage Access — to track which apps you use.'**
  String get privacyUsageAccessDesc;

  /// No description provided for @privacyNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get privacyNotifications;

  /// No description provided for @privacyNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Notifications — to alert you when Brain Rot scores are high.'**
  String get privacyNotificationsDesc;

  /// No description provided for @privacyInternet.
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get privacyInternet;

  /// No description provided for @privacyInternetDesc.
  ///
  /// In en, this message translates to:
  /// **'Internet — to sync your data securely.'**
  String get privacyInternetDesc;

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpTitle;

  /// No description provided for @helpFaq.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get helpFaq;

  /// No description provided for @helpTroubleshooting.
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting'**
  String get helpTroubleshooting;

  /// No description provided for @helpQ1.
  ///
  /// In en, this message translates to:
  /// **'What is the Brain Rot Meter?'**
  String get helpQ1;

  /// No description provided for @helpA1.
  ///
  /// In en, this message translates to:
  /// **'The Brain Rot Meter measures your digital consumption habits over the last 24 hours. A higher score means more time spent on non-productive screen activities. The score is based on your activity during the last 24 hours and updates automatically throughout the day.'**
  String get helpA1;

  /// No description provided for @helpQ2.
  ///
  /// In en, this message translates to:
  /// **'How is my score calculated?'**
  String get helpQ2;

  /// No description provided for @helpA2.
  ///
  /// In en, this message translates to:
  /// **'Your score is based on how long you use certain apps. Entertainment and social media apps increase your score, while learning and productivity apps lower it. Mind Resets and Rewire sessions also reduce your score.'**
  String get helpA2;

  /// No description provided for @helpQ3.
  ///
  /// In en, this message translates to:
  /// **'What is a Mind Reset?'**
  String get helpQ3;

  /// No description provided for @helpA3.
  ///
  /// In en, this message translates to:
  /// **'A Mind Reset is a short activity that helps counteract brain rot. Completing one reduces your Brain Rot Score significantly.'**
  String get helpA3;

  /// No description provided for @helpQ4.
  ///
  /// In en, this message translates to:
  /// **'What is Rewire Mode?'**
  String get helpQ4;

  /// No description provided for @helpA4.
  ///
  /// In en, this message translates to:
  /// **'Rewire Mode gives you productive tasks to replace passive screen time. Completing rewire tasks earns points and reduces your Brain Rot Score.'**
  String get helpA4;

  /// No description provided for @helpQ5.
  ///
  /// In en, this message translates to:
  /// **'Why does the app need Usage Access permission?'**
  String get helpQ5;

  /// No description provided for @helpA5.
  ///
  /// In en, this message translates to:
  /// **'Usage Access permission allows Brainova to detect which apps you are using and for how long. Without this permission, the app cannot track your digital habits automatically.'**
  String get helpA5;

  /// No description provided for @helpQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I improve my score?'**
  String get helpQ6;

  /// No description provided for @helpA6.
  ///
  /// In en, this message translates to:
  /// **'Use learning apps, complete Mind Resets, do Rewire tasks, reduce social media and entertainment consumption, and maintain a daily streak.'**
  String get helpA6;

  /// No description provided for @helpQ7.
  ///
  /// In en, this message translates to:
  /// **'Is my data private?'**
  String get helpQ7;

  /// No description provided for @helpA7.
  ///
  /// In en, this message translates to:
  /// **'Yes. Your data is stored securely and only accessible to you. We never share your personal usage data with third parties.'**
  String get helpA7;

  /// No description provided for @helpQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I delete my data?'**
  String get helpQ8;

  /// No description provided for @helpA8.
  ///
  /// In en, this message translates to:
  /// **'You can delete your account from the Profile screen. This will permanently remove your access and associated activity data.'**
  String get helpA8;

  /// No description provided for @helpQ9.
  ///
  /// In en, this message translates to:
  /// **'What is the difference between Brain Rot Meter and Reality Check?'**
  String get helpQ9;

  /// No description provided for @helpA9.
  ///
  /// In en, this message translates to:
  /// **'The Brain Rot Meter shows your overall stimulation score based on your activity over the last 24 hours. Reality Check analyzes the balance of your digital habits and provides insights into whether your current usage is healthy or overstimulating.'**
  String get helpA9;

  /// No description provided for @helpT1Q.
  ///
  /// In en, this message translates to:
  /// **'Why is my score not updating?'**
  String get helpT1Q;

  /// No description provided for @helpT1A.
  ///
  /// In en, this message translates to:
  /// **'Make sure Usage Access permission is enabled for Brainova so the app can detect which apps you are using. Also ensure the app is not restricted by battery optimization settings. It may take a short time for new activity data to be logged and reflected in your score.'**
  String get helpT1A;

  /// No description provided for @helpT2Q.
  ///
  /// In en, this message translates to:
  /// **'Can I reset my Brain Rot Score manually?'**
  String get helpT2Q;

  /// No description provided for @helpT2A.
  ///
  /// In en, this message translates to:
  /// **'The Brain Rot Score is calculated from your activity over the last 24 hours, so it gradually decreases as older activity expires. Completing Mind Reset activities or Rewire tasks can also help reduce your score during the day.'**
  String get helpT2A;

  /// No description provided for @helpT3Q.
  ///
  /// In en, this message translates to:
  /// **'Why am I receiving notifications?'**
  String get helpT3Q;

  /// No description provided for @helpT3A.
  ///
  /// In en, this message translates to:
  /// **'Brainova sends notifications to help you stay aware of your digital habits. You may receive alerts when your Brain Rot Score becomes high or reminders to complete a Mind Reset or Rewire activity.'**
  String get helpT3A;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfoTitle;

  /// No description provided for @personalInfoSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get personalInfoSave;

  /// No description provided for @personalInfoFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get personalInfoFullName;

  /// No description provided for @personalInfoEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get personalInfoEmailAddress;

  /// No description provided for @personalInfoVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get personalInfoVerified;

  /// No description provided for @personalInfoNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Not Verified'**
  String get personalInfoNotVerified;

  /// No description provided for @personalInfoPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get personalInfoPhoneNumber;

  /// No description provided for @personalInfoDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get personalInfoDateOfBirth;

  /// No description provided for @personalInfoSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get personalInfoSelectDate;

  /// No description provided for @personalInfoGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get personalInfoGender;

  /// No description provided for @personalInfoMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get personalInfoMale;

  /// No description provided for @personalInfoFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get personalInfoFemale;

  /// No description provided for @personalInfoPreferNotToSay.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get personalInfoPreferNotToSay;

  /// No description provided for @personalInfoCountry.
  ///
  /// In en, this message translates to:
  /// **'Country / Region'**
  String get personalInfoCountry;

  /// No description provided for @personalInfoSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get personalInfoSelect;

  /// No description provided for @personalInfoRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get personalInfoRequired;

  /// No description provided for @personalInfoSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile saved successfully'**
  String get personalInfoSavedSuccess;

  /// No description provided for @personalInfoChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get personalInfoChangePassword;

  /// No description provided for @personalInfoDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get personalInfoDeleteAccount;

  /// No description provided for @personalInfoCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get personalInfoCurrentPassword;

  /// No description provided for @personalInfoNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get personalInfoNewPassword;

  /// No description provided for @personalInfoCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get personalInfoCancel;

  /// No description provided for @personalInfoUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get personalInfoUpdate;

  /// No description provided for @personalInfoPasswordUpdated.
  ///
  /// In en, this message translates to:
  /// **'Password updated'**
  String get personalInfoPasswordUpdated;

  /// No description provided for @personalInfoDeleteWarning.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible. All your data will be permanently deleted.'**
  String get personalInfoDeleteWarning;

  /// No description provided for @personalInfoConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get personalInfoConfirmPassword;

  /// No description provided for @personalInfoConfirmWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Confirm with Google'**
  String get personalInfoConfirmWithGoogle;

  /// No description provided for @personalInfoDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get personalInfoDelete;

  /// No description provided for @personalInfoCountryUSA.
  ///
  /// In en, this message translates to:
  /// **'USA'**
  String get personalInfoCountryUSA;

  /// No description provided for @personalInfoCountryUK.
  ///
  /// In en, this message translates to:
  /// **'UK'**
  String get personalInfoCountryUK;

  /// No description provided for @personalInfoCountryEgypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get personalInfoCountryEgypt;

  /// No description provided for @personalInfoCountryUAE.
  ///
  /// In en, this message translates to:
  /// **'UAE'**
  String get personalInfoCountryUAE;

  /// No description provided for @personalInfoCountrySaudi.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get personalInfoCountrySaudi;

  /// No description provided for @personalInfoCountryKuwait.
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get personalInfoCountryKuwait;

  /// No description provided for @personalInfoCountryJordan.
  ///
  /// In en, this message translates to:
  /// **'Jordan'**
  String get personalInfoCountryJordan;

  /// No description provided for @badgeCelebrationNewAchievement.
  ///
  /// In en, this message translates to:
  /// **'New Achievement'**
  String get badgeCelebrationNewAchievement;

  /// No description provided for @badgeCelebrationAwesome.
  ///
  /// In en, this message translates to:
  /// **'Awesome!'**
  String get badgeCelebrationAwesome;

  /// No description provided for @badgeUnitDays.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get badgeUnitDays;

  /// No description provided for @badgeUnitSessions.
  ///
  /// In en, this message translates to:
  /// **'sessions'**
  String get badgeUnitSessions;

  /// No description provided for @badgeUnitTasks.
  ///
  /// In en, this message translates to:
  /// **'tasks'**
  String get badgeUnitTasks;

  /// No description provided for @badgeUnitEntries.
  ///
  /// In en, this message translates to:
  /// **'entries'**
  String get badgeUnitEntries;

  /// No description provided for @badgeUnitLogin.
  ///
  /// In en, this message translates to:
  /// **'logins'**
  String get badgeUnitLogin;

  /// No description provided for @badgeUnitCompleted.
  ///
  /// In en, this message translates to:
  /// **'completed'**
  String get badgeUnitCompleted;

  /// No description provided for @badgeTitleWelcome.
  ///
  /// In en, this message translates to:
  /// **'New Beginning'**
  String get badgeTitleWelcome;

  /// No description provided for @badgeDescWelcome.
  ///
  /// In en, this message translates to:
  /// **'You\'ve taken the first step towards a better life. Welcome to Brainova!'**
  String get badgeDescWelcome;

  /// No description provided for @badgeTitleStreak3.
  ///
  /// In en, this message translates to:
  /// **'The Spark'**
  String get badgeTitleStreak3;

  /// No description provided for @badgeDescStreak3.
  ///
  /// In en, this message translates to:
  /// **'A 3-day streak is the spark that ignites the fire of change. Keep going!'**
  String get badgeDescStreak3;

  /// No description provided for @badgeTitleStreak7.
  ///
  /// In en, this message translates to:
  /// **'Pure Momentum'**
  String get badgeTitleStreak7;

  /// No description provided for @badgeDescStreak7.
  ///
  /// In en, this message translates to:
  /// **'A full week of success! Your brain is starting to rewire itself.'**
  String get badgeDescStreak7;

  /// No description provided for @badgeTitleMindReset5.
  ///
  /// In en, this message translates to:
  /// **'Mind Reset Master'**
  String get badgeTitleMindReset5;

  /// No description provided for @badgeDescMindReset5.
  ///
  /// In en, this message translates to:
  /// **'You\'ve completed 5 resets. Your peace of mind is growing!'**
  String get badgeDescMindReset5;

  /// No description provided for @badgeTitleStreak30.
  ///
  /// In en, this message translates to:
  /// **'Unstoppable'**
  String get badgeTitleStreak30;

  /// No description provided for @badgeDescStreak30.
  ///
  /// In en, this message translates to:
  /// **'30 days of discipline. You are now in control of your own biology.'**
  String get badgeDescStreak30;

  /// No description provided for @badgeTitleProfileComplete.
  ///
  /// In en, this message translates to:
  /// **'Full Identity'**
  String get badgeTitleProfileComplete;

  /// No description provided for @badgeDescProfileComplete.
  ///
  /// In en, this message translates to:
  /// **'Your profile is 100% complete! You are now fully known.'**
  String get badgeDescProfileComplete;

  /// No description provided for @badgeTitleContentDiet10.
  ///
  /// In en, this message translates to:
  /// **'Diet Discoverer'**
  String get badgeTitleContentDiet10;

  /// No description provided for @badgeDescContentDiet10.
  ///
  /// In en, this message translates to:
  /// **'You\'ve logged 10 items in your content diet. Awareness is key!'**
  String get badgeDescContentDiet10;

  /// No description provided for @authOr.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get authOr;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueWithGoogle;

  /// No description provided for @authDontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get authDontHaveAccount;

  /// No description provided for @authHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Have an account?'**
  String get authHaveAccount;

  /// No description provided for @authForgotSuccess.
  ///
  /// In en, this message translates to:
  /// **'Reset link sent to your email!'**
  String get authForgotSuccess;

  /// No description provided for @authAccountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created! A verification email has been sent to your inbox.'**
  String get authAccountCreated;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEmailHint;

  /// No description provided for @introSlogan.
  ///
  /// In en, this message translates to:
  /// **'Turn brain rot into brain growth'**
  String get introSlogan;

  /// No description provided for @introGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get introGetStarted;

  /// No description provided for @introWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Brainova🧠'**
  String get introWelcome;

  /// No description provided for @introDescription.
  ///
  /// In en, this message translates to:
  /// **'Brainova helps you break free from the cycle of overstimulation. Rewire your brain, reclaim your focus, and start living with intention.'**
  String get introDescription;

  /// No description provided for @introStartUsing.
  ///
  /// In en, this message translates to:
  /// **'Start Using Brainova'**
  String get introStartUsing;

  /// No description provided for @permissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Usage Access'**
  String get permissionTitle;

  /// No description provided for @permissionDescription.
  ///
  /// In en, this message translates to:
  /// **'Brainova needs usage access to monitor your digital habits and calculate your Brain Rot Score. This data stays on your device and is never shared.'**
  String get permissionDescription;

  /// No description provided for @permissionOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get permissionOpenSettings;

  /// No description provided for @commonUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get commonUser;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String commonError(String error);

  /// No description provided for @rewireTask1Title.
  ///
  /// In en, this message translates to:
  /// **'Capitals Trivia'**
  String get rewireTask1Title;

  /// No description provided for @rewireTask1Content.
  ///
  /// In en, this message translates to:
  /// **'What is the capital of Mongolia?'**
  String get rewireTask1Content;

  /// No description provided for @rewireTask1Option1.
  ///
  /// In en, this message translates to:
  /// **'Ulaanbaatar'**
  String get rewireTask1Option1;

  /// No description provided for @rewireTask1Option2.
  ///
  /// In en, this message translates to:
  /// **'Astana'**
  String get rewireTask1Option2;

  /// No description provided for @rewireTask1Option3.
  ///
  /// In en, this message translates to:
  /// **'Kathmandu'**
  String get rewireTask1Option3;

  /// No description provided for @rewireTask1Option4.
  ///
  /// In en, this message translates to:
  /// **'Thimphu'**
  String get rewireTask1Option4;

  /// No description provided for @rewireTask2Title.
  ///
  /// In en, this message translates to:
  /// **'Math Riddle'**
  String get rewireTask2Title;

  /// No description provided for @rewireTask2Content.
  ///
  /// In en, this message translates to:
  /// **'What is 15% of 80?'**
  String get rewireTask2Content;

  /// No description provided for @rewireTask2Option1.
  ///
  /// In en, this message translates to:
  /// **'12'**
  String get rewireTask2Option1;

  /// No description provided for @rewireTask2Option2.
  ///
  /// In en, this message translates to:
  /// **'10'**
  String get rewireTask2Option2;

  /// No description provided for @rewireTask2Option3.
  ///
  /// In en, this message translates to:
  /// **'15'**
  String get rewireTask2Option3;

  /// No description provided for @rewireTask2Option4.
  ///
  /// In en, this message translates to:
  /// **'14'**
  String get rewireTask2Option4;

  /// No description provided for @rewireTask3Title.
  ///
  /// In en, this message translates to:
  /// **'Gratitude'**
  String get rewireTask3Title;

  /// No description provided for @rewireTask3Content.
  ///
  /// In en, this message translates to:
  /// **'Name 3 things you are grateful for right now.'**
  String get rewireTask3Content;

  /// No description provided for @rewireTask4Title.
  ///
  /// In en, this message translates to:
  /// **'Pattern Logic'**
  String get rewireTask4Title;

  /// No description provided for @rewireTask4Content.
  ///
  /// In en, this message translates to:
  /// **'If A=1, B=2, C=3, what is BAD?'**
  String get rewireTask4Content;

  /// No description provided for @rewireTask4Option1.
  ///
  /// In en, this message translates to:
  /// **'214'**
  String get rewireTask4Option1;

  /// No description provided for @rewireTask4Option2.
  ///
  /// In en, this message translates to:
  /// **'216'**
  String get rewireTask4Option2;

  /// No description provided for @rewireTask4Option3.
  ///
  /// In en, this message translates to:
  /// **'124'**
  String get rewireTask4Option3;

  /// No description provided for @rewireTask4Option4.
  ///
  /// In en, this message translates to:
  /// **'142'**
  String get rewireTask4Option4;

  /// No description provided for @rewireTask5Title.
  ///
  /// In en, this message translates to:
  /// **'Quick Math'**
  String get rewireTask5Title;

  /// No description provided for @rewireTask5Content.
  ///
  /// In en, this message translates to:
  /// **'What is 7 x 8?'**
  String get rewireTask5Content;

  /// No description provided for @rewireTask5Option1.
  ///
  /// In en, this message translates to:
  /// **'54'**
  String get rewireTask5Option1;

  /// No description provided for @rewireTask5Option2.
  ///
  /// In en, this message translates to:
  /// **'56'**
  String get rewireTask5Option2;

  /// No description provided for @rewireTask5Option3.
  ///
  /// In en, this message translates to:
  /// **'58'**
  String get rewireTask5Option3;

  /// No description provided for @rewireTask5Option4.
  ///
  /// In en, this message translates to:
  /// **'62'**
  String get rewireTask5Option4;

  /// No description provided for @rewireTask6Title.
  ///
  /// In en, this message translates to:
  /// **'Color Quiz'**
  String get rewireTask6Title;

  /// No description provided for @rewireTask6Content.
  ///
  /// In en, this message translates to:
  /// **'Which color is associated with \'envy\'?'**
  String get rewireTask6Content;

  /// No description provided for @rewireTask6Option1.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get rewireTask6Option1;

  /// No description provided for @rewireTask6Option2.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get rewireTask6Option2;

  /// No description provided for @rewireTask6Option3.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get rewireTask6Option3;

  /// No description provided for @rewireTask6Option4.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get rewireTask6Option4;

  /// No description provided for @rewireTask7Title.
  ///
  /// In en, this message translates to:
  /// **'Sequence Logic'**
  String get rewireTask7Title;

  /// No description provided for @rewireTask7Content.
  ///
  /// In en, this message translates to:
  /// **'2, 4, 8, 16, ...?'**
  String get rewireTask7Content;

  /// No description provided for @rewireTask7Option1.
  ///
  /// In en, this message translates to:
  /// **'24'**
  String get rewireTask7Option1;

  /// No description provided for @rewireTask7Option2.
  ///
  /// In en, this message translates to:
  /// **'30'**
  String get rewireTask7Option2;

  /// No description provided for @rewireTask7Option3.
  ///
  /// In en, this message translates to:
  /// **'32'**
  String get rewireTask7Option3;

  /// No description provided for @rewireTask7Option4.
  ///
  /// In en, this message translates to:
  /// **'64'**
  String get rewireTask7Option4;

  /// No description provided for @rewireTask8Title.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness'**
  String get rewireTask8Title;

  /// No description provided for @rewireTask8Content.
  ///
  /// In en, this message translates to:
  /// **'Name one thing you can smell right now.'**
  String get rewireTask8Content;

  /// No description provided for @rewireTask9Title.
  ///
  /// In en, this message translates to:
  /// **'Geography'**
  String get rewireTask9Title;

  /// No description provided for @rewireTask9Content.
  ///
  /// In en, this message translates to:
  /// **'In which continent is the Sahara Desert?'**
  String get rewireTask9Content;

  /// No description provided for @rewireTask9Option1.
  ///
  /// In en, this message translates to:
  /// **'Asia'**
  String get rewireTask9Option1;

  /// No description provided for @rewireTask9Option2.
  ///
  /// In en, this message translates to:
  /// **'Africa'**
  String get rewireTask9Option2;

  /// No description provided for @rewireTask9Option3.
  ///
  /// In en, this message translates to:
  /// **'South America'**
  String get rewireTask9Option3;

  /// No description provided for @rewireTask9Option4.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get rewireTask9Option4;

  /// No description provided for @rewireTask10Title.
  ///
  /// In en, this message translates to:
  /// **'Binary Code'**
  String get rewireTask10Title;

  /// No description provided for @rewireTask10Content.
  ///
  /// In en, this message translates to:
  /// **'What is 1010 in decimal?'**
  String get rewireTask10Content;

  /// No description provided for @rewireTask10Option1.
  ///
  /// In en, this message translates to:
  /// **'8'**
  String get rewireTask10Option1;

  /// No description provided for @rewireTask10Option2.
  ///
  /// In en, this message translates to:
  /// **'10'**
  String get rewireTask10Option2;

  /// No description provided for @rewireTask10Option3.
  ///
  /// In en, this message translates to:
  /// **'12'**
  String get rewireTask10Option3;

  /// No description provided for @rewireTask10Option4.
  ///
  /// In en, this message translates to:
  /// **'5'**
  String get rewireTask10Option4;

  /// No description provided for @rewireTask11Title.
  ///
  /// In en, this message translates to:
  /// **'Word Association'**
  String get rewireTask11Title;

  /// No description provided for @rewireTask11Content.
  ///
  /// In en, this message translates to:
  /// **'Antonym of \'Benevolent\'?'**
  String get rewireTask11Content;

  /// No description provided for @rewireTask11Option1.
  ///
  /// In en, this message translates to:
  /// **'Kind'**
  String get rewireTask11Option1;

  /// No description provided for @rewireTask11Option2.
  ///
  /// In en, this message translates to:
  /// **'Malevolent'**
  String get rewireTask11Option2;

  /// No description provided for @rewireTask11Option3.
  ///
  /// In en, this message translates to:
  /// **'Generous'**
  String get rewireTask11Option3;

  /// No description provided for @rewireTask11Option4.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get rewireTask11Option4;

  /// No description provided for @rewireTask12Title.
  ///
  /// In en, this message translates to:
  /// **'Coding Trivia'**
  String get rewireTask12Title;

  /// No description provided for @rewireTask12Content.
  ///
  /// In en, this message translates to:
  /// **'Which language is used for Flutter?'**
  String get rewireTask12Content;

  /// No description provided for @rewireTask12Option1.
  ///
  /// In en, this message translates to:
  /// **'Java'**
  String get rewireTask12Option1;

  /// No description provided for @rewireTask12Option2.
  ///
  /// In en, this message translates to:
  /// **'Python'**
  String get rewireTask12Option2;

  /// No description provided for @rewireTask12Option3.
  ///
  /// In en, this message translates to:
  /// **'Dart'**
  String get rewireTask12Option3;

  /// No description provided for @rewireTask12Option4.
  ///
  /// In en, this message translates to:
  /// **'Swift'**
  String get rewireTask12Option4;

  /// No description provided for @rewireTask13Title.
  ///
  /// In en, this message translates to:
  /// **'Focus Check'**
  String get rewireTask13Title;

  /// No description provided for @rewireTask13Content.
  ///
  /// In en, this message translates to:
  /// **'Take a deep breath and type \'I am focused\'.'**
  String get rewireTask13Content;

  /// No description provided for @rewireTask14Title.
  ///
  /// In en, this message translates to:
  /// **'Chemistry'**
  String get rewireTask14Title;

  /// No description provided for @rewireTask14Content.
  ///
  /// In en, this message translates to:
  /// **'Symbol for Gold?'**
  String get rewireTask14Content;

  /// No description provided for @rewireTask14Option1.
  ///
  /// In en, this message translates to:
  /// **'Ag'**
  String get rewireTask14Option1;

  /// No description provided for @rewireTask14Option2.
  ///
  /// In en, this message translates to:
  /// **'Au'**
  String get rewireTask14Option2;

  /// No description provided for @rewireTask14Option3.
  ///
  /// In en, this message translates to:
  /// **'Fe'**
  String get rewireTask14Option3;

  /// No description provided for @rewireTask14Option4.
  ///
  /// In en, this message translates to:
  /// **'Cu'**
  String get rewireTask14Option4;

  /// No description provided for @rewireTask15Title.
  ///
  /// In en, this message translates to:
  /// **'Capital'**
  String get rewireTask15Title;

  /// No description provided for @rewireTask15Content.
  ///
  /// In en, this message translates to:
  /// **'Capital of Canada?'**
  String get rewireTask15Content;

  /// No description provided for @rewireTask15Option1.
  ///
  /// In en, this message translates to:
  /// **'Toronto'**
  String get rewireTask15Option1;

  /// No description provided for @rewireTask15Option2.
  ///
  /// In en, this message translates to:
  /// **'Vancouver'**
  String get rewireTask15Option2;

  /// No description provided for @rewireTask15Option3.
  ///
  /// In en, this message translates to:
  /// **'Ottawa'**
  String get rewireTask15Option3;

  /// No description provided for @rewireTask15Option4.
  ///
  /// In en, this message translates to:
  /// **'Montreal'**
  String get rewireTask15Option4;

  /// No description provided for @rewireTask16Title.
  ///
  /// In en, this message translates to:
  /// **'Astronomy'**
  String get rewireTask16Title;

  /// No description provided for @rewireTask16Content.
  ///
  /// In en, this message translates to:
  /// **'Which planet is the \'Red Planet\'?'**
  String get rewireTask16Content;

  /// No description provided for @rewireTask16Option1.
  ///
  /// In en, this message translates to:
  /// **'Venus'**
  String get rewireTask16Option1;

  /// No description provided for @rewireTask16Option2.
  ///
  /// In en, this message translates to:
  /// **'Mars'**
  String get rewireTask16Option2;

  /// No description provided for @rewireTask16Option3.
  ///
  /// In en, this message translates to:
  /// **'Jupiter'**
  String get rewireTask16Option3;

  /// No description provided for @rewireTask16Option4.
  ///
  /// In en, this message translates to:
  /// **'Saturn'**
  String get rewireTask16Option4;

  /// No description provided for @rewireTask17Title.
  ///
  /// In en, this message translates to:
  /// **'Anagram'**
  String get rewireTask17Title;

  /// No description provided for @rewireTask17Content.
  ///
  /// In en, this message translates to:
  /// **'Rearrange: EFOLI'**
  String get rewireTask17Content;

  /// No description provided for @rewireTask17Option1.
  ///
  /// In en, this message translates to:
  /// **'Life'**
  String get rewireTask17Option1;

  /// No description provided for @rewireTask17Option2.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get rewireTask17Option2;

  /// No description provided for @rewireTask17Option3.
  ///
  /// In en, this message translates to:
  /// **'Foil'**
  String get rewireTask17Option3;

  /// No description provided for @rewireTask17Option4.
  ///
  /// In en, this message translates to:
  /// **'Life/File'**
  String get rewireTask17Option4;

  /// No description provided for @rewireTask17bTitle.
  ///
  /// In en, this message translates to:
  /// **'Anagram'**
  String get rewireTask17bTitle;

  /// No description provided for @rewireTask17bContent.
  ///
  /// In en, this message translates to:
  /// **'Rearrange: T R A E H'**
  String get rewireTask17bContent;

  /// No description provided for @rewireTask17bOption1.
  ///
  /// In en, this message translates to:
  /// **'Heart'**
  String get rewireTask17bOption1;

  /// No description provided for @rewireTask17bOption2.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get rewireTask17bOption2;

  /// No description provided for @rewireTask17bOption3.
  ///
  /// In en, this message translates to:
  /// **'Hater'**
  String get rewireTask17bOption3;

  /// No description provided for @rewireTask17bOption4.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get rewireTask17bOption4;

  /// No description provided for @rewireTask18Title.
  ///
  /// In en, this message translates to:
  /// **'Reflection'**
  String get rewireTask18Title;

  /// No description provided for @rewireTask18Content.
  ///
  /// In en, this message translates to:
  /// **'What is your small win for today?'**
  String get rewireTask18Content;

  /// No description provided for @rewireTask19Title.
  ///
  /// In en, this message translates to:
  /// **'Physics'**
  String get rewireTask19Title;

  /// No description provided for @rewireTask19Content.
  ///
  /// In en, this message translates to:
  /// **'Approximate speed of light?'**
  String get rewireTask19Content;

  /// No description provided for @rewireTask19Option1.
  ///
  /// In en, this message translates to:
  /// **'300k km/s'**
  String get rewireTask19Option1;

  /// No description provided for @rewireTask19Option2.
  ///
  /// In en, this message translates to:
  /// **'150k km/s'**
  String get rewireTask19Option2;

  /// No description provided for @rewireTask19Option3.
  ///
  /// In en, this message translates to:
  /// **'1M km/s'**
  String get rewireTask19Option3;

  /// No description provided for @rewireTask19Option4.
  ///
  /// In en, this message translates to:
  /// **'Sound speed'**
  String get rewireTask19Option4;

  /// No description provided for @rewireTask20Title.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get rewireTask20Title;

  /// No description provided for @rewireTask20Content.
  ///
  /// In en, this message translates to:
  /// **'Year of the first moon landing?'**
  String get rewireTask20Content;

  /// No description provided for @rewireTask20Option1.
  ///
  /// In en, this message translates to:
  /// **'1965'**
  String get rewireTask20Option1;

  /// No description provided for @rewireTask20Option2.
  ///
  /// In en, this message translates to:
  /// **'1969'**
  String get rewireTask20Option2;

  /// No description provided for @rewireTask20Option3.
  ///
  /// In en, this message translates to:
  /// **'1972'**
  String get rewireTask20Option3;

  /// No description provided for @rewireTask20Option4.
  ///
  /// In en, this message translates to:
  /// **'1959'**
  String get rewireTask20Option4;

  /// No description provided for @rewireTask21Title.
  ///
  /// In en, this message translates to:
  /// **'Anatomy'**
  String get rewireTask21Title;

  /// No description provided for @rewireTask21Content.
  ///
  /// In en, this message translates to:
  /// **'Largest organ in the human body?'**
  String get rewireTask21Content;

  /// No description provided for @rewireTask21Option1.
  ///
  /// In en, this message translates to:
  /// **'Brain'**
  String get rewireTask21Option1;

  /// No description provided for @rewireTask21Option2.
  ///
  /// In en, this message translates to:
  /// **'Liver'**
  String get rewireTask21Option2;

  /// No description provided for @rewireTask21Option3.
  ///
  /// In en, this message translates to:
  /// **'Skin'**
  String get rewireTask21Option3;

  /// No description provided for @rewireTask21Option4.
  ///
  /// In en, this message translates to:
  /// **'Heart'**
  String get rewireTask21Option4;

  /// No description provided for @rewireTask22Title.
  ///
  /// In en, this message translates to:
  /// **'Riddle'**
  String get rewireTask22Title;

  /// No description provided for @rewireTask22Content.
  ///
  /// In en, this message translates to:
  /// **'What goes down but never up?'**
  String get rewireTask22Content;

  /// No description provided for @rewireTask22Option1.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get rewireTask22Option1;

  /// No description provided for @rewireTask22Option2.
  ///
  /// In en, this message translates to:
  /// **'Steam'**
  String get rewireTask22Option2;

  /// No description provided for @rewireTask22Option3.
  ///
  /// In en, this message translates to:
  /// **'Balloon'**
  String get rewireTask22Option3;

  /// No description provided for @rewireTask22Option4.
  ///
  /// In en, this message translates to:
  /// **'Smoke'**
  String get rewireTask22Option4;

  /// No description provided for @adminSearchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search by Email or Name...'**
  String get adminSearchUsers;

  /// No description provided for @adminUnknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown User'**
  String get adminUnknownUser;

  /// No description provided for @adminNoEmail.
  ///
  /// In en, this message translates to:
  /// **'No Email'**
  String get adminNoEmail;

  /// No description provided for @adminUserStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get adminUserStreak;

  /// No description provided for @adminUserActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get adminUserActivity;

  /// No description provided for @adminUserPoints.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get adminUserPoints;

  /// No description provided for @adminRestrictUser.
  ///
  /// In en, this message translates to:
  /// **'Restrict User'**
  String get adminRestrictUser;

  /// No description provided for @adminUnrestrictUser.
  ///
  /// In en, this message translates to:
  /// **'Remove Restriction'**
  String get adminUnrestrictUser;

  /// No description provided for @adminDeleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User Account'**
  String get adminDeleteUser;

  /// No description provided for @adminDeleteUserConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete User?'**
  String get adminDeleteUserConfirm;

  /// No description provided for @adminDeleteUserWarning.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete the user data from Firestore. This action cannot be undone.'**
  String get adminDeleteUserWarning;

  /// No description provided for @adminActiveChallenges.
  ///
  /// In en, this message translates to:
  /// **'Active Challenges'**
  String get adminActiveChallenges;

  /// No description provided for @adminNewChallenge.
  ///
  /// In en, this message translates to:
  /// **'New Challenge'**
  String get adminNewChallenge;

  /// No description provided for @adminCreateChallenge.
  ///
  /// In en, this message translates to:
  /// **'Create Challenge'**
  String get adminCreateChallenge;

  /// No description provided for @adminEditChallenge.
  ///
  /// In en, this message translates to:
  /// **'Edit Challenge'**
  String get adminEditChallenge;

  /// No description provided for @adminChallengeTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get adminChallengeTitle;

  /// No description provided for @adminChallengeDesc.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get adminChallengeDesc;

  /// No description provided for @adminChallengeStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get adminChallengeStartDate;

  /// No description provided for @adminChallengeEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get adminChallengeEndDate;

  /// No description provided for @adminChallengeDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration (Days)'**
  String get adminChallengeDuration;

  /// No description provided for @adminChallengePoints.
  ///
  /// In en, this message translates to:
  /// **'Points Reward'**
  String get adminChallengePoints;

  /// No description provided for @adminChallengeCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get adminChallengeCategory;

  /// No description provided for @adminSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get adminSave;

  /// No description provided for @adminCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get adminCancel;

  /// No description provided for @adminDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get adminDelete;

  /// No description provided for @challengePointsLabel.
  ///
  /// In en, this message translates to:
  /// **'{count} Points'**
  String challengePointsLabel(Object count);

  /// No description provided for @challengeTitleMorningMeditation.
  ///
  /// In en, this message translates to:
  /// **'Morning Meditation'**
  String get challengeTitleMorningMeditation;

  /// No description provided for @challengeDescMorningMeditation.
  ///
  /// In en, this message translates to:
  /// **'Start your day with clarity. 10 mins focus.'**
  String get challengeDescMorningMeditation;

  /// No description provided for @challengeTitleDigitalSunset.
  ///
  /// In en, this message translates to:
  /// **'Digital Sunset'**
  String get challengeTitleDigitalSunset;

  /// No description provided for @challengeDescDigitalSunset.
  ///
  /// In en, this message translates to:
  /// **'No screens 1 hour before bed.'**
  String get challengeDescDigitalSunset;

  /// No description provided for @challengeTitleSocialMediaFast.
  ///
  /// In en, this message translates to:
  /// **'Social Media Fast'**
  String get challengeTitleSocialMediaFast;

  /// No description provided for @challengeDescSocialMediaFast.
  ///
  /// In en, this message translates to:
  /// **'24 hours without scrolling.'**
  String get challengeDescSocialMediaFast;

  /// No description provided for @challengeTitleDeepWork.
  ///
  /// In en, this message translates to:
  /// **'Deep Work Focus'**
  String get challengeTitleDeepWork;

  /// No description provided for @challengeDescDeepWork.
  ///
  /// In en, this message translates to:
  /// **'2 hours of focused work daily.'**
  String get challengeDescDeepWork;

  /// No description provided for @mindResetRotLabel.
  ///
  /// In en, this message translates to:
  /// **'-{count} Rot'**
  String mindResetRotLabel(Object count);

  /// No description provided for @categoryDopamineFast.
  ///
  /// In en, this message translates to:
  /// **'Dopamine Fast'**
  String get categoryDopamineFast;

  /// No description provided for @categoryMentalReset.
  ///
  /// In en, this message translates to:
  /// **'Mental Reset'**
  String get categoryMentalReset;

  /// No description provided for @categoryPhysical.
  ///
  /// In en, this message translates to:
  /// **'Physical'**
  String get categoryPhysical;

  /// No description provided for @categoryGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get categoryGeneral;

  /// No description provided for @adminAnalyticsTitle.
  ///
  /// In en, this message translates to:
  /// **'In-Depth Analytics'**
  String get adminAnalyticsTitle;

  /// No description provided for @adminContentDietTitle.
  ///
  /// In en, this message translates to:
  /// **'Content Diet Distribution'**
  String get adminContentDietTitle;

  /// No description provided for @adminContentDietSubtitle.
  ///
  /// In en, this message translates to:
  /// **'User engagement by category (Today)'**
  String get adminContentDietSubtitle;

  /// No description provided for @adminBrainRotDistribution.
  ///
  /// In en, this message translates to:
  /// **'Brain Rot Distribution'**
  String get adminBrainRotDistribution;

  /// No description provided for @adminBrainRotWeeklySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly average per day'**
  String get adminBrainRotWeeklySubtitle;

  /// No description provided for @adminMostUsedMindReset.
  ///
  /// In en, this message translates to:
  /// **'Most Used Mind Reset:'**
  String get adminMostUsedMindReset;

  /// No description provided for @adminTopActiveChallenge.
  ///
  /// In en, this message translates to:
  /// **'Top Active Challenge:'**
  String get adminTopActiveChallenge;

  /// No description provided for @adminAchievementBadges.
  ///
  /// In en, this message translates to:
  /// **'Achievement Badges'**
  String get adminAchievementBadges;

  /// No description provided for @adminBadgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Badge Title'**
  String get adminBadgeTitle;

  /// No description provided for @adminBadgeDesc.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get adminBadgeDesc;

  /// No description provided for @adminBadgeIconName.
  ///
  /// In en, this message translates to:
  /// **'Icon Name (e.g., trophy, flame)'**
  String get adminBadgeIconName;

  /// No description provided for @adminBadgeConditionType.
  ///
  /// In en, this message translates to:
  /// **'Condition Type'**
  String get adminBadgeConditionType;

  /// No description provided for @adminBadgeConditionValue.
  ///
  /// In en, this message translates to:
  /// **'Condition Value'**
  String get adminBadgeConditionValue;

  /// No description provided for @adminBadgeUnitLabel.
  ///
  /// In en, this message translates to:
  /// **'Unit Label (e.g., days, sessions)'**
  String get adminBadgeUnitLabel;

  /// No description provided for @adminSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get adminSaveChanges;

  /// No description provided for @adminInfoCenter.
  ///
  /// In en, this message translates to:
  /// **'Info Center'**
  String get adminInfoCenter;

  /// No description provided for @adminActivityLogs.
  ///
  /// In en, this message translates to:
  /// **'Activity Logs'**
  String get adminActivityLogs;

  /// No description provided for @adminBrainRotThresholds.
  ///
  /// In en, this message translates to:
  /// **'Brain Rot Thresholds'**
  String get adminBrainRotThresholds;

  /// No description provided for @adminHealthyZone.
  ///
  /// In en, this message translates to:
  /// **'Healthy Zone'**
  String get adminHealthyZone;

  /// No description provided for @adminHealthyZoneDesc.
  ///
  /// In en, this message translates to:
  /// **'Balanced digital usage. Focus on productivity and real-world interactions.'**
  String get adminHealthyZoneDesc;

  /// No description provided for @adminCautionZone.
  ///
  /// In en, this message translates to:
  /// **'Caution Zone'**
  String get adminCautionZone;

  /// No description provided for @adminCautionZoneDesc.
  ///
  /// In en, this message translates to:
  /// **'Increasing passive consumption. Consider a short Mind Reset.'**
  String get adminCautionZoneDesc;

  /// No description provided for @adminDangerZone.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get adminDangerZone;

  /// No description provided for @adminDangerZoneDesc.
  ///
  /// In en, this message translates to:
  /// **'High passive consumption detected. Immediate action recommended.'**
  String get adminDangerZoneDesc;

  /// No description provided for @adminPointsSystem.
  ///
  /// In en, this message translates to:
  /// **'Points System'**
  String get adminPointsSystem;

  /// No description provided for @adminRewireReward.
  ///
  /// In en, this message translates to:
  /// **'Rewire Mode Reward'**
  String get adminRewireReward;

  /// No description provided for @adminRewireRewardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete short exercises.'**
  String get adminRewireRewardSubtitle;

  /// No description provided for @adminMindResetReward.
  ///
  /// In en, this message translates to:
  /// **'Mind Reset Reward'**
  String get adminMindResetReward;

  /// No description provided for @adminMindResetRewardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete physical or mental rejuvenation tasks.'**
  String get adminMindResetRewardSubtitle;

  /// No description provided for @adminChallengeReward.
  ///
  /// In en, this message translates to:
  /// **'Challenge Completion'**
  String get adminChallengeReward;

  /// No description provided for @adminChallengeRewardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Finish community challenges for maximum rewards.'**
  String get adminChallengeRewardSubtitle;

  /// No description provided for @adminPointsUsageFooter.
  ///
  /// In en, this message translates to:
  /// **'Points can be used to unlock exclusive achievements and climb the community rankings.'**
  String get adminPointsUsageFooter;

  /// No description provided for @adminSystemFeatures.
  ///
  /// In en, this message translates to:
  /// **'System Features'**
  String get adminSystemFeatures;

  /// No description provided for @adminBrainRotMeterTitle.
  ///
  /// In en, this message translates to:
  /// **'Brain Rot Meter'**
  String get adminBrainRotMeterTitle;

  /// No description provided for @adminBrainRotMeterDesc.
  ///
  /// In en, this message translates to:
  /// **'Tracks daily digital consumption and calculates your real-time Brain Rot Score.'**
  String get adminBrainRotMeterDesc;

  /// No description provided for @adminCommunityChallengesTitle.
  ///
  /// In en, this message translates to:
  /// **'Community Challenges'**
  String get adminCommunityChallengesTitle;

  /// No description provided for @adminCommunityChallengesDesc.
  ///
  /// In en, this message translates to:
  /// **'Participate in global events to reduce collective passive screen time.'**
  String get adminCommunityChallengesDesc;

  /// No description provided for @adminSmartNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Notifications'**
  String get adminSmartNotificationsTitle;

  /// No description provided for @adminSmartNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Motivational alerts that encourage healthier digital habits and timely resets.'**
  String get adminSmartNotificationsDesc;

  /// No description provided for @adminRealtimeAnalyticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Real-time Analytics'**
  String get adminRealtimeAnalyticsTitle;

  /// No description provided for @adminRealtimeAnalyticsDesc.
  ///
  /// In en, this message translates to:
  /// **'Provides a summary of the user’s digital activity based on recorded app usage.'**
  String get adminRealtimeAnalyticsDesc;

  /// No description provided for @adminHowBrainovaWorks.
  ///
  /// In en, this message translates to:
  /// **'How Brainova Works'**
  String get adminHowBrainovaWorks;

  /// No description provided for @adminStep1.
  ///
  /// In en, this message translates to:
  /// **'Track daily app usage automatically.'**
  String get adminStep1;

  /// No description provided for @adminStep2.
  ///
  /// In en, this message translates to:
  /// **'Calculate Brain Rot Score patterns based on activities.'**
  String get adminStep2;

  /// No description provided for @adminStep3.
  ///
  /// In en, this message translates to:
  /// **'Suggest Mind Reset & Rewire Mode activities.'**
  String get adminStep3;

  /// No description provided for @adminStep4.
  ///
  /// In en, this message translates to:
  /// **'Reward healthy habits with points and badges.'**
  String get adminStep4;

  /// No description provided for @adminAppDetails.
  ///
  /// In en, this message translates to:
  /// **'App Details'**
  String get adminAppDetails;

  /// No description provided for @adminAppVersion.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get adminAppVersion;

  /// No description provided for @adminDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get adminDeveloper;

  /// No description provided for @adminSystemStatus.
  ///
  /// In en, this message translates to:
  /// **'System Status'**
  String get adminSystemStatus;

  /// No description provided for @adminOperational.
  ///
  /// In en, this message translates to:
  /// **'Operational'**
  String get adminOperational;

  /// No description provided for @brainovaStartMessage.
  ///
  /// In en, this message translates to:
  /// **'This is where the actual Brainova app starts!'**
  String get brainovaStartMessage;

  /// No description provided for @commonNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get commonNone;

  /// No description provided for @mindResetTypeText.
  ///
  /// In en, this message translates to:
  /// **'Type your thoughts here...'**
  String get mindResetTypeText;

  /// No description provided for @adminNewBadge.
  ///
  /// In en, this message translates to:
  /// **'New Badge'**
  String get adminNewBadge;

  /// No description provided for @adminEditBadge.
  ///
  /// In en, this message translates to:
  /// **'Edit Badge'**
  String get adminEditBadge;

  /// No description provided for @adminAvgBrainRot.
  ///
  /// In en, this message translates to:
  /// **'Avg Brain Rot'**
  String get adminAvgBrainRot;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
