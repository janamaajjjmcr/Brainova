// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Brainova';

  @override
  String get navDiet => 'Régime';

  @override
  String get navReset => 'Réinitialiser';

  @override
  String get navHome => 'Accueil';

  @override
  String get navRewire => 'Recâbler';

  @override
  String get navProfile => 'Profil';

  @override
  String get navAdmin => 'Admin';

  @override
  String get adminDashboardTitle => 'Aperçu du Tableau de Bord';

  @override
  String get adminChallengeManagement => 'Gestion des Défis';

  @override
  String get adminUserManagement => 'Gestion des Utilisateurs';

  @override
  String get adminAnalyticsReports => 'Analyses et Rapports';

  @override
  String get adminBadgeManagement => 'Gestion des Badges';

  @override
  String get adminAppSettings => 'Centre d\'Information Brainova';

  @override
  String get adminExit => 'Quitter l\'Admin';

  @override
  String get adminBackToOverview => 'Retour à l\'Aperçu';

  @override
  String get adminSystemHealth => 'Santé du Système';

  @override
  String get adminTotalUsers => 'Total Utilisateurs';

  @override
  String get adminActiveToday => 'Actifs Aujourd\'hui';

  @override
  String get adminAvgBrain_rot => 'Moy. Brain Rot';

  @override
  String get adminResetsDone => 'Réinit. Faites';

  @override
  String get adminManagementActions => 'Actions de Gestion';

  @override
  String get adminHome => 'Accueil';

  @override
  String get adminChallenges => 'Défis';

  @override
  String get adminUsers => 'Utilisateurs';

  @override
  String get adminStats => 'Stats';

  @override
  String get adminBadges => 'Badges';

  @override
  String get adminInfo => 'Infos';

  @override
  String get adminSettings => 'Paramètres';

  @override
  String get homeQuickActions => 'Actions Rapides';

  @override
  String get homeMindReset => 'Réinit. Mentale';

  @override
  String get homeRewireMode => 'Mode Recâblage';

  @override
  String get homeRealityCheck => 'Réalité';

  @override
  String get homeContentDiet => 'Régime de Contenu';

  @override
  String get homeDaysLabel => 'Jours';

  @override
  String get brainRotMeterTitle => 'Compteur de Brain Rot';

  @override
  String get brainRotStatusHealthy => 'Sain';

  @override
  String get brainRotStatusCaution => 'Attention';

  @override
  String get brainRotStatusDanger => 'Danger';

  @override
  String get brainRotCurrentStreak => 'Série Actuelle';

  @override
  String brainRotDays(int count) {
    return '$count jours';
  }

  @override
  String get brainRotMindResets => 'Réinit. Mentales';

  @override
  String challengePeopleJoined(int count) {
    return '$count Personnes ont Rejoint';
  }

  @override
  String get challengeJoin => 'Rejoindre le Défi';

  @override
  String get challengeCompleted => 'Terminé';

  @override
  String get challengeActive => 'Défi Actif';

  @override
  String get challengeLeave => 'Quitter le Défi';

  @override
  String get challengeLeaveTitle => 'Quitter le Défi';

  @override
  String get challengeLeaveBody => 'Êtes-vous sûr de vouloir quitter le défi ?';

  @override
  String get challengeCancel => 'Annuler';

  @override
  String get challengeDone => 'FAIT';

  @override
  String challengeDonePercent(int percent) {
    return '$percent% Fait';
  }

  @override
  String challengeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Jours',
      one: '1 Jour',
    );
    return '$_temp0';
  }

  @override
  String get badgeLocked => 'VERROUILLÉ';

  @override
  String get badgeEarned => 'OBTENU';

  @override
  String homeDaysStreak(int count) {
    return '$count Jours';
  }

  @override
  String get profileYourStatistics => 'Vos Statistiques';

  @override
  String get profileTrackDailyMood => 'Suivez Votre Humeur Quotidienne';

  @override
  String get profileAccount => 'Compte';

  @override
  String get profileMore => 'Plus';

  @override
  String get profilePersonalInformation => 'Informations Personnelles';

  @override
  String get profilePrivacySecurity => 'Confidentialité et Sécurité';

  @override
  String get profileHelpSupport => 'Aide et Support';

  @override
  String get profileSignOut => 'Déconnexion';

  @override
  String get profileLanguage => 'Langue';

  @override
  String get profileCompleteDailyTask => 'Terminer la Tâche Quotidienne';

  @override
  String get profileSelectLanguage => 'Choisir la Langue';

  @override
  String get profileTheme => 'Mode Sombre';

  @override
  String get profileResets => 'Réinit.';

  @override
  String get profileDayStreak => 'Série de Jours';

  @override
  String get profilePointsToday => 'Points Aujourd\'hui';

  @override
  String get profileTasksDone => 'Tâches Faites';

  @override
  String get loginWelcomeBack => 'Bon Retour';

  @override
  String get loginSubtitle => 'Continuez votre voyage vers un esprit plus sain';

  @override
  String get loginEmailHint => 'Exemple@gmail.com';

  @override
  String get loginPasswordHint =>
      'Mot de passe (8+ chars, majuscule, chiffre, symbole)';

  @override
  String get loginForgotPassword => 'Mot de passe oublié ?';

  @override
  String get loginButton => 'Se Connecter';

  @override
  String get loginNoAccount => 'Pas de compte ?';

  @override
  String get loginSignUp => 'S\'Inscrire';

  @override
  String get loginOr => 'OU';

  @override
  String get loginContinueWithGoogle => 'Continuer avec Google';

  @override
  String get signupCreateAccount => 'Créer un Compte';

  @override
  String get signupSubtitle =>
      'Commencez votre voyage de désintoxication numérique aujourd\'hui';

  @override
  String get signupFullName => 'Nom Complet';

  @override
  String get signupEmailHint => 'Exemple@gmail.com';

  @override
  String get signupPasswordHint =>
      'Mot de passe (8+ chars, majuscule, chiffre, symbole)';

  @override
  String get signupConfirmPassword => 'Confirmer le Mot de Passe';

  @override
  String get signupButton => 'S\'Inscrire';

  @override
  String get signupOr => 'OU';

  @override
  String get signupContinueWithGoogle => 'Continuer avec Google';

  @override
  String get signupAlreadyHaveAccount => 'Déjà un compte ?';

  @override
  String get signupLogIn => 'Se Connecter';

  @override
  String get signupPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get signupSuccess =>
      'Compte créé ! Un e-mail de vérification a été envoyé dans votre boîte de réception.';

  @override
  String get realityCheckTitle => 'Réalité';

  @override
  String get realityCheckPleaseLogin => 'Veuillez vous Connecter';

  @override
  String get realityCheckSuggestedAction => 'Action Suggérée';

  @override
  String get realityCheckStartMindReset => 'Lancer une Réinit. Mentale';

  @override
  String get realityCheckTryRewireMode => 'Essayer le Mode Recâblage';

  @override
  String get realityCheckStatusHealthy => 'Sain';

  @override
  String get realityCheckStatusCaution => 'Attention';

  @override
  String get realityCheckStatusDanger => 'Danger';

  @override
  String get realityCheckMessageHealthy =>
      'Votre équilibre numérique semble stable. Continuez ainsi.';

  @override
  String get realityCheckMessageCaution =>
      'Vous penchez vers une stimulation excessive. Envisagez une réinitialisation.';

  @override
  String get realityCheckMessageDanger =>
      'Forte stimulation détectée. Vos habitudes numériques peuvent affecter votre concentration.';

  @override
  String get realityCheckNoActivity =>
      'Aucune activité significative détectée.';

  @override
  String get realityCheckCategorySocial => 'Social';

  @override
  String get realityCheckCategoryJunk => 'Inutile';

  @override
  String get realityCheckCategoryLearning => 'Apprentissage';

  @override
  String get realityCheckCategoryEntertainment => 'Divertissement';

  @override
  String get realityCheckCategoryNeutral => 'Neutre';

  @override
  String get realityCheckSummary => 'Résumé de l\'Activité';

  @override
  String get rewireSubmitAnswer => 'Envoyer la Réponse';

  @override
  String get rewireTypeAnswer => 'Tapez votre réponse ici...';

  @override
  String rewireCorrect(int points) {
    return 'Correct ! -$points Rot';
  }

  @override
  String get rewireIncorrect => 'Incorrect, réessayez !';

  @override
  String get rewireTryAgain => 'Réessayer';

  @override
  String get rewireExit => 'Quitter';

  @override
  String get rewireNextTask => 'Tâche Suivante';

  @override
  String get mindResetBreathing => 'Respiration';

  @override
  String get mindResetAudio => 'Audio';

  @override
  String get mindResetStretch => 'Étirement';

  @override
  String get mindResetJournaling => 'Journal';

  @override
  String get mindResetMeditation => 'Méditation';

  @override
  String mindResetStepOf(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String get mindResetInstructions => 'INSTRUCTIONS';

  @override
  String get mindResetActivityCompleted => 'Activité Terminée !';

  @override
  String get mindResetDone => 'Fait';

  @override
  String get mindResetFocusOnSound => 'Concentrez-vous sur le son...';

  @override
  String get mindResetPressPlay => 'Appuyez sur play pour commencer';

  @override
  String mindResetMin(int count) {
    return '$count min';
  }

  @override
  String get mindResetClearMind =>
      'Videz votre esprit et laissez couler les pensées...';

  @override
  String get mindResetTitle1 => 'Respiration Carrée';

  @override
  String get mindResetDesc1 =>
      'Une technique de respiration puissante utilisée pour calmer rapidement l\'esprit et réinitialiser votre système nerveux.';

  @override
  String get mindResetTitle2 => 'Réinitialisation du Cou et des Épaules';

  @override
  String get mindResetDesc2 =>
      'Relâchez la tension dans votre cou et vos épaules après de longues périodes devant l\'écran.';

  @override
  String get mindResetTitle3 => 'Sons de Pluie';

  @override
  String get mindResetDesc3 =>
      'Laissez le son de la pluie balayer le bruit mental.';

  @override
  String get mindResetTitle4 => 'Entraînement des Yeux';

  @override
  String get mindResetDesc4 =>
      'Rafraîchissez les yeux fatigués et réduisez la fatigue après de longues sessions d\'utilisation d\'écran.';

  @override
  String get mindResetTitle5 => 'Vidage de Cerveau';

  @override
  String get mindResetDesc5 =>
      'Déchargez vos pensées sur papier pour libérer votre esprit et retrouver votre concentration.';

  @override
  String get mindResetTitle6 => 'Désintoxication Numérique';

  @override
  String get mindResetDesc6 =>
      'Posez votre téléphone et reconnectez-vous à la réalité.';

  @override
  String get mindResetStep1_1 => 'Inspirez par le nez pendant 4 secondes.';

  @override
  String get mindResetStep1_2 =>
      'Maintenez votre respiration pendant 4 secondes.';

  @override
  String get mindResetStep1_3 => 'Expirez lentement pendant 4 secondes.';

  @override
  String get mindResetStep1_4 => 'Restez vide pendant 4 secondes. Répétez.';

  @override
  String get mindResetStep2_1 =>
      'Asseyez-vous bien droit, les épaules détendues.';

  @override
  String get mindResetStep2_2 =>
      'Inclinez l\'oreille droite vers l\'épaule droite. Tenez 10s.';

  @override
  String get mindResetStep2_3 =>
      'Faites rouler la tête vers l\'avant sur la poitrine. Tenez 10s.';

  @override
  String get mindResetStep2_4 =>
      'Inclinez l\'oreille gauche vers l\'épaule gauche. Tenez 10s.';

  @override
  String get mindResetStep2_5 =>
      'Faites rouler les deux épaules vers l\'arrière 5 fois.';

  @override
  String get mindResetStep2_6 => 'Étirez les bras au-dessus de votre tête.';

  @override
  String get mindResetStep3_1 => 'Mettez vos écouteurs.';

  @override
  String get mindResetStep3_2 => 'Fermez les yeux ou adoucissez votre regard.';

  @override
  String get mindResetStep3_3 =>
      'Laissez le son remplir complètement votre attention.';

  @override
  String get mindResetStep3_4 =>
      'Chaque fois que votre esprit dérive, revenez au son de la pluie.';

  @override
  String get mindResetStep4_1 =>
      'Regardez en haut et tenez 3s, regardez en bas et tenez 3s. Répétez 3 fois.';

  @override
  String get mindResetStep4_2 =>
      'Regardez à droite et tenez 3s, regardez à gauche et tenez 3s. Répétez 3 fois.';

  @override
  String get mindResetStep4_3 =>
      'Regardez en haut à gauche 3s, en haut à droite 3s. Répétez 3 fois.';

  @override
  String get mindResetStep4_4 =>
      'Faites pivoter les globes oculaires 3 fois vers la droite, puis 3 fois vers la gauche. Clignez des yeux pour vous détendre.';

  @override
  String get mindResetStep4_5 =>
      'Fermez les yeux fort et tenez pendant 10 secondes. Détendez-vous.';

  @override
  String get mindResetStep4_6 =>
      'Ouvrez grand les yeux et tenez 10 secondes. Clignez des yeux plusieurs fois pour finir.';

  @override
  String get mindResetStep5_1 =>
      'Ouvrez une application de notes ou prenez du papier.';

  @override
  String get mindResetStep5_2 => 'Écrivez chaque pensée, inquiétude ou tâche.';

  @override
  String get mindResetStep5_3 =>
      'Ne filtrez pas et ne jugez pas, écrivez simplement.';

  @override
  String get mindResetStep5_4 =>
      'Barrez les choses que vous ne pouvez pas contrôler.';

  @override
  String get mindResetStep5_5 => 'Entourez la seule chose qui compte le plus.';

  @override
  String get mindResetStep6_1 =>
      'Posez votre téléphone et éloignez-vous de l\'écran.';

  @override
  String get mindResetStep6_2 =>
      'Prenez une inspiration lente et profonde et détendez votre corps.';

  @override
  String get mindResetStep6_3 =>
      'Regardez autour de vous et remarquez votre environnement.';

  @override
  String get mindResetStep6_4 =>
      'Concentrez-vous sur le moment présent au lieu de votre appareil.';

  @override
  String get mindResetStep6_5 =>
      'Profitez d\'une courte pause de stimulation numérique.';

  @override
  String get contentDietLogContent => 'Journaliser le Contenu';

  @override
  String get contentDietHowDidYouSpend =>
      'Comment avez-vous passé votre temps ?';

  @override
  String get contentDietRecentLogs => 'Journaux Récents';

  @override
  String get contentDietDuration => 'Durée (minutes)';

  @override
  String get contentDietNotes => 'Notes (optionnel)';

  @override
  String get contentDietSaveEntry => 'Enregistrer l\'Entrée';

  @override
  String get contentDietEntryAdded => 'Entrée Ajoutée !';

  @override
  String get contentDietNoEntries => 'Pas encore d\'entrées.';

  @override
  String get contentDietWeeklySummary => 'Résumé Hebdomadaire';

  @override
  String get contentDietNoData => 'Pas de Données';

  @override
  String get contentDietLearning => 'Apprentiss.';

  @override
  String get contentDietEntertainment => 'Divertiss.';

  @override
  String get contentDietJunk => 'Inutile';

  @override
  String get contentDietSocial => 'Social';

  @override
  String get contentDietLearningFull => 'APPRENTISSAGE';

  @override
  String get contentDietEntertainmentFull => 'DIVERTISSEMENT';

  @override
  String get contentDietJunkFull => 'INUTILE';

  @override
  String get contentDietSocialFull => 'SOCIAL';

  @override
  String get achievementsTitle => 'Succès';

  @override
  String achievementsUnlocked(int count, int total) {
    return '$count / $total Débloqués';
  }

  @override
  String get achievementsNoBadges => 'Pas encore de badges disponibles.';

  @override
  String streakDayStreak(int count) {
    return 'Série de $count Jours';
  }

  @override
  String get streakKeepItUp => 'Continuez comme ça !';

  @override
  String get challengesNone =>
      'Pas encore de défis actifs.\nL\'admin n\'en a pas encore créé.';

  @override
  String get accessRestricted => 'Accès Restreint';

  @override
  String get accessRestrictedBody =>
      'Votre compte a été restreint par l\'administrateur. Veuillez contacter le support si vous pensez qu\'il s\'agit d\'une erreur.';

  @override
  String get logOut => 'Se Déconnecter';

  @override
  String errorGeneric(String message) {
    return 'Erreur : $message';
  }

  @override
  String get privacyTitle => 'Confidentialité et Sécurité';

  @override
  String get privacyDataCollection => 'Collecte de Données';

  @override
  String get privacyDataCollectionContent =>
      'Brainova collecte vos données d\'utilisation d\'applications sur votre appareil pour calculer votre compteur de Brain Rot et les informations de Réalité. Ces données sont stockées en toute sécurité dans votre compte personnel et ne sont jamais partagées avec des tiers.';

  @override
  String get privacyWhatWeTrack => 'Ce que nous suivons';

  @override
  String get privacyWhatWeTrackContent =>
      'Nous suivons les applications que vous utilisez et pendant combien de temps. Cela inclut les applications de divertissement, les réseaux sociaux et les outils de productivité. Nous n\'accédons pas au contenu de vos applications ou messages.';

  @override
  String get privacyDataSecurity => 'Sécurité des Données';

  @override
  String get privacyDataSecurityContent =>
      'Vos données sont stockées en toute sécurité avec Firebase. L\'accès à vos données d\'activité est protégé par authentification et des connexions cryptées pour garder vos informations en sécurité.';

  @override
  String get privacyYourRights => 'Vos Droits';

  @override
  String get privacyYourRightsContent =>
      'Vous avez le droit de supprimer vos données à tout moment. Vous pouvez également révoquer les autorisations d\'utilisation d\'applications depuis les paramètres de votre appareil à tout moment. La suppression de votre compte supprimera définitivement toutes vos données stockées.';

  @override
  String get privacyReliabilitySettings => 'Paramètres de Fiabilité';

  @override
  String get privacyBackgroundAlerts => 'Alertes en Arrière-plan';

  @override
  String get privacyBackgroundAlertsDesc =>
      'Pour recevoir des alertes même quand vous n\'utilisez pas l\'application, veuillez vous assurer que l\'utilisation de la batterie \"Non restreinte\" est activée pour Brainova.';

  @override
  String get privacyEnableReliableAlerts => 'Activer les Alertes Fiables';

  @override
  String get privacyPermissionsUsed => 'Autorisations Utilisées';

  @override
  String get privacyUsageAccess => 'Accès à l\'Utilisation';

  @override
  String get privacyUsageAccessDesc =>
      'Accès à l\'Utilisation — pour suivre les applications que vous utilisez.';

  @override
  String get privacyNotifications => 'Notifications';

  @override
  String get privacyNotificationsDesc =>
      'Notifications — pour vous alerter quand les scores de Brain Rot sont élevés.';

  @override
  String get privacyInternet => 'Internet';

  @override
  String get privacyInternetDesc =>
      'Internet — pour synchroniser vos données en toute sécurité.';

  @override
  String get helpTitle => 'Aide et Support';

  @override
  String get helpFaq => 'Foire Aux Questions';

  @override
  String get helpTroubleshooting => 'Dépannage';

  @override
  String get helpQ1 => 'Qu\'est-ce que le Compteur de Brain Rot ?';

  @override
  String get helpA1 =>
      'Le Compteur de Brain Rot mesure vos habitudes de consommation numérique sur les dernières 24 heures. Un score élevé signifie plus de temps passé sur des activités d\'écran non productives. Le score est basé sur votre activité des dernières 24 heures et se met à jour automatiquement tout au long de la journée.';

  @override
  String get helpQ2 => 'Comment mon score est-il calculé ?';

  @override
  String get helpA2 =>
      'Votre score est basé sur le temps que vous passez sur certaines applications. Les applications de divertissement et de réseaux sociaux augmentent votre score, tandis que les applications d\'apprentissage et de productivité le diminuent. Les Réinitialisations Mentales et les sessions de Recâblage réduisent également votre score.';

  @override
  String get helpQ3 => 'Qu\'est-ce qu\'une Réinitialisation Mentale ?';

  @override
  String get helpA3 =>
      'Une Réinitialisation Mentale est une courte activité qui aide à contrer le brain rot. En terminer une réduit considérablement votre score de Brain Rot.';

  @override
  String get helpQ4 => 'Qu\'est-ce que le Mode Recâblage ?';

  @override
  String get helpA4 =>
      'Le Mode Recâblage vous propose des tâches productives pour remplacer le temps d\'écran passif. Terminer des tâches de recâblage permet de gagner des points et de réduire votre score de Brain Rot.';

  @override
  String get helpQ5 =>
      'Pourquoi l\'application a-t-elle besoin de l\'autorisation d\'Accès à l\'Utilisation ?';

  @override
  String get helpA5 =>
      'L\'autorisation d\'Accès à l\'Utilisation permet à Brainova de détecter quelles applications vous utilisez et pendant combien de temps. Sans cette autorisation, l\'application ne peut pas suivre vos habitudes numériques automatiquement.';

  @override
  String get helpQ6 => 'Comment améliorer mon score ?';

  @override
  String get helpA6 =>
      'Utilisez des applications d\'apprentissage, terminez des Réinitialisations Mentales, faites des tâches de Recâblage, réduisez la consommation de réseaux sociaux et de divertissement, et maintenez une série quotidienne.';

  @override
  String get helpQ7 => 'Mes données sont-elles privées ?';

  @override
  String get helpA7 =>
      'Oui. Vos données sont stockées en toute sécurité et ne sont accessibles qu\'à vous. Nous ne partageons jamais vos données personnelles d\'utilisation avec des tiers.';

  @override
  String get helpQ8 => 'Comment supprimer mes données ?';

  @override
  String get helpA8 =>
      'Vous pouvez supprimer votre compte depuis l\'écran de Profil. Cela supprimera définitivement votre accès et les données d\'activité associées.';

  @override
  String get helpQ9 =>
      'Quelle est la différence entre le Compteur de Brain Rot et la Réalité ?';

  @override
  String get helpA9 =>
      'Le Compteur de Brain Rot montre votre score de stimulation global basé sur votre activité des dernières 24 heures. La Réalité analyse l\'équilibre de vos habitudes numériques et indique si votre utilisation actuelle est saine ou surstimulante.';

  @override
  String get helpT1Q => 'Pourquoi mon score ne se met-il pas à jour ?';

  @override
  String get helpT1A =>
      'Assurez-vous que l\'autorisation d\'Accès à l\'Utilisation est activée pour Brainova afin que l\'application puisse détecter les applications utilisées. Assurez-vous également que l\'application n\'est pas limitée par les paramètres d\'optimisation de la batterie. Un court délai peut être nécessaire pour que les nouvelles données d\'activité soient enregistrées et reflétées dans votre score.';

  @override
  String get helpT2Q =>
      'Puis-je réinitialiser mon score de Brain Rot manuellement ?';

  @override
  String get helpT2A =>
      'Le score de Brain Rot est calculé à partir de votre activité des dernières 24 heures, il diminue donc progressivement à mesure que l\'activité ancienne expire. Terminer des activités de Réinitialisation Mentale ou des tâches de Recâblage peut également aider à réduire votre score pendant la journée.';

  @override
  String get helpT3Q => 'Pourquoi est-ce que je reçois des notifications ?';

  @override
  String get helpT3A =>
      'Brainova envoie des notifications pour vous aider à rester conscient de vos habitudes numériques. Vous pouvez recevoir des alertes quand votre score de Brain Rot devient élevé ou des rappels pour terminer une activité de Réinitialisation Mentale ou de Recâblage.';

  @override
  String get personalInfoTitle => 'Informations Personnelles';

  @override
  String get personalInfoSave => 'Enregistrer';

  @override
  String get personalInfoFullName => 'Nom Complet';

  @override
  String get personalInfoEmailAddress => 'Adresse E-mail';

  @override
  String get personalInfoVerified => 'Vérifié';

  @override
  String get personalInfoNotVerified => 'Non Vérifié';

  @override
  String get personalInfoPhoneNumber => 'Numéro de Téléphone';

  @override
  String get personalInfoDateOfBirth => 'Date de Naissance';

  @override
  String get personalInfoSelectDate => 'Choisir la Date';

  @override
  String get personalInfoGender => 'Genre';

  @override
  String get personalInfoMale => 'Homme';

  @override
  String get personalInfoFemale => 'Femme';

  @override
  String get personalInfoPreferNotToSay => 'Préfère ne pas dire';

  @override
  String get personalInfoCountry => 'Pays / Région';

  @override
  String get personalInfoSelect => 'Choisir';

  @override
  String get personalInfoRequired => 'Requis';

  @override
  String get personalInfoSavedSuccess => 'Profil enregistré avec succès';

  @override
  String get personalInfoChangePassword => 'Changer le Mot de Passe';

  @override
  String get personalInfoDeleteAccount => 'Supprimer le Compte';

  @override
  String get personalInfoCurrentPassword => 'Mot de Passe Actuel';

  @override
  String get personalInfoNewPassword => 'Nouveau Mot de Passe';

  @override
  String get personalInfoCancel => 'Annuler';

  @override
  String get personalInfoUpdate => 'Mettre à jour';

  @override
  String get personalInfoPasswordUpdated => 'Mot de passe mis à jour';

  @override
  String get personalInfoDeleteWarning =>
      'Cette action est irréversible. Toutes vos données seront définitivement supprimées.';

  @override
  String get personalInfoConfirmPassword => 'Confirmer le Mot de Passe';

  @override
  String get personalInfoConfirmWithGoogle => 'Confirmer avec Google';

  @override
  String get personalInfoDelete => 'Supprimer';

  @override
  String get personalInfoCountryUSA => 'États-Unis';

  @override
  String get personalInfoCountryUK => 'Royaume-Uni';

  @override
  String get personalInfoCountryEgypt => 'Égypte';

  @override
  String get personalInfoCountryUAE => 'Émirats Arabes Unis';

  @override
  String get personalInfoCountrySaudi => 'Arabie Saoudite';

  @override
  String get personalInfoCountryKuwait => 'Koweït';

  @override
  String get personalInfoCountryJordan => 'Jordanie';

  @override
  String get badgeCelebrationNewAchievement => 'Nouveau Succès';

  @override
  String get badgeCelebrationAwesome => 'Génial !';

  @override
  String get badgeUnitDays => 'jours';

  @override
  String get badgeUnitSessions => 'sessions';

  @override
  String get badgeUnitTasks => 'tâches';

  @override
  String get badgeUnitEntries => 'entrées';

  @override
  String get badgeUnitLogin => 'connexions';

  @override
  String get badgeUnitCompleted => 'terminé';

  @override
  String get badgeTitleWelcome => 'Nouveau Départ';

  @override
  String get badgeDescWelcome =>
      'Vous avez fait le premier pas vers une vie meilleure. Bienvenue sur Brainova !';

  @override
  String get badgeTitleStreak3 => 'L\'Étincelle';

  @override
  String get badgeDescStreak3 =>
      'Une série de 3 jours est l\'étincelle qui allume le feu du changement. Continuez !';

  @override
  String get badgeTitleStreak7 => 'Plein Élan';

  @override
  String get badgeDescStreak7 =>
      'Une semaine entière de succès ! Votre cerveau commence à se recâbler.';

  @override
  String get badgeTitleMindReset5 => 'Maître de la Réinitialisation';

  @override
  String get badgeDescMindReset5 =>
      'Vous avez terminé 5 réinitialisations. Votre tranquillité d\'esprit grandit !';

  @override
  String get badgeTitleStreak30 => 'Imparable';

  @override
  String get badgeDescStreak30 =>
      '30 jours de discipline. Vous contrôlez maintenant votre propre biologie.';

  @override
  String get badgeTitleProfileComplete => 'Identité Complète';

  @override
  String get badgeDescProfileComplete =>
      'Votre profil est complet à 100 % ! Vous êtes maintenant pleinement connu.';

  @override
  String get badgeTitleContentDiet10 => 'Découvreur de Régime';

  @override
  String get badgeDescContentDiet10 =>
      'Vous avez enregistré 10 éléments dans votre régime de contenu. La conscience est la clé !';

  @override
  String get authOr => 'Ou';

  @override
  String get authContinueWithGoogle => 'Continuer avec Google';

  @override
  String get authDontHaveAccount => 'Pas de compte ?';

  @override
  String get authHaveAccount => 'Déjà un compte ?';

  @override
  String get authForgotSuccess =>
      'Lien de réinitialisation envoyé par e-mail !';

  @override
  String get authAccountCreated =>
      'Compte créé ! Un e-mail de vérification a été envoyé dans votre boîte de réception.';

  @override
  String get authEmailHint => 'Entrez votre e-mail';

  @override
  String get introSlogan => 'Transformez le brain rot en croissance cérébrale';

  @override
  String get introGetStarted => 'Commencer';

  @override
  String get introWelcome => 'Bienvenue sur Brainova🧠';

  @override
  String get introDescription =>
      'Brainova vous aide à vous libérer du cycle de la surstimulation. Recâblez votre cerveau, retrouvez votre concentration et commencez à vivre avec intention.';

  @override
  String get introStartUsing => 'Commencer à utiliser Brainova';

  @override
  String get permissionTitle => 'Activer l\'Accès à l\'Utilisation';

  @override
  String get permissionDescription =>
      'Brainova a besoin de l\'accès à l\'utilisation pour surveiller vos habitudes numériques et calculer votre score de Brain Rot. Ces données restent sur votre appareil et ne sont jamais partagées.';

  @override
  String get permissionOpenSettings => 'Ouvrir les Paramètres';

  @override
  String get commonUser => 'Utilisateur';

  @override
  String commonError(String error) {
    return 'Erreur : $error';
  }

  @override
  String get rewireTask1Title => 'Culture Générale';

  @override
  String get rewireTask1Content => 'Quelle est la capitale de la Mongolie ?';

  @override
  String get rewireTask1Option1 => 'Oulan-Bator';

  @override
  String get rewireTask1Option2 => 'Astana';

  @override
  String get rewireTask1Option3 => 'Katmandou';

  @override
  String get rewireTask1Option4 => 'Thimphou';

  @override
  String get rewireTask2Title => 'Énigme Mathématique';

  @override
  String get rewireTask2Content => 'Combien font 15 % de 80 ?';

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
      'Citez 3 choses pour lesquelles vous êtes reconnaissant en ce moment.';

  @override
  String get rewireTask4Title => 'Logique de Séquence';

  @override
  String get rewireTask4Content => 'Si A=1, B=2, C=3, que vaut BAD ?';

  @override
  String get rewireTask4Option1 => '214';

  @override
  String get rewireTask4Option2 => '216';

  @override
  String get rewireTask4Option3 => '124';

  @override
  String get rewireTask4Option4 => '142';

  @override
  String get rewireTask5Title => 'Calcul Rapide';

  @override
  String get rewireTask5Content => 'Combien font 7 x 8 ?';

  @override
  String get rewireTask5Option1 => '54';

  @override
  String get rewireTask5Option2 => '56';

  @override
  String get rewireTask5Option3 => '58';

  @override
  String get rewireTask5Option4 => '62';

  @override
  String get rewireTask6Title => 'Quiz Couleurs';

  @override
  String get rewireTask6Content => 'Quelle couleur est associée à l\'envie ?';

  @override
  String get rewireTask6Option1 => 'Rouge';

  @override
  String get rewireTask6Option2 => 'Vert';

  @override
  String get rewireTask6Option3 => 'Bleu';

  @override
  String get rewireTask6Option4 => 'Jaune';

  @override
  String get rewireTask7Title => 'Suite Logique';

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
  String get rewireTask8Title => 'Pleine Conscience';

  @override
  String get rewireTask8Content =>
      'Citez une chose que vous pouvez sentir (odeur) en ce moment.';

  @override
  String get rewireTask9Title => 'Géographie';

  @override
  String get rewireTask9Content =>
      'Sur quel continent se trouve le désert du Sahara ?';

  @override
  String get rewireTask9Option1 => 'Asie';

  @override
  String get rewireTask9Option2 => 'Afrique';

  @override
  String get rewireTask9Option3 => 'Amérique du Sud';

  @override
  String get rewireTask9Option4 => 'Australie';

  @override
  String get rewireTask10Title => 'Code Binaire';

  @override
  String get rewireTask10Content => 'Que vaut 1010 en décimal ?';

  @override
  String get rewireTask10Option1 => '8';

  @override
  String get rewireTask10Option2 => '10';

  @override
  String get rewireTask10Option3 => '12';

  @override
  String get rewireTask10Option4 => '5';

  @override
  String get rewireTask11Title => 'Association de Mots';

  @override
  String get rewireTask11Content => 'Antonyme de \'Bienveillant\' ?';

  @override
  String get rewireTask11Option1 => 'Gentil';

  @override
  String get rewireTask11Option2 => 'Malveillant';

  @override
  String get rewireTask11Option3 => 'Généreux';

  @override
  String get rewireTask11Option4 => 'Heureux';

  @override
  String get rewireTask12Title => 'Quiz Code';

  @override
  String get rewireTask12Content => 'Quel langage est utilisé pour Flutter ?';

  @override
  String get rewireTask12Option1 => 'Java';

  @override
  String get rewireTask12Option2 => 'Python';

  @override
  String get rewireTask12Option3 => 'Dart';

  @override
  String get rewireTask12Option4 => 'Swift';

  @override
  String get rewireTask13Title => 'Vérif. Concentration';

  @override
  String get rewireTask13Content =>
      'Prenez une grande respiration et tapez \'Je suis concentré\'.';

  @override
  String get rewireTask14Title => 'Chimie';

  @override
  String get rewireTask14Content => 'Symbole de l\'Or ?';

  @override
  String get rewireTask14Option1 => 'Ag';

  @override
  String get rewireTask14Option2 => 'Au';

  @override
  String get rewireTask14Option3 => 'Fe';

  @override
  String get rewireTask14Option4 => 'Cu';

  @override
  String get rewireTask15Title => 'Capitale';

  @override
  String get rewireTask15Content => 'Capitale du Canada ?';

  @override
  String get rewireTask15Option1 => 'Toronto';

  @override
  String get rewireTask15Option2 => 'Vancouver';

  @override
  String get rewireTask15Option3 => 'Ottawa';

  @override
  String get rewireTask15Option4 => 'Montréal';

  @override
  String get rewireTask16Title => 'Astronomie';

  @override
  String get rewireTask16Content => 'Quelle planète est la \'Planète Rouge\' ?';

  @override
  String get rewireTask16Option1 => 'Vénus';

  @override
  String get rewireTask16Option2 => 'Mars';

  @override
  String get rewireTask16Option3 => 'Jupiter';

  @override
  String get rewireTask16Option4 => 'Saturne';

  @override
  String get rewireTask17Title => 'Anagramme';

  @override
  String get rewireTask17Content => 'Réarrangez : EFOLI';

  @override
  String get rewireTask17Option1 => 'Life';

  @override
  String get rewireTask17Option2 => 'File';

  @override
  String get rewireTask17Option3 => 'Foil';

  @override
  String get rewireTask17Option4 => 'Life/File';

  @override
  String get rewireTask17bTitle => 'Anagramme';

  @override
  String get rewireTask17bContent => 'Réarrangez : T R A E H';

  @override
  String get rewireTask17bOption1 => 'Heart';

  @override
  String get rewireTask17bOption2 => 'Earth';

  @override
  String get rewireTask17bOption3 => 'Hater';

  @override
  String get rewireTask17bOption4 => 'Tout';

  @override
  String get rewireTask18Title => 'Réflexion';

  @override
  String get rewireTask18Content =>
      'Quelle est votre petite victoire du jour ?';

  @override
  String get rewireTask19Title => 'Physique';

  @override
  String get rewireTask19Content => 'Vitesse approximative de la lumière ?';

  @override
  String get rewireTask19Option1 => '300k km/s';

  @override
  String get rewireTask19Option2 => '150k km/s';

  @override
  String get rewireTask19Option3 => '1M km/s';

  @override
  String get rewireTask19Option4 => 'Vitesse du son';

  @override
  String get rewireTask20Title => 'Histoire';

  @override
  String get rewireTask20Content => 'Année du premier pas sur la lune ?';

  @override
  String get rewireTask20Option1 => '1965';

  @override
  String get rewireTask20Option2 => '1969';

  @override
  String get rewireTask20Option3 => '1972';

  @override
  String get rewireTask20Option4 => '1959';

  @override
  String get rewireTask21Title => 'Anatomie';

  @override
  String get rewireTask21Content => 'Le plus grand organe du corps humain ?';

  @override
  String get rewireTask21Option1 => 'Cerveau';

  @override
  String get rewireTask21Option2 => 'Foie';

  @override
  String get rewireTask21Option3 => 'Peau';

  @override
  String get rewireTask21Option4 => 'Cœur';

  @override
  String get rewireTask22Title => 'Énigme';

  @override
  String get rewireTask22Content =>
      'Qu\'est-ce qui descend mais ne remonte jamais ?';

  @override
  String get rewireTask22Option1 => 'La pluie';

  @override
  String get rewireTask22Option2 => 'La vapeur';

  @override
  String get rewireTask22Option3 => 'Un ballon';

  @override
  String get rewireTask22Option4 => 'La fumée';

  @override
  String get adminSearchUsers => 'Chercher par Email ou Nom...';

  @override
  String get adminUnknownUser => 'Utilisateur Inconnu';

  @override
  String get adminNoEmail => 'Pas d\'Email';

  @override
  String get adminUserStreak => 'Série';

  @override
  String get adminUserActivity => 'Activité';

  @override
  String get adminUserPoints => 'Points';

  @override
  String get adminRestrictUser => 'Restreindre l\'Utilisateur';

  @override
  String get adminUnrestrictUser => 'Lever la Restriction';

  @override
  String get adminDeleteUser => 'Supprimer le Compte Utilisateur';

  @override
  String get adminDeleteUserConfirm => 'Supprimer l\'Utilisateur ?';

  @override
  String get adminDeleteUserWarning =>
      'Ceci supprimera définitivement les données utilisateur de Firestore. Cette action est irréversible.';

  @override
  String get adminActiveChallenges => 'Défis Actifs';

  @override
  String get adminNewChallenge => 'Nouveau Défi';

  @override
  String get adminCreateChallenge => 'Créer un Défi';

  @override
  String get adminEditChallenge => 'Modifier le Défi';

  @override
  String get adminChallengeTitle => 'Titre';

  @override
  String get adminChallengeDesc => 'Description';

  @override
  String get adminChallengeStartDate => 'Date de Début';

  @override
  String get adminChallengeEndDate => 'Date de Fin';

  @override
  String get adminChallengeDuration => 'Durée (Jours)';

  @override
  String get adminChallengePoints => 'Récompense en Points';

  @override
  String get adminChallengeCategory => 'Catégorie';

  @override
  String get adminSave => 'Enregistrer';

  @override
  String get adminCancel => 'Annuler';

  @override
  String get adminDelete => 'Supprimer';

  @override
  String challengePointsLabel(Object count) {
    return '$count Points';
  }

  @override
  String get challengeTitleMorningMeditation => 'Méditation Matinale';

  @override
  String get challengeDescMorningMeditation =>
      'Commencez votre journée avec clarté. 10 min de concentration.';

  @override
  String get challengeTitleDigitalSunset => 'Coucher de Soleil Numérique';

  @override
  String get challengeDescDigitalSunset =>
      'Pas d\'écrans 1 heure avant le coucher.';

  @override
  String get challengeTitleSocialMediaFast => 'Jeûne de Réseaux Sociaux';

  @override
  String get challengeDescSocialMediaFast => '24 heures sans défilement.';

  @override
  String get challengeTitleDeepWork => 'Concentration Travail Profond';

  @override
  String get challengeDescDeepWork =>
      '2 heures de travail concentré quotidien.';

  @override
  String mindResetRotLabel(Object count) {
    return '-$count Rot';
  }

  @override
  String get categoryDopamineFast => 'Jeûne de Dopamine';

  @override
  String get categoryMentalReset => 'Réinitialisation Mentale';

  @override
  String get categoryPhysical => 'Physique';

  @override
  String get categoryGeneral => 'Général';

  @override
  String get adminAnalyticsTitle => 'Analyses Approfondies';

  @override
  String get adminContentDietTitle => 'Distribution du Régime de Contenu';

  @override
  String get adminContentDietSubtitle =>
      'Engagement utilisateur par catégorie (Aujourd\'hui)';

  @override
  String get adminBrainRotDistribution => 'Distribution du Brain Rot';

  @override
  String get adminBrainRotWeeklySubtitle => 'Moyenne hebdomadaire par jour';

  @override
  String get adminMostUsedMindReset => 'Réinit. Mentale la Plus Utilisée :';

  @override
  String get adminTopActiveChallenge => 'Défi Actif Principal :';

  @override
  String get adminAchievementBadges => 'Badges de Succès';

  @override
  String get adminBadgeTitle => 'Titre du Badge';

  @override
  String get adminBadgeDesc => 'Description';

  @override
  String get adminBadgeIconName => 'Nom de l\'Icône (ex: trophy, flame)';

  @override
  String get adminBadgeConditionType => 'Type de Condition';

  @override
  String get adminBadgeConditionValue => 'Valeur de Condition';

  @override
  String get adminBadgeUnitLabel => 'Label d\'Unité (ex: jours, sessions)';

  @override
  String get adminSaveChanges => 'Enregistrer les Modifications';

  @override
  String get adminInfoCenter => 'Centre d\'Infos';

  @override
  String get adminActivityLogs => 'Journaux d\'Activité';

  @override
  String get adminBrainRotThresholds => 'Seuils de Brain Rot';

  @override
  String get adminHealthyZone => 'Zone Saine';

  @override
  String get adminHealthyZoneDesc =>
      'Utilisation numérique équilibrée. Concentrez-vous sur la productivité et les interactions réelles.';

  @override
  String get adminCautionZone => 'Zone d\'Attention';

  @override
  String get adminCautionZoneDesc =>
      'Consommation passive en augmentation. Envisagez une courte Réinitialisation Mentale.';

  @override
  String get adminDangerZone => 'Zone de Danger';

  @override
  String get adminDangerZoneDesc =>
      'Haute consommation passive détectée. Action immédiate recommandée.';

  @override
  String get adminPointsSystem => 'Système de Points';

  @override
  String get adminRewireReward => 'Récompense Mode Recâblage';

  @override
  String get adminRewireRewardSubtitle => 'Terminez des exercices courts.';

  @override
  String get adminMindResetReward => 'Récompense Réinitialisation Mentale';

  @override
  String get adminMindResetRewardSubtitle =>
      'Terminez des tâches de rajeunissement physique ou mental.';

  @override
  String get adminChallengeReward => 'Complétion de Défi';

  @override
  String get adminChallengeRewardSubtitle =>
      'Terminez les défis communautaires pour des récompenses maximales.';

  @override
  String get adminPointsUsageFooter =>
      'Les points peuvent être utilisés pour débloquer des succès exclusifs et grimper dans les classements de la communauté.';

  @override
  String get adminSystemFeatures => 'Fonctionnalités du Système';

  @override
  String get adminBrainRotMeterTitle => 'Compteur de Brain Rot';

  @override
  String get adminBrainRotMeterDesc =>
      'Suit la consommation numérique quotidienne et calcule votre score de Brain Rot en temps réel.';

  @override
  String get adminCommunityChallengesTitle => 'Défis Communautaires';

  @override
  String get adminCommunityChallengesDesc =>
      'Participez à des événements mondiaux pour réduire le temps d\'écran passif collectif.';

  @override
  String get adminSmartNotificationsTitle => 'Notifications Intelligentes';

  @override
  String get adminSmartNotificationsDesc =>
      'Alertes motivantes qui encouragent des habitudes numériques plus saines et des réinitialisations opportunes.';

  @override
  String get adminRealtimeAnalyticsTitle => 'Analyses en Temps Réel';

  @override
  String get adminRealtimeAnalyticsDesc =>
      'Fournit un résumé de l\'activité numérique de l\'utilisateur basé sur l\'utilisation enregistrée des applications.';

  @override
  String get adminHowBrainovaWorks => 'Comment Fonctionne Brainova';

  @override
  String get adminStep1 =>
      'Suivez automatiquement l\'utilisation quotidienne des applications.';

  @override
  String get adminStep2 =>
      'Calculez les modèles de score de Brain Rot basés sur les activités.';

  @override
  String get adminStep3 =>
      'Suggérez des activités de Réinitialisation Mentale et de Mode Recâblage.';

  @override
  String get adminStep4 =>
      'Récompensez les habitudes saines avec des points et des badges.';

  @override
  String get adminAppDetails => 'Détails de l\'App';

  @override
  String get adminAppVersion => 'Version de l\'App';

  @override
  String get adminDeveloper => 'Développeur';

  @override
  String get adminSystemStatus => 'Statut du Système';

  @override
  String get adminOperational => 'Opérationnel';

  @override
  String get brainovaStartMessage =>
      'C\'est ici que l\'application Brainova commence vraiment !';

  @override
  String get commonNone => 'Aucun';

  @override
  String get mindResetTypeText => 'Tapez vos pensées ici...';

  @override
  String get adminNewBadge => 'Nouveau Badge';

  @override
  String get adminEditBadge => 'Modifier le Badge';

  @override
  String get adminAvgBrainRot => 'Moy Brain Rot';
}
