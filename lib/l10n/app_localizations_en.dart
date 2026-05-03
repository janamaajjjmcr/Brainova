// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Brainova';

  @override
  String get navDiet => 'Diet';

  @override
  String get navReset => 'Reset';

  @override
  String get navHome => 'Home';

  @override
  String get navRewire => 'Rewire';

  @override
  String get navProfile => 'Profile';

  @override
  String get navAdmin => 'Admin';

  @override
  String get adminDashboardTitle => 'Dashboard Overview';

  @override
  String get adminChallengeManagement => 'Challenge Management';

  @override
  String get adminUserManagement => 'User Management';

  @override
  String get adminAnalyticsReports => 'Analytics & Reports';

  @override
  String get adminBadgeManagement => 'Badge Management';

  @override
  String get adminAppSettings => 'Brainova Information Center';

  @override
  String get adminExit => 'Exit Admin';

  @override
  String get adminBackToOverview => 'Back to Overview';

  @override
  String get adminSystemHealth => 'System Health';

  @override
  String get adminTotalUsers => 'Total Users';

  @override
  String get adminActiveToday => 'Active Today';

  @override
  String get adminAvgBrain_rot => 'Avg. Brain Rot';

  @override
  String get adminResetsDone => 'Resets Done';

  @override
  String get adminManagementActions => 'Management Actions';

  @override
  String get adminHome => 'Home';

  @override
  String get adminChallenges => 'Challenges';

  @override
  String get adminUsers => 'Users';

  @override
  String get adminStats => 'Stats';

  @override
  String get adminBadges => 'Badges';

  @override
  String get adminInfo => 'Info';

  @override
  String get adminSettings => 'Settings';

  @override
  String get homeQuickActions => 'Quick Actions';

  @override
  String get homeMindReset => 'Mind Reset';

  @override
  String get homeRewireMode => 'Rewire Mode';

  @override
  String get homeRealityCheck => 'Reality Check';

  @override
  String get homeContentDiet => 'Content Diet';

  @override
  String get homeDaysLabel => 'Days';

  @override
  String get brainRotMeterTitle => 'Brain Rot Meter';

  @override
  String get brainRotStatusHealthy => 'Healthy';

  @override
  String get brainRotStatusCaution => 'Caution';

  @override
  String get brainRotStatusDanger => 'Danger';

  @override
  String get brainRotCurrentStreak => 'Current Streak';

  @override
  String brainRotDays(int count) {
    return '$count days';
  }

  @override
  String get brainRotMindResets => 'Mind Resets';

  @override
  String challengePeopleJoined(int count) {
    return '$count People Joined';
  }

  @override
  String get challengeJoin => 'Join Challenge';

  @override
  String get challengeCompleted => 'Completed';

  @override
  String get challengeActive => 'Challenge Active';

  @override
  String get challengeLeave => 'Leave Challenge';

  @override
  String get challengeLeaveTitle => 'Leave Challenge';

  @override
  String get challengeLeaveBody =>
      'Are you sure you want to leave the challenge?';

  @override
  String get challengeCancel => 'Cancel';

  @override
  String get challengeDone => 'DONE';

  @override
  String challengeDonePercent(int percent) {
    return '$percent% Done';
  }

  @override
  String challengeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Days',
      one: '1 Day',
    );
    return '$_temp0';
  }

  @override
  String get badgeLocked => 'LOCKED';

  @override
  String get badgeEarned => 'EARNED';

  @override
  String homeDaysStreak(int count) {
    return '$count Days';
  }

  @override
  String get profileYourStatistics => 'Your Statistics';

  @override
  String get profileTrackDailyMood => 'Track Your Daily Mood';

  @override
  String get profileAccount => 'Account';

  @override
  String get profileMore => 'More';

  @override
  String get profilePersonalInformation => 'Personal Information';

  @override
  String get profilePrivacySecurity => 'Privacy & Security';

  @override
  String get profileHelpSupport => 'Help & Support';

  @override
  String get profileSignOut => 'Sign Out';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileCompleteDailyTask => 'Complete Daily Task';

  @override
  String get profileSelectLanguage => 'Select Language';

  @override
  String get profileTheme => 'Dark Mode';

  @override
  String get profileResets => 'Resets';

  @override
  String get profileDayStreak => 'Day Streak';

  @override
  String get profilePointsToday => 'Points Today';

  @override
  String get profileTasksDone => 'Tasks Done';

  @override
  String get loginWelcomeBack => 'Welcome Back';

  @override
  String get loginSubtitle => 'Continue your journey to a healthier mind';

  @override
  String get loginEmailHint => 'Example@gmail.com';

  @override
  String get loginPasswordHint => 'Password (8+ chars, upper, number, symbol)';

  @override
  String get loginForgotPassword => 'Forgot Password?';

  @override
  String get loginButton => 'Log In';

  @override
  String get loginNoAccount => 'Don\'t have an account?';

  @override
  String get loginSignUp => 'Sign Up';

  @override
  String get loginOr => 'OR';

  @override
  String get loginContinueWithGoogle => 'Continue with Google';

  @override
  String get signupCreateAccount => 'Create Account';

  @override
  String get signupSubtitle => 'Start your digital detox journey today';

  @override
  String get signupFullName => 'Full Name';

  @override
  String get signupEmailHint => 'Example@gmail.com';

  @override
  String get signupPasswordHint => 'Password (8+ chars, upper, number, symbol)';

  @override
  String get signupConfirmPassword => 'Confirm Password';

  @override
  String get signupButton => 'Sign Up';

  @override
  String get signupOr => 'OR';

  @override
  String get signupContinueWithGoogle => 'Continue with Google';

  @override
  String get signupAlreadyHaveAccount => 'Already have an account?';

  @override
  String get signupLogIn => 'Log In';

  @override
  String get signupPasswordMismatch => 'Passwords do not match';

  @override
  String get signupSuccess =>
      'Account created! A verification email has been sent to your inbox.';

  @override
  String get realityCheckTitle => 'Reality Check';

  @override
  String get realityCheckPleaseLogin => 'Please Login';

  @override
  String get realityCheckSuggestedAction => 'Suggested Action';

  @override
  String get realityCheckStartMindReset => 'Start Mind Reset';

  @override
  String get realityCheckTryRewireMode => 'Try Rewire Mode';

  @override
  String get realityCheckStatusHealthy => 'Healthy';

  @override
  String get realityCheckStatusCaution => 'Caution';

  @override
  String get realityCheckStatusDanger => 'Danger';

  @override
  String get realityCheckMessageHealthy =>
      'Your digital balance looks stable. Keep it up.';

  @override
  String get realityCheckMessageCaution =>
      'You are leaning toward heavy stimulation. Consider a reset.';

  @override
  String get realityCheckMessageDanger =>
      'High stimulation detected. Your digital habits may be affecting focus.';

  @override
  String get realityCheckNoActivity => 'No significant activity detected.';

  @override
  String get realityCheckCategorySocial => 'Social';

  @override
  String get realityCheckCategoryJunk => 'Junk';

  @override
  String get realityCheckCategoryLearning => 'Learning';

  @override
  String get realityCheckCategoryEntertainment => 'Entertainment';

  @override
  String get realityCheckCategoryNeutral => 'Neutral';

  @override
  String get realityCheckSummary => 'Activity Summary';

  @override
  String get rewireSubmitAnswer => 'Submit Answer';

  @override
  String get rewireTypeAnswer => 'Type your answer here...';

  @override
  String rewireCorrect(int points) {
    return 'Correct! -$points Rot';
  }

  @override
  String get rewireIncorrect => 'Incorrect, try again!';

  @override
  String get rewireTryAgain => 'Try Again';

  @override
  String get rewireExit => 'Exit';

  @override
  String get rewireNextTask => 'Next Task';

  @override
  String get mindResetBreathing => 'Breathing';

  @override
  String get mindResetAudio => 'Audio';

  @override
  String get mindResetStretch => 'Stretch';

  @override
  String get mindResetJournaling => 'Journaling';

  @override
  String get mindResetMeditation => 'Meditation';

  @override
  String mindResetStepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get mindResetInstructions => 'INSTRUCTIONS';

  @override
  String get mindResetActivityCompleted => 'Activity Completed!';

  @override
  String get mindResetDone => 'Done';

  @override
  String get mindResetFocusOnSound => 'Focus on the sound...';

  @override
  String get mindResetPressPlay => 'Press play to start';

  @override
  String mindResetMin(int count) {
    return '$count min';
  }

  @override
  String get mindResetClearMind => 'Clear your mind and let thoughts flow...';

  @override
  String get mindResetTitle1 => 'Box Breathing';

  @override
  String get mindResetDesc1 =>
      'A powerful breathing technique used to quickly calm the mind and reset your nervous system.';

  @override
  String get mindResetTitle2 => 'Neck & Shoulder Reset';

  @override
  String get mindResetDesc2 =>
      'Release tension in your neck and shoulders after long periods of screen time.';

  @override
  String get mindResetTitle3 => 'Rain Sounds';

  @override
  String get mindResetDesc3 => 'Let the sound of rain wash away mental noise.';

  @override
  String get mindResetTitle4 => 'Eye Workout';

  @override
  String get mindResetDesc4 =>
      'Refresh tired eyes and reduce strain after long sessions of screen use.';

  @override
  String get mindResetTitle5 => 'Brain Dump';

  @override
  String get mindResetDesc5 =>
      'Unload your thoughts onto paper to clear your mind and regain focus.';

  @override
  String get mindResetTitle6 => 'Digital Detox';

  @override
  String get mindResetDesc6 =>
      'Put your phone down and reconnect with reality.';

  @override
  String get mindResetStep1_1 => 'Inhale through your nose for 4 seconds.';

  @override
  String get mindResetStep1_2 => 'Hold your breath for 4 seconds.';

  @override
  String get mindResetStep1_3 => 'Exhale slowly for 4 seconds.';

  @override
  String get mindResetStep1_4 => 'Hold empty for 4 seconds. Repeat.';

  @override
  String get mindResetStep2_1 => 'Sit up straight, shoulders relaxed.';

  @override
  String get mindResetStep2_2 => 'Drop right ear to right shoulder. Hold 10s.';

  @override
  String get mindResetStep2_3 => 'Roll head forward to chest. Hold 10s.';

  @override
  String get mindResetStep2_4 => 'Drop left ear to left shoulder. Hold 10s.';

  @override
  String get mindResetStep2_5 => 'Roll both shoulders backward 5 times.';

  @override
  String get mindResetStep2_6 => 'Stretch arms above your head.';

  @override
  String get mindResetStep3_1 => 'Put on headphones.';

  @override
  String get mindResetStep3_2 => 'Close your eyes or soften your gaze.';

  @override
  String get mindResetStep3_3 =>
      'Let the sound fill your attention completely.';

  @override
  String get mindResetStep3_4 =>
      'Whenever your mind drifts, come back to the sound of the rain.';

  @override
  String get mindResetStep4_1 =>
      'Look up and hold 3s, look down and hold 3s. Repeat 3 times.';

  @override
  String get mindResetStep4_2 =>
      'Look right and hold 3s, look left and hold 3s. Repeat 3 times.';

  @override
  String get mindResetStep4_3 =>
      'Look top-left 3s, look top-right 3s. Repeat 3 times.';

  @override
  String get mindResetStep4_4 =>
      'Rotate eyeballs 3 times right, then 3 times left. Blink to relax.';

  @override
  String get mindResetStep4_5 =>
      'Close eyes tight and hold for 10 seconds. Relax.';

  @override
  String get mindResetStep4_6 =>
      'Open eyes wide and hold 10 seconds. Blink repeatedly to finish.';

  @override
  String get mindResetStep5_1 => 'Open a notes app or grab paper.';

  @override
  String get mindResetStep5_2 => 'Write every thought, worry, or task.';

  @override
  String get mindResetStep5_3 => 'Do not filter or judge just write.';

  @override
  String get mindResetStep5_4 => 'Cross out things you cannot control.';

  @override
  String get mindResetStep5_5 => 'Circle the one thing that matters most.';

  @override
  String get mindResetStep6_1 =>
      'Put your phone down and step away from the screen.';

  @override
  String get mindResetStep6_2 => 'Take a slow deep breath and relax your body.';

  @override
  String get mindResetStep6_3 => 'Look around and notice your surroundings.';

  @override
  String get mindResetStep6_4 =>
      'Focus on the present moment instead of your device.';

  @override
  String get mindResetStep6_5 =>
      'Enjoy a short break from digital stimulation.';

  @override
  String get contentDietLogContent => 'Log Content';

  @override
  String get contentDietHowDidYouSpend => 'How did you spend your time?';

  @override
  String get contentDietRecentLogs => 'Recent Logs';

  @override
  String get contentDietDuration => 'Duration (minutes)';

  @override
  String get contentDietNotes => 'Notes (optional)';

  @override
  String get contentDietSaveEntry => 'Save Entry';

  @override
  String get contentDietEntryAdded => 'Entry Added!';

  @override
  String get contentDietNoEntries => 'No entries yet.';

  @override
  String get contentDietWeeklySummary => 'Weekly Summary';

  @override
  String get contentDietNoData => 'No Data';

  @override
  String get contentDietLearning => 'Learning';

  @override
  String get contentDietEntertainment => 'Entert.';

  @override
  String get contentDietJunk => 'Junk';

  @override
  String get contentDietSocial => 'Social';

  @override
  String get contentDietLearningFull => 'LEARNING';

  @override
  String get contentDietEntertainmentFull => 'ENTERTAINMENT';

  @override
  String get contentDietJunkFull => 'JUNK';

  @override
  String get contentDietSocialFull => 'SOCIAL';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String achievementsUnlocked(int count, int total) {
    return '$count / $total Unlocked';
  }

  @override
  String get achievementsNoBadges => 'No badges available yet.';

  @override
  String streakDayStreak(int count) {
    return '$count Day Streak';
  }

  @override
  String get streakKeepItUp => 'Keep it up!';

  @override
  String get challengesNone =>
      'No active challenges yet.\nAdmin hasn\'t created any.';

  @override
  String get accessRestricted => 'Access Restricted';

  @override
  String get accessRestrictedBody =>
      'Your account has been restricted by the administrator. Please contact support if you believe this is a mistake.';

  @override
  String get logOut => 'Log Out';

  @override
  String errorGeneric(String message) {
    return 'Error: $message';
  }

  @override
  String get privacyTitle => 'Privacy & Security';

  @override
  String get privacyDataCollection => 'Data Collection';

  @override
  String get privacyDataCollectionContent =>
      'Brainova collects your app usage data on your device to calculate your Brain Rot meter and Reality Check insights. This data is stored securely in your personal account and is never shared with third parties.';

  @override
  String get privacyWhatWeTrack => 'What We Track';

  @override
  String get privacyWhatWeTrackContent =>
      'We track which apps you use and for how long. This includes entertainment apps, social media, and productivity tools. We do not access the content of your apps or messages.';

  @override
  String get privacyDataSecurity => 'Data Security';

  @override
  String get privacyDataSecurityContent =>
      'Your data is securely stored using Firebase. Access to your activity data is protected through authentication and encrypted connections to keep your information safe.';

  @override
  String get privacyYourRights => 'Your Rights';

  @override
  String get privacyYourRightsContent =>
      'You have the right to delete your data at any time. You can also revoke app usage permissions from your device settings at any time. Deleting your account will permanently remove all your stored data.';

  @override
  String get privacyReliabilitySettings => 'Reliability Settings';

  @override
  String get privacyBackgroundAlerts => 'Background Alerts';

  @override
  String get privacyBackgroundAlertsDesc =>
      'To receive alerts even when you are not using the app, please ensure \"Unrestricted\" battery usage is enabled for Brainova.';

  @override
  String get privacyEnableReliableAlerts => 'Enable Reliable Alerts';

  @override
  String get privacyPermissionsUsed => 'Permissions Used';

  @override
  String get privacyUsageAccess => 'Usage Access';

  @override
  String get privacyUsageAccessDesc =>
      'Usage Access — to track which apps you use.';

  @override
  String get privacyNotifications => 'Notifications';

  @override
  String get privacyNotificationsDesc =>
      'Notifications — to alert you when Brain Rot scores are high.';

  @override
  String get privacyInternet => 'Internet';

  @override
  String get privacyInternetDesc => 'Internet — to sync your data securely.';

  @override
  String get helpTitle => 'Help & Support';

  @override
  String get helpFaq => 'Frequently Asked Questions';

  @override
  String get helpTroubleshooting => 'Troubleshooting';

  @override
  String get helpQ1 => 'What is the Brain Rot Meter?';

  @override
  String get helpA1 =>
      'The Brain Rot Meter measures your digital consumption habits over the last 24 hours. A higher score means more time spent on non-productive screen activities. The score is based on your activity during the last 24 hours and updates automatically throughout the day.';

  @override
  String get helpQ2 => 'How is my score calculated?';

  @override
  String get helpA2 =>
      'Your score is based on how long you use certain apps. Entertainment and social media apps increase your score, while learning and productivity apps lower it. Mind Resets and Rewire sessions also reduce your score.';

  @override
  String get helpQ3 => 'What is a Mind Reset?';

  @override
  String get helpA3 =>
      'A Mind Reset is a short activity that helps counteract brain rot. Completing one reduces your Brain Rot Score significantly.';

  @override
  String get helpQ4 => 'What is Rewire Mode?';

  @override
  String get helpA4 =>
      'Rewire Mode gives you productive tasks to replace passive screen time. Completing rewire tasks earns points and reduces your Brain Rot Score.';

  @override
  String get helpQ5 => 'Why does the app need Usage Access permission?';

  @override
  String get helpA5 =>
      'Usage Access permission allows Brainova to detect which apps you are using and for how long. Without this permission, the app cannot track your digital habits automatically.';

  @override
  String get helpQ6 => 'How do I improve my score?';

  @override
  String get helpA6 =>
      'Use learning apps, complete Mind Resets, do Rewire tasks, reduce social media and entertainment consumption, and maintain a daily streak.';

  @override
  String get helpQ7 => 'Is my data private?';

  @override
  String get helpA7 =>
      'Yes. Your data is stored securely and only accessible to you. We never share your personal usage data with third parties.';

  @override
  String get helpQ8 => 'How do I delete my data?';

  @override
  String get helpA8 =>
      'You can delete your account from the Profile screen. This will permanently remove your access and associated activity data.';

  @override
  String get helpQ9 =>
      'What is the difference between Brain Rot Meter and Reality Check?';

  @override
  String get helpA9 =>
      'The Brain Rot Meter shows your overall stimulation score based on your activity over the last 24 hours. Reality Check analyzes the balance of your digital habits and provides insights into whether your current usage is healthy or overstimulating.';

  @override
  String get helpT1Q => 'Why is my score not updating?';

  @override
  String get helpT1A =>
      'Make sure Usage Access permission is enabled for Brainova so the app can detect which apps you are using. Also ensure the app is not restricted by battery optimization settings. It may take a short time for new activity data to be logged and reflected in your score.';

  @override
  String get helpT2Q => 'Can I reset my Brain Rot Score manually?';

  @override
  String get helpT2A =>
      'The Brain Rot Score is calculated from your activity over the last 24 hours, so it gradually decreases as older activity expires. Completing Mind Reset activities or Rewire tasks can also help reduce your score during the day.';

  @override
  String get helpT3Q => 'Why am I receiving notifications?';

  @override
  String get helpT3A =>
      'Brainova sends notifications to help you stay aware of your digital habits. You may receive alerts when your Brain Rot Score becomes high or reminders to complete a Mind Reset or Rewire activity.';

  @override
  String get personalInfoTitle => 'Personal Information';

  @override
  String get personalInfoSave => 'Save';

  @override
  String get personalInfoFullName => 'Full Name';

  @override
  String get personalInfoEmailAddress => 'Email Address';

  @override
  String get personalInfoVerified => 'Verified';

  @override
  String get personalInfoNotVerified => 'Not Verified';

  @override
  String get personalInfoPhoneNumber => 'Phone Number';

  @override
  String get personalInfoDateOfBirth => 'Date of Birth';

  @override
  String get personalInfoSelectDate => 'Select Date';

  @override
  String get personalInfoGender => 'Gender';

  @override
  String get personalInfoMale => 'Male';

  @override
  String get personalInfoFemale => 'Female';

  @override
  String get personalInfoPreferNotToSay => 'Prefer not to say';

  @override
  String get personalInfoCountry => 'Country / Region';

  @override
  String get personalInfoSelect => 'Select';

  @override
  String get personalInfoRequired => 'Required';

  @override
  String get personalInfoSavedSuccess => 'Profile saved successfully';

  @override
  String get personalInfoChangePassword => 'Change Password';

  @override
  String get personalInfoDeleteAccount => 'Delete Account';

  @override
  String get personalInfoCurrentPassword => 'Current Password';

  @override
  String get personalInfoNewPassword => 'New Password';

  @override
  String get personalInfoCancel => 'Cancel';

  @override
  String get personalInfoUpdate => 'Update';

  @override
  String get personalInfoPasswordUpdated => 'Password updated';

  @override
  String get personalInfoDeleteWarning =>
      'This action is irreversible. All your data will be permanently deleted.';

  @override
  String get personalInfoConfirmPassword => 'Confirm Password';

  @override
  String get personalInfoConfirmWithGoogle => 'Confirm with Google';

  @override
  String get personalInfoDelete => 'Delete';

  @override
  String get personalInfoCountryUSA => 'USA';

  @override
  String get personalInfoCountryUK => 'UK';

  @override
  String get personalInfoCountryEgypt => 'Egypt';

  @override
  String get personalInfoCountryUAE => 'UAE';

  @override
  String get personalInfoCountrySaudi => 'Saudi Arabia';

  @override
  String get personalInfoCountryKuwait => 'Kuwait';

  @override
  String get personalInfoCountryJordan => 'Jordan';

  @override
  String get badgeCelebrationNewAchievement => 'New Achievement';

  @override
  String get badgeCelebrationAwesome => 'Awesome!';

  @override
  String get badgeUnitDays => 'days';

  @override
  String get badgeUnitSessions => 'sessions';

  @override
  String get badgeUnitTasks => 'tasks';

  @override
  String get badgeUnitEntries => 'entries';

  @override
  String get badgeUnitLogin => 'logins';

  @override
  String get badgeUnitCompleted => 'completed';

  @override
  String get badgeTitleWelcome => 'New Beginning';

  @override
  String get badgeDescWelcome =>
      'You\'ve taken the first step towards a better life. Welcome to Brainova!';

  @override
  String get badgeTitleStreak3 => 'The Spark';

  @override
  String get badgeDescStreak3 =>
      'A 3-day streak is the spark that ignites the fire of change. Keep going!';

  @override
  String get badgeTitleStreak7 => 'Pure Momentum';

  @override
  String get badgeDescStreak7 =>
      'A full week of success! Your brain is starting to rewire itself.';

  @override
  String get badgeTitleMindReset5 => 'Mind Reset Master';

  @override
  String get badgeDescMindReset5 =>
      'You\'ve completed 5 resets. Your peace of mind is growing!';

  @override
  String get badgeTitleStreak30 => 'Unstoppable';

  @override
  String get badgeDescStreak30 =>
      '30 days of discipline. You are now in control of your own biology.';

  @override
  String get badgeTitleProfileComplete => 'Full Identity';

  @override
  String get badgeDescProfileComplete =>
      'Your profile is 100% complete! You are now fully known.';

  @override
  String get badgeTitleContentDiet10 => 'Diet Discoverer';

  @override
  String get badgeDescContentDiet10 =>
      'You\'ve logged 10 items in your content diet. Awareness is key!';

  @override
  String get authOr => 'Or';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authDontHaveAccount => 'Don\'t have an account?';

  @override
  String get authHaveAccount => 'Have an account?';

  @override
  String get authForgotSuccess => 'Reset link sent to your email!';

  @override
  String get authAccountCreated =>
      'Account created! A verification email has been sent to your inbox.';

  @override
  String get authEmailHint => 'Enter your email';

  @override
  String get introSlogan => 'Turn brain rot into brain growth';

  @override
  String get introGetStarted => 'Get Started';

  @override
  String get introWelcome => 'Welcome to Brainova🧠';

  @override
  String get introDescription =>
      'Brainova helps you break free from the cycle of overstimulation. Rewire your brain, reclaim your focus, and start living with intention.';

  @override
  String get introStartUsing => 'Start Using Brainova';

  @override
  String get permissionTitle => 'Enable Usage Access';

  @override
  String get permissionDescription =>
      'Brainova needs usage access to monitor your digital habits and calculate your Brain Rot Score. This data stays on your device and is never shared.';

  @override
  String get permissionOpenSettings => 'Open Settings';

  @override
  String get commonUser => 'User';

  @override
  String commonError(String error) {
    return 'Error: $error';
  }

  @override
  String get rewireTask1Title => 'Capitals Trivia';

  @override
  String get rewireTask1Content => 'What is the capital of Mongolia?';

  @override
  String get rewireTask1Option1 => 'Ulaanbaatar';

  @override
  String get rewireTask1Option2 => 'Astana';

  @override
  String get rewireTask1Option3 => 'Kathmandu';

  @override
  String get rewireTask1Option4 => 'Thimphu';

  @override
  String get rewireTask2Title => 'Math Riddle';

  @override
  String get rewireTask2Content => 'What is 15% of 80?';

  @override
  String get rewireTask2Option1 => '12';

  @override
  String get rewireTask2Option2 => '10';

  @override
  String get rewireTask2Option3 => '15';

  @override
  String get rewireTask2Option4 => '14';

  @override
  String get rewireTask3Title => 'Gratitude';

  @override
  String get rewireTask3Content =>
      'Name 3 things you are grateful for right now.';

  @override
  String get rewireTask4Title => 'Pattern Logic';

  @override
  String get rewireTask4Content => 'If A=1, B=2, C=3, what is BAD?';

  @override
  String get rewireTask4Option1 => '214';

  @override
  String get rewireTask4Option2 => '216';

  @override
  String get rewireTask4Option3 => '124';

  @override
  String get rewireTask4Option4 => '142';

  @override
  String get rewireTask5Title => 'Quick Math';

  @override
  String get rewireTask5Content => 'What is 7 x 8?';

  @override
  String get rewireTask5Option1 => '54';

  @override
  String get rewireTask5Option2 => '56';

  @override
  String get rewireTask5Option3 => '58';

  @override
  String get rewireTask5Option4 => '62';

  @override
  String get rewireTask6Title => 'Color Quiz';

  @override
  String get rewireTask6Content => 'Which color is associated with \'envy\'?';

  @override
  String get rewireTask6Option1 => 'Red';

  @override
  String get rewireTask6Option2 => 'Green';

  @override
  String get rewireTask6Option3 => 'Blue';

  @override
  String get rewireTask6Option4 => 'Yellow';

  @override
  String get rewireTask7Title => 'Sequence Logic';

  @override
  String get rewireTask7Content => '2, 4, 8, 16, ...?';

  @override
  String get rewireTask7Option1 => '24';

  @override
  String get rewireTask7Option2 => '30';

  @override
  String get rewireTask7Option3 => '32';

  @override
  String get rewireTask7Option4 => '64';

  @override
  String get rewireTask8Title => 'Mindfulness';

  @override
  String get rewireTask8Content => 'Name one thing you can smell right now.';

  @override
  String get rewireTask9Title => 'Geography';

  @override
  String get rewireTask9Content => 'In which continent is the Sahara Desert?';

  @override
  String get rewireTask9Option1 => 'Asia';

  @override
  String get rewireTask9Option2 => 'Africa';

  @override
  String get rewireTask9Option3 => 'South America';

  @override
  String get rewireTask9Option4 => 'Australia';

  @override
  String get rewireTask10Title => 'Binary Code';

  @override
  String get rewireTask10Content => 'What is 1010 in decimal?';

  @override
  String get rewireTask10Option1 => '8';

  @override
  String get rewireTask10Option2 => '10';

  @override
  String get rewireTask10Option3 => '12';

  @override
  String get rewireTask10Option4 => '5';

  @override
  String get rewireTask11Title => 'Word Association';

  @override
  String get rewireTask11Content => 'Antonym of \'Benevolent\'?';

  @override
  String get rewireTask11Option1 => 'Kind';

  @override
  String get rewireTask11Option2 => 'Malevolent';

  @override
  String get rewireTask11Option3 => 'Generous';

  @override
  String get rewireTask11Option4 => 'Happy';

  @override
  String get rewireTask12Title => 'Coding Trivia';

  @override
  String get rewireTask12Content => 'Which language is used for Flutter?';

  @override
  String get rewireTask12Option1 => 'Java';

  @override
  String get rewireTask12Option2 => 'Python';

  @override
  String get rewireTask12Option3 => 'Dart';

  @override
  String get rewireTask12Option4 => 'Swift';

  @override
  String get rewireTask13Title => 'Focus Check';

  @override
  String get rewireTask13Content =>
      'Take a deep breath and type \'I am focused\'.';

  @override
  String get rewireTask14Title => 'Chemistry';

  @override
  String get rewireTask14Content => 'Symbol for Gold?';

  @override
  String get rewireTask14Option1 => 'Ag';

  @override
  String get rewireTask14Option2 => 'Au';

  @override
  String get rewireTask14Option3 => 'Fe';

  @override
  String get rewireTask14Option4 => 'Cu';

  @override
  String get rewireTask15Title => 'Capital';

  @override
  String get rewireTask15Content => 'Capital of Canada?';

  @override
  String get rewireTask15Option1 => 'Toronto';

  @override
  String get rewireTask15Option2 => 'Vancouver';

  @override
  String get rewireTask15Option3 => 'Ottawa';

  @override
  String get rewireTask15Option4 => 'Montreal';

  @override
  String get rewireTask16Title => 'Astronomy';

  @override
  String get rewireTask16Content => 'Which planet is the \'Red Planet\'?';

  @override
  String get rewireTask16Option1 => 'Venus';

  @override
  String get rewireTask16Option2 => 'Mars';

  @override
  String get rewireTask16Option3 => 'Jupiter';

  @override
  String get rewireTask16Option4 => 'Saturn';

  @override
  String get rewireTask17Title => 'Anagram';

  @override
  String get rewireTask17Content => 'Rearrange: EFOLI';

  @override
  String get rewireTask17Option1 => 'Life';

  @override
  String get rewireTask17Option2 => 'File';

  @override
  String get rewireTask17Option3 => 'Foil';

  @override
  String get rewireTask17Option4 => 'Life/File';

  @override
  String get rewireTask17bTitle => 'Anagram';

  @override
  String get rewireTask17bContent => 'Rearrange: T R A E H';

  @override
  String get rewireTask17bOption1 => 'Heart';

  @override
  String get rewireTask17bOption2 => 'Earth';

  @override
  String get rewireTask17bOption3 => 'Hater';

  @override
  String get rewireTask17bOption4 => 'All';

  @override
  String get rewireTask18Title => 'Reflection';

  @override
  String get rewireTask18Content => 'What is your small win for today?';

  @override
  String get rewireTask19Title => 'Physics';

  @override
  String get rewireTask19Content => 'Approximate speed of light?';

  @override
  String get rewireTask19Option1 => '300k km/s';

  @override
  String get rewireTask19Option2 => '150k km/s';

  @override
  String get rewireTask19Option3 => '1M km/s';

  @override
  String get rewireTask19Option4 => 'Sound speed';

  @override
  String get rewireTask20Title => 'History';

  @override
  String get rewireTask20Content => 'Year of the first moon landing?';

  @override
  String get rewireTask20Option1 => '1965';

  @override
  String get rewireTask20Option2 => '1969';

  @override
  String get rewireTask20Option3 => '1972';

  @override
  String get rewireTask20Option4 => '1959';

  @override
  String get rewireTask21Title => 'Anatomy';

  @override
  String get rewireTask21Content => 'Largest organ in the human body?';

  @override
  String get rewireTask21Option1 => 'Brain';

  @override
  String get rewireTask21Option2 => 'Liver';

  @override
  String get rewireTask21Option3 => 'Skin';

  @override
  String get rewireTask21Option4 => 'Heart';

  @override
  String get rewireTask22Title => 'Riddle';

  @override
  String get rewireTask22Content => 'What goes down but never up?';

  @override
  String get rewireTask22Option1 => 'Rain';

  @override
  String get rewireTask22Option2 => 'Steam';

  @override
  String get rewireTask22Option3 => 'Balloon';

  @override
  String get rewireTask22Option4 => 'Smoke';

  @override
  String get adminSearchUsers => 'Search by Email or Name...';

  @override
  String get adminUnknownUser => 'Unknown User';

  @override
  String get adminNoEmail => 'No Email';

  @override
  String get adminUserStreak => 'Streak';

  @override
  String get adminUserActivity => 'Activity';

  @override
  String get adminUserPoints => 'Points';

  @override
  String get adminRestrictUser => 'Restrict User';

  @override
  String get adminUnrestrictUser => 'Remove Restriction';

  @override
  String get adminDeleteUser => 'Delete User Account';

  @override
  String get adminDeleteUserConfirm => 'Delete User?';

  @override
  String get adminDeleteUserWarning =>
      'This will permanently delete the user data from Firestore. This action cannot be undone.';

  @override
  String get adminActiveChallenges => 'Active Challenges';

  @override
  String get adminNewChallenge => 'New Challenge';

  @override
  String get adminCreateChallenge => 'Create Challenge';

  @override
  String get adminEditChallenge => 'Edit Challenge';

  @override
  String get adminChallengeTitle => 'Title';

  @override
  String get adminChallengeDesc => 'Description';

  @override
  String get adminChallengeStartDate => 'Start Date';

  @override
  String get adminChallengeEndDate => 'End Date';

  @override
  String get adminChallengeDuration => 'Duration (Days)';

  @override
  String get adminChallengePoints => 'Points Reward';

  @override
  String get adminChallengeCategory => 'Category';

  @override
  String get adminSave => 'Save';

  @override
  String get adminCancel => 'Cancel';

  @override
  String get adminDelete => 'Delete';

  @override
  String challengePointsLabel(Object count) {
    return '$count Points';
  }

  @override
  String get challengeTitleMorningMeditation => 'Morning Meditation';

  @override
  String get challengeDescMorningMeditation =>
      'Start your day with clarity. 10 mins focus.';

  @override
  String get challengeTitleDigitalSunset => 'Digital Sunset';

  @override
  String get challengeDescDigitalSunset => 'No screens 1 hour before bed.';

  @override
  String get challengeTitleSocialMediaFast => 'Social Media Fast';

  @override
  String get challengeDescSocialMediaFast => '24 hours without scrolling.';

  @override
  String get challengeTitleDeepWork => 'Deep Work Focus';

  @override
  String get challengeDescDeepWork => '2 hours of focused work daily.';

  @override
  String mindResetRotLabel(Object count) {
    return '-$count Rot';
  }

  @override
  String get categoryDopamineFast => 'Dopamine Fast';

  @override
  String get categoryMentalReset => 'Mental Reset';

  @override
  String get categoryPhysical => 'Physical';

  @override
  String get categoryGeneral => 'General';

  @override
  String get adminAnalyticsTitle => 'In-Depth Analytics';

  @override
  String get adminContentDietTitle => 'Content Diet Distribution';

  @override
  String get adminContentDietSubtitle => 'User engagement by category (Today)';

  @override
  String get adminBrainRotDistribution => 'Brain Rot Distribution';

  @override
  String get adminBrainRotWeeklySubtitle => 'Weekly average per day';

  @override
  String get adminMostUsedMindReset => 'Most Used Mind Reset:';

  @override
  String get adminTopActiveChallenge => 'Top Active Challenge:';

  @override
  String get adminAchievementBadges => 'Achievement Badges';

  @override
  String get adminBadgeTitle => 'Badge Title';

  @override
  String get adminBadgeDesc => 'Description';

  @override
  String get adminBadgeIconName => 'Icon Name (e.g., trophy, flame)';

  @override
  String get adminBadgeConditionType => 'Condition Type';

  @override
  String get adminBadgeConditionValue => 'Condition Value';

  @override
  String get adminBadgeUnitLabel => 'Unit Label (e.g., days, sessions)';

  @override
  String get adminSaveChanges => 'Save Changes';

  @override
  String get adminInfoCenter => 'Info Center';

  @override
  String get adminActivityLogs => 'Activity Logs';

  @override
  String get adminBrainRotThresholds => 'Brain Rot Thresholds';

  @override
  String get adminHealthyZone => 'Healthy Zone';

  @override
  String get adminHealthyZoneDesc =>
      'Balanced digital usage. Focus on productivity and real-world interactions.';

  @override
  String get adminCautionZone => 'Caution Zone';

  @override
  String get adminCautionZoneDesc =>
      'Increasing passive consumption. Consider a short Mind Reset.';

  @override
  String get adminDangerZone => 'Danger Zone';

  @override
  String get adminDangerZoneDesc =>
      'High passive consumption detected. Immediate action recommended.';

  @override
  String get adminPointsSystem => 'Points System';

  @override
  String get adminRewireReward => 'Rewire Mode Reward';

  @override
  String get adminRewireRewardSubtitle => 'Complete short exercises.';

  @override
  String get adminMindResetReward => 'Mind Reset Reward';

  @override
  String get adminMindResetRewardSubtitle =>
      'Complete physical or mental rejuvenation tasks.';

  @override
  String get adminChallengeReward => 'Challenge Completion';

  @override
  String get adminChallengeRewardSubtitle =>
      'Finish community challenges for maximum rewards.';

  @override
  String get adminPointsUsageFooter =>
      'Points can be used to unlock exclusive achievements and climb the community rankings.';

  @override
  String get adminSystemFeatures => 'System Features';

  @override
  String get adminBrainRotMeterTitle => 'Brain Rot Meter';

  @override
  String get adminBrainRotMeterDesc =>
      'Tracks daily digital consumption and calculates your real-time Brain Rot Score.';

  @override
  String get adminCommunityChallengesTitle => 'Community Challenges';

  @override
  String get adminCommunityChallengesDesc =>
      'Participate in global events to reduce collective passive screen time.';

  @override
  String get adminSmartNotificationsTitle => 'Smart Notifications';

  @override
  String get adminSmartNotificationsDesc =>
      'Motivational alerts that encourage healthier digital habits and timely resets.';

  @override
  String get adminRealtimeAnalyticsTitle => 'Real-time Analytics';

  @override
  String get adminRealtimeAnalyticsDesc =>
      'Provides a summary of the user’s digital activity based on recorded app usage.';

  @override
  String get adminHowBrainovaWorks => 'How Brainova Works';

  @override
  String get adminStep1 => 'Track daily app usage automatically.';

  @override
  String get adminStep2 =>
      'Calculate Brain Rot Score patterns based on activities.';

  @override
  String get adminStep3 => 'Suggest Mind Reset & Rewire Mode activities.';

  @override
  String get adminStep4 => 'Reward healthy habits with points and badges.';

  @override
  String get adminAppDetails => 'App Details';

  @override
  String get adminAppVersion => 'App Version';

  @override
  String get adminDeveloper => 'Developer';

  @override
  String get adminSystemStatus => 'System Status';

  @override
  String get adminOperational => 'Operational';

  @override
  String get brainovaStartMessage =>
      'This is where the actual Brainova app starts!';

  @override
  String get commonNone => 'None';

  @override
  String get mindResetTypeText => 'Type your thoughts here...';

  @override
  String get adminNewBadge => 'New Badge';

  @override
  String get adminEditBadge => 'Edit Badge';

  @override
  String get adminAvgBrainRot => 'Avg Brain Rot';
}
