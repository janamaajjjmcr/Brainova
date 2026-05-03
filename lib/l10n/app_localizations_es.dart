// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Brainova';

  @override
  String get navDiet => 'Dieta';

  @override
  String get navReset => 'Reset';

  @override
  String get navHome => 'Inicio';

  @override
  String get navRewire => 'Reconectar';

  @override
  String get navProfile => 'Perfil';

  @override
  String get navAdmin => 'Admin';

  @override
  String get adminDashboardTitle => 'Resumen del Tablero';

  @override
  String get adminChallengeManagement => 'Gestión de Retos';

  @override
  String get adminUserManagement => 'Gestión de Usuarios';

  @override
  String get adminAnalyticsReports => 'Analíticas e Informes';

  @override
  String get adminBadgeManagement => 'Gestión de Insignias';

  @override
  String get adminAppSettings => 'Centro de Información de Brainova';

  @override
  String get adminExit => 'Salir de Admin';

  @override
  String get adminBackToOverview => 'Volver al Resumen';

  @override
  String get adminSystemHealth => 'Salud del Sistema';

  @override
  String get adminTotalUsers => 'Total de Usuarios';

  @override
  String get adminActiveToday => 'Activos Hoy';

  @override
  String get adminAvgBrain_rot => 'Deterioro Promedio';

  @override
  String get adminResetsDone => 'Resets Realizados';

  @override
  String get adminManagementActions => 'Acciones de Gestión';

  @override
  String get adminHome => 'Inicio';

  @override
  String get adminChallenges => 'Retos';

  @override
  String get adminUsers => 'Usuarios';

  @override
  String get adminStats => 'Stats';

  @override
  String get adminBadges => 'Insignias';

  @override
  String get adminInfo => 'Info';

  @override
  String get adminSettings => 'Configuración';

  @override
  String get homeQuickActions => 'Acciones Rápidas';

  @override
  String get homeMindReset => 'Reset Mental';

  @override
  String get homeRewireMode => 'Modo Reconectar';

  @override
  String get homeRealityCheck => 'Control Real';

  @override
  String get homeContentDiet => 'Dieta de Contenido';

  @override
  String get homeDaysLabel => 'Días';

  @override
  String get brainRotMeterTitle => 'Medidor de Deterioro';

  @override
  String get brainRotStatusHealthy => 'Saludable';

  @override
  String get brainRotStatusCaution => 'Precaución';

  @override
  String get brainRotStatusDanger => 'Peligro';

  @override
  String get brainRotCurrentStreak => 'Racha Actual';

  @override
  String brainRotDays(int count) {
    return '$count días';
  }

  @override
  String get brainRotMindResets => 'Resets Mentales';

  @override
  String challengePeopleJoined(int count) {
    return '$count personas se han unido';
  }

  @override
  String get challengeJoin => 'Unirse al Reto';

  @override
  String get challengeCompleted => 'Completado';

  @override
  String get challengeActive => 'Reto Activo';

  @override
  String get challengeLeave => 'Abandonar Reto';

  @override
  String get challengeLeaveTitle => 'Abandonar Reto';

  @override
  String get challengeLeaveBody =>
      '¿Estás seguro de que quieres abandonar el reto?';

  @override
  String get challengeCancel => 'Cancelar';

  @override
  String get challengeDone => 'HECHO';

  @override
  String challengeDonePercent(int percent) {
    return '$percent% Hecho';
  }

  @override
  String challengeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Días',
      one: '1 Día',
    );
    return '$_temp0';
  }

  @override
  String get badgeLocked => 'BLOQUEADO';

  @override
  String get badgeEarned => 'OBTENIDO';

  @override
  String homeDaysStreak(int count) {
    return '$count Días';
  }

  @override
  String get profileYourStatistics => 'Tus Estadísticas';

  @override
  String get profileTrackDailyMood => 'Registra tu Estado de Ánimo';

  @override
  String get profileAccount => 'Cuenta';

  @override
  String get profileMore => 'Más';

  @override
  String get profilePersonalInformation => 'Información Personal';

  @override
  String get profilePrivacySecurity => 'Privacidad y Seguridad';

  @override
  String get profileHelpSupport => 'Ayuda y Soporte';

  @override
  String get profileSignOut => 'Cerrar Sesión';

  @override
  String get profileLanguage => 'Idioma';

  @override
  String get profileCompleteDailyTask => 'Completar Tarea Diaria';

  @override
  String get profileSelectLanguage => 'Seleccionar Idioma';

  @override
  String get profileTheme => 'Modo Oscuro';

  @override
  String get profileResets => 'Resets';

  @override
  String get profileDayStreak => 'Racha de Días';

  @override
  String get profilePointsToday => 'Puntos Hoy';

  @override
  String get profileTasksDone => 'Tareas Hechas';

  @override
  String get loginWelcomeBack => 'Bienvenido de Nuevo';

  @override
  String get loginSubtitle => 'Continúa tu camino hacia una mente más sana';

  @override
  String get loginEmailHint => 'Ejemplo@gmail.com';

  @override
  String get loginPasswordHint =>
      'Contraseña (8+ carac., mayúscula, número, símbolo)';

  @override
  String get loginForgotPassword => '¿Olvidaste tu Contraseña?';

  @override
  String get loginButton => 'Iniciar Sesión';

  @override
  String get loginNoAccount => '¿No tienes una cuenta?';

  @override
  String get loginSignUp => 'Registrarse';

  @override
  String get loginOr => 'O';

  @override
  String get loginContinueWithGoogle => 'Continuar con Google';

  @override
  String get signupCreateAccount => 'Crear Cuenta';

  @override
  String get signupSubtitle => 'Comienza tu desintoxicación digital hoy';

  @override
  String get signupFullName => 'Nombre Completo';

  @override
  String get signupEmailHint => 'Ejemplo@gmail.com';

  @override
  String get signupPasswordHint =>
      'Contraseña (8+ carac., mayúscula, número, símbolo)';

  @override
  String get signupConfirmPassword => 'Confirmar Contraseña';

  @override
  String get signupButton => 'Registrarse';

  @override
  String get signupOr => 'O';

  @override
  String get signupContinueWithGoogle => 'Continuar con Google';

  @override
  String get signupAlreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get signupLogIn => 'Iniciar Sesión';

  @override
  String get signupPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get signupSuccess =>
      '¡Cuenta creada! Se ha enviado un correo de verificación a tu bandeja de entrada.';

  @override
  String get realityCheckTitle => 'Control de Realidad';

  @override
  String get realityCheckPleaseLogin => 'Por favor inicia sesión';

  @override
  String get realityCheckSuggestedAction => 'Acción sugerida';

  @override
  String get realityCheckStartMindReset => 'Iniciar Reset Mental';

  @override
  String get realityCheckTryRewireMode => 'Probar Modo Reconectar';

  @override
  String get realityCheckStatusHealthy => 'Saludable';

  @override
  String get realityCheckStatusCaution => 'Precaución';

  @override
  String get realityCheckStatusDanger => 'Peligro';

  @override
  String get realityCheckMessageHealthy =>
      'Tu equilibrio digital parece estable. ¡Sigue así!';

  @override
  String get realityCheckMessageCaution =>
      'Te inclinas hacia una estimulación pesada. Considera un reset.';

  @override
  String get realityCheckMessageDanger =>
      'Se detectó alta estimulación. Tus hábitos digitales pueden estar afectando tu enfoque.';

  @override
  String get realityCheckNoActivity => 'No se detectó actividad significativa.';

  @override
  String get realityCheckCategorySocial => 'Social';

  @override
  String get realityCheckCategoryJunk => 'Junk';

  @override
  String get realityCheckCategoryLearning => 'Aprendizaje';

  @override
  String get realityCheckCategoryEntertainment => 'Entretenimiento';

  @override
  String get realityCheckCategoryNeutral => 'Neutral';

  @override
  String get realityCheckSummary => 'Resumen de Actividad';

  @override
  String get rewireSubmitAnswer => 'Enviar Respuesta';

  @override
  String get rewireTypeAnswer => 'Escribe tu respuesta aquí...';

  @override
  String rewireCorrect(int points) {
    return '¡Correcto! -$points de Deterioro';
  }

  @override
  String get rewireIncorrect => '¡Incorrecto, intenta de nuevo!';

  @override
  String get rewireTryAgain => 'Intentar de Nuevo';

  @override
  String get rewireExit => 'Salir';

  @override
  String get rewireNextTask => 'Siguiente Tarea';

  @override
  String get mindResetBreathing => 'Respiración';

  @override
  String get mindResetAudio => 'Audio';

  @override
  String get mindResetStretch => 'Estiramiento';

  @override
  String get mindResetJournaling => 'Diario';

  @override
  String get mindResetMeditation => 'Meditación';

  @override
  String mindResetStepOf(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get mindResetInstructions => 'INSTRUCCIONES';

  @override
  String get mindResetActivityCompleted => '¡Actividad Completada!';

  @override
  String get mindResetDone => 'Hecho';

  @override
  String get mindResetFocusOnSound => 'Concéntrate en el sonido...';

  @override
  String get mindResetPressPlay => 'Presiona reproducir para comenzar';

  @override
  String mindResetMin(int count) {
    return '$count min';
  }

  @override
  String get mindResetClearMind =>
      'Despeja tu mente y deja que los pensamientos fluyan...';

  @override
  String get mindResetTitle1 => 'Respiración Cuadrada';

  @override
  String get mindResetDesc1 =>
      'Una poderosa técnica de respiración utilizada para calmar rápidamente la mente y resetear tu sistema nervioso.';

  @override
  String get mindResetTitle2 => 'Reset de Cuello y Hombros';

  @override
  String get mindResetDesc2 =>
      'Libera la tensión en tu cuello y hombros después de largos periodos frente a la pantalla.';

  @override
  String get mindResetTitle3 => 'Sonidos de Lluvia';

  @override
  String get mindResetDesc3 =>
      'Deja que el sonido de la lluvia lave el ruido mental.';

  @override
  String get mindResetTitle4 => 'Entrenamiento Ocular';

  @override
  String get mindResetDesc4 =>
      'Refresca los ojos cansados y reduce la fatiga después de largas sesiones de uso de pantalla.';

  @override
  String get mindResetTitle5 => 'Descarga Cerebral';

  @override
  String get mindResetDesc5 =>
      'Descarga tus pensamientos en papel para despejar tu mente y recuperar el enfoque.';

  @override
  String get mindResetTitle6 => 'Desintoxicación Digital';

  @override
  String get mindResetDesc6 =>
      'Deja tu teléfono y reconéctate con la realidad.';

  @override
  String get mindResetStep1_1 => 'Inhala por la nariz durante 4 segundos.';

  @override
  String get mindResetStep1_2 => 'Mantén la respiración durante 4 segundos.';

  @override
  String get mindResetStep1_3 => 'Exhala lentamente durante 4 segundos.';

  @override
  String get mindResetStep1_4 => 'Mantén el vacío durante 4 segundos. Repite.';

  @override
  String get mindResetStep2_1 => 'Siéntate derecho, con los hombros relajados.';

  @override
  String get mindResetStep2_2 =>
      'Lleva la oreja derecha al hombro derecho. Mantén 10s.';

  @override
  String get mindResetStep2_3 =>
      'Gira la cabeza hacia adelante al pecho. Mantén 10s.';

  @override
  String get mindResetStep2_4 =>
      'Lleva la oreja izquierda al hombro izquierdo. Mantén 10s.';

  @override
  String get mindResetStep2_5 => 'Gira ambos hombros hacia atrás 5 veces.';

  @override
  String get mindResetStep2_6 => 'Estira los brazos sobre tu cabeza.';

  @override
  String get mindResetStep3_1 => 'Ponte los auriculares.';

  @override
  String get mindResetStep3_2 => 'Cierra los ojos o suaviza la mirada.';

  @override
  String get mindResetStep3_3 =>
      'Deja que el sonido llene completamente tu atención.';

  @override
  String get mindResetStep3_4 =>
      'Cada vez que tu mente divague, vuelve al sonido de la lluvia.';

  @override
  String get mindResetStep4_1 =>
      'Mira hacia arriba 3s, mira hacia abajo 3s. Repite 3 veces.';

  @override
  String get mindResetStep4_2 =>
      'Mira hacia la derecha 3s, mira hacia la izquierda 3s. Repite 3 veces.';

  @override
  String get mindResetStep4_3 =>
      'Mira hacia arriba a la izquierda 3s, mira hacia arriba a la derecha 3s. Repite 3 veces.';

  @override
  String get mindResetStep4_4 =>
      'Gira los globos oculares 3 veces a la derecha, luego 3 a la izquierda. Parpadea para relajar.';

  @override
  String get mindResetStep4_5 =>
      'Cierra los ojos fuerte y mantén durante 10 segundos. Relaja.';

  @override
  String get mindResetStep4_6 =>
      'Abre bien los ojos y mantén 10 segundos. Parpadea repetidamente para terminar.';

  @override
  String get mindResetStep5_1 => 'Abre una aplicación de notas o toma papel.';

  @override
  String get mindResetStep5_2 =>
      'Escribe cada pensamiento, preocupación o tarea.';

  @override
  String get mindResetStep5_3 => 'No filtres ni juzgues, solo escribe.';

  @override
  String get mindResetStep5_4 => 'Tacha las cosas que no puedes controlar.';

  @override
  String get mindResetStep5_5 =>
      'Rodea con un círculo la única cosa que más importa.';

  @override
  String get mindResetStep6_1 => 'Deja tu teléfono y aléjate de la pantalla.';

  @override
  String get mindResetStep6_2 =>
      'Toma una respiración lenta y profunda y relaja tu cuerpo.';

  @override
  String get mindResetStep6_3 => 'Mira a tu alrededor y nota tu entorno.';

  @override
  String get mindResetStep6_4 =>
      'Concéntrate en el momento presente en lugar de en tu dispositivo.';

  @override
  String get mindResetStep6_5 =>
      'Disfruta de un breve descanso de la estimulación digital.';

  @override
  String get contentDietLogContent => 'Registrar Contenido';

  @override
  String get contentDietHowDidYouSpend => '¿Cómo pasaste tu tiempo?';

  @override
  String get contentDietRecentLogs => 'Registros Recientes';

  @override
  String get contentDietDuration => 'Duración (minutos)';

  @override
  String get contentDietNotes => 'Notas (opcional)';

  @override
  String get contentDietSaveEntry => 'Guardar Entrada';

  @override
  String get contentDietEntryAdded => '¡Entrada Añadida!';

  @override
  String get contentDietNoEntries => 'Sin entradas aún.';

  @override
  String get contentDietWeeklySummary => 'Resumen Semanal';

  @override
  String get contentDietNoData => 'Sin Datos';

  @override
  String get contentDietLearning => 'Aprendizaje';

  @override
  String get contentDietEntertainment => 'Entert.';

  @override
  String get contentDietJunk => 'Basura';

  @override
  String get contentDietSocial => 'Social';

  @override
  String get contentDietLearningFull => 'APRENDIZAJE';

  @override
  String get contentDietEntertainmentFull => 'ENTRETENIMIENTO';

  @override
  String get contentDietJunkFull => 'BASURA';

  @override
  String get contentDietSocialFull => 'SOCIAL';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String achievementsUnlocked(int count, int total) {
    return '$count / $total Unlocked';
  }

  @override
  String get achievementsNoBadges => 'Aún no hay insignias disponibles.';

  @override
  String streakDayStreak(int count) {
    return '$count Días de Racha';
  }

  @override
  String get streakKeepItUp => '¡Sigue así!';

  @override
  String get challengesNone =>
      'No hay retos activos aún.\nEl administrador aún no ha creado ninguno.';

  @override
  String get accessRestricted => 'Acceso Restringido';

  @override
  String get accessRestrictedBody =>
      'Tu cuenta ha sido restringida por el administrador. Por favor, contacta con soporte si crees que es un error.';

  @override
  String get logOut => 'Cerrar Sesión';

  @override
  String errorGeneric(String message) {
    return 'Error: $message';
  }

  @override
  String get privacyTitle => 'Privacidad y Seguridad';

  @override
  String get privacyDataCollection => 'Recopilación de Datos';

  @override
  String get privacyDataCollectionContent =>
      'Brainova recopila los datos de uso de la aplicación en tu dispositivo para calcular tu medidor de Deterioro y las perspectivas de Control de Realidad. Estos datos se almacenan de forma segura en tu cuenta personal y nunca se comparten con terceros.';

  @override
  String get privacyWhatWeTrack => 'Qué rastreamos';

  @override
  String get privacyWhatWeTrackContent =>
      'Rastreamos qué aplicaciones usas y por cuánto tiempo. Esto incluye aplicaciones de entretenimiento, redes sociales y herramientas de productividad. No accedemos al contenido de tus aplicaciones o mensajes.';

  @override
  String get privacyDataSecurity => 'Seguridad de Datos';

  @override
  String get privacyDataSecurityContent =>
      'Tus datos se almacenan de forma segura utilizando Firebase. El acceso a los datos de tu actividad está protegido mediante autenticación y conexiones cifradas para mantener tu información segura.';

  @override
  String get privacyYourRights => 'Tus derechos';

  @override
  String get privacyYourRightsContent =>
      'Tienes derecho a eliminar tus datos en cualquier momento. También puedes revocar los permisos de uso de la aplicación desde la configuración de tu dispositivo. Eliminar tu cuenta eliminará permanentemente todos tus datos almacenados.';

  @override
  String get privacyReliabilitySettings => 'Configuración de Fiabilidad';

  @override
  String get privacyBackgroundAlerts => 'Alertas en Segundo Plano';

  @override
  String get privacyBackgroundAlertsDesc =>
      'Para recibir alertas incluso cuando no estás usando la aplicación, asegúrate de que el uso de batería esté configurado como \'Sin restricciones\' para Brainova.';

  @override
  String get privacyEnableReliableAlerts => 'Habilitar Alertas Fiables';

  @override
  String get privacyPermissionsUsed => 'Permisos Utilizados';

  @override
  String get privacyUsageAccess => 'Acceso de Uso';

  @override
  String get privacyUsageAccessDesc =>
      'Acceso de uso: para rastrear qué aplicaciones utilizas.';

  @override
  String get privacyNotifications => 'Notificaciones';

  @override
  String get privacyNotificationsDesc =>
      'Notificaciones: para avisarte cuando los puntajes de Deterioro sean altos.';

  @override
  String get privacyInternet => 'Internet';

  @override
  String get privacyInternetDesc =>
      'Internet: para sincronizar tus datos de forma segura.';

  @override
  String get helpTitle => 'Ayuda y Soporte';

  @override
  String get helpFaq => 'Preguntas Frecuentes';

  @override
  String get helpTroubleshooting => 'Solución de Problemas';

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
  String get helpQ4 => '¿Qué es el Modo Reconectar?';

  @override
  String get helpA4 =>
      'El Modo Reconectar te ofrece tareas productivas para reemplazar el tiempo pasivo frente a la pantalla. Completar tareas de reconexión gana puntos y reduce tu puntaje de Deterioro.';

  @override
  String get helpQ5 =>
      '¿Por qué la aplicación necesita permiso de Acceso de Uso?';

  @override
  String get helpA5 =>
      'El permiso de Acceso de Uso permite a Brainova detectar qué aplicaciones estás usando y por cuánto tiempo. Sin este permiso, la aplicación no puede rastrear tus hábitos digitales automáticamente.';

  @override
  String get helpQ6 => '¿Cómo mejoro mi puntaje?';

  @override
  String get helpA6 =>
      'Usa aplicaciones de aprendizaje, completa Resets Mentales, realiza tareas de Reconexión, reduce el consumo de redes sociales y entretenimiento, y mantén una racha diaria.';

  @override
  String get helpQ7 => '¿Son mis datos privados?';

  @override
  String get helpA7 =>
      'Sí. Tus datos se almacenan de forma segura y solo tú puedes acceder a ellos. Nunca compartimos tus datos de uso personal con terceros.';

  @override
  String get helpQ8 => '¿Cómo elimino mi información?';

  @override
  String get helpA8 =>
      'Puedes eliminar tu cuenta desde la pantalla de Perfil. Esto eliminará permanentemente tu acceso y los datos de actividad asociados.';

  @override
  String get helpQ9 =>
      '¿Cuál es la diferencia entre el Medidor de Deterioro y el Control de Realidad?';

  @override
  String get helpA9 =>
      'El Medidor de Deterioro muestra tu puntaje general de estimulación basado en tu actividad de las últimas 24 horas. El Control de Realidad analiza el equilibrio de tus hábitos digitales y proporciona información sobre si tu uso actual es saludable o sobreestimulante.';

  @override
  String get helpT1Q => '¿Por qué mi puntaje no se actualiza?';

  @override
  String get helpT1A =>
      'Asegúrate de que el permiso de Acceso de Uso esté habilitado para Brainova para que la aplicación pueda detectar qué aplicaciones estás usando. También asegúrate de que la aplicación no esté restringida por la configuración de optimización de batería. Puede tomar un poco de tiempo para que los nuevos datos de actividad se registren y se reflejen en tu puntaje.';

  @override
  String get helpT2Q => '¿Puedo resetear mi Puntaje de Deterioro manualmente?';

  @override
  String get helpT2A =>
      'El Puntaje de Deterioro se calcula a partir de tu actividad en las últimas 24 horas, por lo que disminuye gradualmente a medida que la actividad antigua expira. Completar actividades de Reset Mental o tareas de Reconexión también puede ayudar a reducir tu puntaje durante el día.';

  @override
  String get helpT3Q => '¿Por qué recibo notificaciones?';

  @override
  String get helpT3A =>
      'Brainova envía notificaciones para ayudarte a ser consciente de tus hábitos digitales. Puedes recibir alertas cuando tu Puntaje de Deterioro sea alto o recordatorios para completar un Reset Mental o una actividad de Reconexión.';

  @override
  String get personalInfoTitle => 'Información Personal';

  @override
  String get personalInfoSave => 'Guardar';

  @override
  String get personalInfoFullName => 'Nombre Completo';

  @override
  String get personalInfoEmailAddress => 'Correo Electrónico';

  @override
  String get personalInfoVerified => 'Verificado';

  @override
  String get personalInfoNotVerified => 'No Verificado';

  @override
  String get personalInfoPhoneNumber => 'Número de Teléfono';

  @override
  String get personalInfoDateOfBirth => 'Fecha de Nacimiento';

  @override
  String get personalInfoSelectDate => 'Seleccionar Fecha';

  @override
  String get personalInfoGender => 'Género';

  @override
  String get personalInfoMale => 'Masculino';

  @override
  String get personalInfoFemale => 'Femenino';

  @override
  String get personalInfoPreferNotToSay => 'Prefiero no decirlo';

  @override
  String get personalInfoCountry => 'País / Región';

  @override
  String get personalInfoSelect => 'Seleccionar';

  @override
  String get personalInfoRequired => 'Requerido';

  @override
  String get personalInfoSavedSuccess => 'Perfil guardado exitosamente';

  @override
  String get personalInfoChangePassword => 'Cambiar Contraseña';

  @override
  String get personalInfoDeleteAccount => 'Eliminar Cuenta';

  @override
  String get personalInfoCurrentPassword => 'Contraseña Actual';

  @override
  String get personalInfoNewPassword => 'Nueva Contraseña';

  @override
  String get personalInfoCancel => 'Cancelar';

  @override
  String get personalInfoUpdate => 'Actualizar';

  @override
  String get personalInfoPasswordUpdated => 'Contraseña actualizada';

  @override
  String get personalInfoDeleteWarning =>
      'Esta acción es irreversible. Todos tus datos serán eliminados permanentemente.';

  @override
  String get personalInfoConfirmPassword => 'Confirmar Contraseña';

  @override
  String get personalInfoConfirmWithGoogle => 'Confirmar con Google';

  @override
  String get personalInfoDelete => 'Eliminar';

  @override
  String get personalInfoCountryUSA => 'EE.UU.';

  @override
  String get personalInfoCountryUK => 'Reino Unido';

  @override
  String get personalInfoCountryEgypt => 'Egipto';

  @override
  String get personalInfoCountryUAE => 'UAE';

  @override
  String get personalInfoCountrySaudi => 'Arabia Saudita';

  @override
  String get personalInfoCountryKuwait => 'Kuwait';

  @override
  String get personalInfoCountryJordan => 'Jordania';

  @override
  String get badgeCelebrationNewAchievement => 'Nuevo Logro';

  @override
  String get badgeCelebrationAwesome => '¡Genial!';

  @override
  String get badgeUnitDays => 'días';

  @override
  String get badgeUnitSessions => 'sesiones';

  @override
  String get badgeUnitTasks => 'tareas';

  @override
  String get badgeUnitEntries => 'entradas';

  @override
  String get badgeUnitLogin => 'inicios de sesión';

  @override
  String get badgeUnitCompleted => 'completado';

  @override
  String get badgeTitleWelcome => 'Nuevo Comienzo';

  @override
  String get badgeDescWelcome =>
      'Has dado el primer paso hacia una vida mejor. ¡Bienvenido a Brainova!';

  @override
  String get badgeTitleStreak3 => 'La Chispa';

  @override
  String get badgeDescStreak3 =>
      '¡Una racha de 3 días es la chispa que enciende el fuego del cambio. Sigue así!';

  @override
  String get badgeTitleStreak7 => 'Puro Impulso';

  @override
  String get badgeDescStreak7 =>
      '¡Una semana completa de éxito! Tu cerebro está comenzando a reconectarse.';

  @override
  String get badgeTitleMindReset5 => 'Maestro del Reset';

  @override
  String get badgeDescMindReset5 =>
      'Has completado 5 resets. ¡Tu paz mental está creciendo!';

  @override
  String get badgeTitleStreak30 => 'Imparable';

  @override
  String get badgeDescStreak30 =>
      '30 días de disciplina. Ahora tienes el control de tu propia biología.';

  @override
  String get badgeTitleProfileComplete => 'Identidad Completa';

  @override
  String get badgeDescProfileComplete =>
      '¡Tu perfil está al 100%! Ahora eres plenamente conocido.';

  @override
  String get badgeTitleContentDiet10 => 'Descubridor de Dieta';

  @override
  String get badgeDescContentDiet10 =>
      'Has registrado 10 elementos en tu dieta de contenido. ¡La conciencia es clave!';

  @override
  String get authOr => 'O';

  @override
  String get authContinueWithGoogle => 'Continuar con Google';

  @override
  String get authDontHaveAccount => '¿No tienes una cuenta?';

  @override
  String get authHaveAccount => '¿Tienes una cuenta?';

  @override
  String get authForgotSuccess =>
      '¡Enlace de recuperación enviado a tu correo!';

  @override
  String get authAccountCreated =>
      '¡Cuenta creada! Se ha enviado un correo de verificación a tu bandeja de entrada.';

  @override
  String get authEmailHint => 'Introduce tu correo electrónico';

  @override
  String get introSlogan => 'Convierte el deterioro en crecimiento mental';

  @override
  String get introGetStarted => 'Comenzar';

  @override
  String get introWelcome => 'Bienvenido a Brainova🧠';

  @override
  String get introDescription =>
      'Brainova te ayuda a liberarte del ciclo de sobreestimulación. Reconecta tu cerebro, recupera tu enfoque y comienza a vivir con intención.';

  @override
  String get introStartUsing => 'Empezar a Usar Brainova';

  @override
  String get permissionTitle => 'Habilitar Acceso de Uso';

  @override
  String get permissionDescription =>
      'Brainova needs usage access to monitor your digital habits and calculate your Brain Rot Score. This data stays on your device and is never shared.';

  @override
  String get permissionOpenSettings => 'Abrir Configuración';

  @override
  String get commonUser => 'Usuario';

  @override
  String commonError(String error) {
    return 'Error: $error';
  }

  @override
  String get rewireTask1Title => 'Trivia de Capitales';

  @override
  String get rewireTask1Content => '¿Cuál es la capital de Mongolia?';

  @override
  String get rewireTask1Option1 => 'Ulán Bator';

  @override
  String get rewireTask1Option2 => 'Astaná';

  @override
  String get rewireTask1Option3 => 'Katmandú';

  @override
  String get rewireTask1Option4 => 'Timbu';

  @override
  String get rewireTask2Title => 'Acertijo Matemático';

  @override
  String get rewireTask2Content => '¿Cuánto es el 15% de 80?';

  @override
  String get rewireTask2Option1 => '12';

  @override
  String get rewireTask2Option2 => '10';

  @override
  String get rewireTask2Option3 => '15';

  @override
  String get rewireTask2Option4 => '14';

  @override
  String get rewireTask3Title => 'Gratitud';

  @override
  String get rewireTask3Content =>
      'Nombra 3 cosas por las que estés agradecido ahora mismo.';

  @override
  String get rewireTask4Title => 'Lógica de Patrones';

  @override
  String get rewireTask4Content => 'Si A=1, B=2, C=3, ¿qué es BAD?';

  @override
  String get rewireTask4Option1 => '214';

  @override
  String get rewireTask4Option2 => '216';

  @override
  String get rewireTask4Option3 => '124';

  @override
  String get rewireTask4Option4 => '142';

  @override
  String get rewireTask5Title => 'Matemática Rápida';

  @override
  String get rewireTask5Content => '¿Cuánto es 7 x 8?';

  @override
  String get rewireTask5Option1 => '54';

  @override
  String get rewireTask5Option2 => '56';

  @override
  String get rewireTask5Option3 => '58';

  @override
  String get rewireTask5Option4 => '62';

  @override
  String get rewireTask6Title => 'Quiz de Colores';

  @override
  String get rewireTask6Content => '¿Qué color se asocia con la \'envidia\'?';

  @override
  String get rewireTask6Option1 => 'Rojo';

  @override
  String get rewireTask6Option2 => 'Verde';

  @override
  String get rewireTask6Option3 => 'Azul';

  @override
  String get rewireTask6Option4 => 'Amarillo';

  @override
  String get rewireTask7Title => 'Lógica de Secuencia';

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
  String get rewireTask8Title => 'Atención Plena';

  @override
  String get rewireTask8Content =>
      'Nombra una cosa que puedas oler ahora mismo.';

  @override
  String get rewireTask9Title => 'Geografía';

  @override
  String get rewireTask9Content =>
      '¿En qué continente está el desierto del Sahara?';

  @override
  String get rewireTask9Option1 => 'Asia';

  @override
  String get rewireTask9Option2 => 'África';

  @override
  String get rewireTask9Option3 => 'Sudamérica';

  @override
  String get rewireTask9Option4 => 'Australia';

  @override
  String get rewireTask10Title => 'Código Binario';

  @override
  String get rewireTask10Content => '¿Qué es 1010 en decimal?';

  @override
  String get rewireTask10Option1 => '8';

  @override
  String get rewireTask10Option2 => '10';

  @override
  String get rewireTask10Option3 => '12';

  @override
  String get rewireTask10Option4 => '5';

  @override
  String get rewireTask11Title => 'Asociación de Palabras';

  @override
  String get rewireTask11Content => '¿Antónimo de \'Benevolente\'?';

  @override
  String get rewireTask11Option1 => 'Bondadoso';

  @override
  String get rewireTask11Option2 => 'Malevolente';

  @override
  String get rewireTask11Option3 => 'Generoso';

  @override
  String get rewireTask11Option4 => 'Feliz';

  @override
  String get rewireTask12Title => 'Trivia de Programación';

  @override
  String get rewireTask12Content => '¿Qué lenguaje se usa para Flutter?';

  @override
  String get rewireTask12Option1 => 'Java';

  @override
  String get rewireTask12Option2 => 'Python';

  @override
  String get rewireTask12Option3 => 'Dart';

  @override
  String get rewireTask12Option4 => 'Swift';

  @override
  String get rewireTask13Title => 'Control de Enfoque';

  @override
  String get rewireTask13Content =>
      'Toma una respiración profunda y escribe \'Estoy enfocado\'.';

  @override
  String get rewireTask14Title => 'Química';

  @override
  String get rewireTask14Content => '¿Símbolo del Oro?';

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
  String get rewireTask15Content => '¿Capital de Canadá?';

  @override
  String get rewireTask15Option1 => 'Toronto';

  @override
  String get rewireTask15Option2 => 'Vancouver';

  @override
  String get rewireTask15Option3 => 'Ottawa';

  @override
  String get rewireTask15Option4 => 'Montreal';

  @override
  String get rewireTask16Title => 'Astronomía';

  @override
  String get rewireTask16Content => '¿Qué planeta es el \'Planeta Rojo\'?';

  @override
  String get rewireTask16Option1 => 'Venus';

  @override
  String get rewireTask16Option2 => 'Marte';

  @override
  String get rewireTask16Option3 => 'Júpiter';

  @override
  String get rewireTask16Option4 => 'Saturno';

  @override
  String get rewireTask17Title => 'Anagrama';

  @override
  String get rewireTask17Content => 'Reordena: EFOLI';

  @override
  String get rewireTask17Option1 => 'Vida';

  @override
  String get rewireTask17Option2 => 'Archivo';

  @override
  String get rewireTask17Option3 => 'Foil';

  @override
  String get rewireTask17Option4 => 'Vida/Archivo';

  @override
  String get rewireTask17bTitle => 'Anagrama';

  @override
  String get rewireTask17bContent => 'Reordena: T R A E H';

  @override
  String get rewireTask17bOption1 => 'Corazón';

  @override
  String get rewireTask17bOption2 => 'Tierra';

  @override
  String get rewireTask17bOption3 => 'Hater';

  @override
  String get rewireTask17bOption4 => 'Todos';

  @override
  String get rewireTask18Title => 'Reflexión';

  @override
  String get rewireTask18Content => '¿Cuál es tu pequeña victoria de hoy?';

  @override
  String get rewireTask19Title => 'Física';

  @override
  String get rewireTask19Content => '¿Velocidad aproximada de la luz?';

  @override
  String get rewireTask19Option1 => '300k km/s';

  @override
  String get rewireTask19Option2 => '150k km/s';

  @override
  String get rewireTask19Option3 => '1M km/s';

  @override
  String get rewireTask19Option4 => 'Velocidad del sonido';

  @override
  String get rewireTask20Title => 'Historia';

  @override
  String get rewireTask20Content => '¿Año del primer alunizaje?';

  @override
  String get rewireTask20Option1 => '1965';

  @override
  String get rewireTask20Option2 => '1969';

  @override
  String get rewireTask20Option3 => '1972';

  @override
  String get rewireTask20Option4 => '1959';

  @override
  String get rewireTask21Title => 'Anatomía';

  @override
  String get rewireTask21Content => '¿Órgano más grande del cuerpo humano?';

  @override
  String get rewireTask21Option1 => 'Cerebro';

  @override
  String get rewireTask21Option2 => 'Hígado';

  @override
  String get rewireTask21Option3 => 'Piel';

  @override
  String get rewireTask21Option4 => 'Corazón';

  @override
  String get rewireTask22Title => 'Acertijo';

  @override
  String get rewireTask22Content => '¿Qué baja pero nunca sube?';

  @override
  String get rewireTask22Option1 => 'Lluvia';

  @override
  String get rewireTask22Option2 => 'Vapor';

  @override
  String get rewireTask22Option3 => 'Globo';

  @override
  String get rewireTask22Option4 => 'Humo';

  @override
  String get adminSearchUsers => 'Buscar por Correo o Nombre...';

  @override
  String get adminUnknownUser => 'Usuario Desconocido';

  @override
  String get adminNoEmail => 'Sin Correo';

  @override
  String get adminUserStreak => 'Racha';

  @override
  String get adminUserActivity => 'Actividad';

  @override
  String get adminUserPoints => 'Puntos';

  @override
  String get adminRestrictUser => 'Restringir Usuario';

  @override
  String get adminUnrestrictUser => 'Eliminar Restricción';

  @override
  String get adminDeleteUser => 'Eliminar Cuenta de Usuario';

  @override
  String get adminDeleteUserConfirm => '¿Eliminar Usuario?';

  @override
  String get adminDeleteUserWarning =>
      'Esto eliminará permanentemente los datos del usuario de Firestore. Esta acción no se puede deshacer.';

  @override
  String get adminActiveChallenges => 'Retos Activos';

  @override
  String get adminNewChallenge => 'Nuevo Reto';

  @override
  String get adminCreateChallenge => 'Crear Reto';

  @override
  String get adminEditChallenge => 'Editar Reto';

  @override
  String get adminChallengeTitle => 'Título';

  @override
  String get adminChallengeDesc => 'Descripción';

  @override
  String get adminChallengeStartDate => 'Fecha de Inicio';

  @override
  String get adminChallengeEndDate => 'Fecha de Fin';

  @override
  String get adminChallengeDuration => 'Duración (Días)';

  @override
  String get adminChallengePoints => 'Recompensa en Puntos';

  @override
  String get adminChallengeCategory => 'Categoría';

  @override
  String get adminSave => 'Guardar';

  @override
  String get adminCancel => 'Cancelar';

  @override
  String get adminDelete => 'Eliminar';

  @override
  String challengePointsLabel(Object count) {
    return '$count Puntos';
  }

  @override
  String get challengeTitleMorningMeditation => 'Meditación Matinal';

  @override
  String get challengeDescMorningMeditation =>
      'Comienza tu día con claridad. 10 min de enfoque.';

  @override
  String get challengeTitleDigitalSunset => 'Ocaso Digital';

  @override
  String get challengeDescDigitalSunset =>
      'Sin pantallas 1 hora antes de dormir.';

  @override
  String get challengeTitleSocialMediaFast => 'Ayuno de Redes Sociales';

  @override
  String get challengeDescSocialMediaFast => '24 horas sin deslizar.';

  @override
  String get challengeTitleDeepWork => 'Enfoque de Trabajo Profundo';

  @override
  String get challengeDescDeepWork =>
      '2 horas de trabajo enfocado diariamente.';

  @override
  String mindResetRotLabel(Object count) {
    return '-$count Deterioro';
  }

  @override
  String get categoryDopamineFast => 'Ayuno de Dopamina';

  @override
  String get categoryMentalReset => 'Reset Mental';

  @override
  String get categoryPhysical => 'Físico';

  @override
  String get categoryGeneral => 'General';

  @override
  String get adminAnalyticsTitle => 'Analíticas Detalladas';

  @override
  String get adminContentDietTitle => 'Distribución de Dieta de Contenido';

  @override
  String get adminContentDietSubtitle =>
      'Participación del usuario por categoría (Hoy)';

  @override
  String get adminBrainRotDistribution => 'Distribución de Deterioro';

  @override
  String get adminBrainRotWeeklySubtitle => 'Promedio semanal por día';

  @override
  String get adminMostUsedMindReset => 'Reset Mental Más Usado:';

  @override
  String get adminTopActiveChallenge => 'Reto Activo Principal:';

  @override
  String get adminAchievementBadges => 'Insignias de Logros';

  @override
  String get adminBadgeTitle => 'Título de la Insignia';

  @override
  String get adminBadgeDesc => 'Descripción';

  @override
  String get adminBadgeIconName => 'Nombre del Icono (ej. trophy, flame)';

  @override
  String get adminBadgeConditionType => 'Tipo de Condición';

  @override
  String get adminBadgeConditionValue => 'Valor de la Condición';

  @override
  String get adminBadgeUnitLabel => 'Etiqueta de Unidad (ej. días, sesiones)';

  @override
  String get adminSaveChanges => 'Guardar Cambios';

  @override
  String get adminInfoCenter => 'Centro de Información';

  @override
  String get adminActivityLogs => 'Registros de Actividad';

  @override
  String get adminBrainRotThresholds => 'Umbrales de Deterioro';

  @override
  String get adminHealthyZone => 'Zona Saludable';

  @override
  String get adminHealthyZoneDesc =>
      'Uso digital equilibrado. Enfoque en la productividad e interacciones del mundo real.';

  @override
  String get adminCautionZone => 'Zona de Precaución';

  @override
  String get adminCautionZoneDesc =>
      'Aumento del consumo pasivo. Considera un Reset Mental corto.';

  @override
  String get adminDangerZone => 'Zona de Peligro';

  @override
  String get adminDangerZoneDesc =>
      'Se detectó un alto consumo pasivo. Se recomienda acción inmediata.';

  @override
  String get adminPointsSystem => 'Sistema de Puntos';

  @override
  String get adminRewireReward => 'Recompensa Modo Reconectar';

  @override
  String get adminRewireRewardSubtitle => 'Completa ejercicios cortos.';

  @override
  String get adminMindResetReward => 'Recompensa Reset Mental';

  @override
  String get adminMindResetRewardSubtitle =>
      'Completa tareas de rejuvenecimiento físico o mental.';

  @override
  String get adminChallengeReward => 'Completar Reto';

  @override
  String get adminChallengeRewardSubtitle =>
      'Termina retos de la comunidad para obtener máximas recompensas.';

  @override
  String get adminPointsUsageFooter =>
      'Los puntos se pueden usar para desbloquear logros exclusivos y subir en las clasificaciones de la comunidad.';

  @override
  String get adminSystemFeatures => 'Características del Sistema';

  @override
  String get adminBrainRotMeterTitle => 'Medidor de Deterioro';

  @override
  String get adminBrainRotMeterDesc =>
      'Rastrea el consumo digital diario y calcula tu puntaje de Deterioro en tiempo real.';

  @override
  String get adminCommunityChallengesTitle => 'Retos de la Comunidad';

  @override
  String get adminCommunityChallengesDesc =>
      'Participa en eventos globales para reducir el tiempo colectivo pasivo frente a la pantalla.';

  @override
  String get adminSmartNotificationsTitle => 'Notificaciones Inteligentes';

  @override
  String get adminSmartNotificationsDesc =>
      'Alertas motivacionales que fomentan hábitos digitales más saludables y resets oportunos.';

  @override
  String get adminRealtimeAnalyticsTitle => 'Analíticas en Tiempo Real';

  @override
  String get adminRealtimeAnalyticsDesc =>
      'Proporciona un resumen de la actividad digital del usuario basado en el uso registrado de la aplicación.';

  @override
  String get adminHowBrainovaWorks => 'Cómo funciona Brainova';

  @override
  String get adminStep1 =>
      'Rastrea el uso diario de la aplicación automáticamente.';

  @override
  String get adminStep2 =>
      'Calcula los patrones del puntaje de Deterioro según las actividades.';

  @override
  String get adminStep3 =>
      'Sugiere actividades de Reset Mental y Modo Reconectar.';

  @override
  String get adminStep4 =>
      'Recompensa los hábitos saludables con puntos e insignias.';

  @override
  String get adminAppDetails => 'Detalles de la Aplicación';

  @override
  String get adminAppVersion => 'Versión de la Aplicación';

  @override
  String get adminDeveloper => 'Desarrollador';

  @override
  String get adminSystemStatus => 'Estado del Sistema';

  @override
  String get adminOperational => 'Operativo';

  @override
  String get brainovaStartMessage =>
      '¡Aquí es donde comienza la aplicación Brainova!';

  @override
  String get commonNone => 'Ninguno';

  @override
  String get mindResetTypeText => 'Escribe tus pensamientos aquí...';

  @override
  String get adminNewBadge => 'Nueva Insignia';

  @override
  String get adminEditBadge => 'Editar Insignia';

  @override
  String get adminAvgBrainRot => 'Deterioro Promedio';
}
