import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mind_reset_model.dart';

final mindResetRepositoryProvider = Provider<MindResetRepository>((ref) {
  return MindResetRepository();
});

class MindResetRepository {
  // Static MVP Data
  final List<MindResetActivity> _activities = [
    MindResetActivity(
      id: '1',
      title: 'Box Breathing',
      description: 'Inhale for 4s, hold for 4s, exhale for 4s, hold for 4s.',
      type: MindResetType.breathing,
      durationSeconds: 180, // 3 mins
      assetPath: 'assets/breathing.png',
      steps: [
        'Inhale through your nose for 4 seconds.',
        'Hold your breath for 4 seconds.',
        'Exhale through your mouth for 4 seconds.',
        'Hold your breath for 4 seconds.',
        'Repeat the cycle.',
      ],
    ),
    MindResetActivity(
      id: '2',
      title: 'Rain Sounds',
      description: 'Listen to the calming sound of rain to clear your mind.',
      type: MindResetType.audio,
      durationSeconds: 300, // 5 mins
      assetPath: 'assets/rain.mp3',
      steps: [
        'Find a comfortable seated or lying position.',
        'Close your eyes and take a deep breath.',
        'Focus gently on the sound of the rain.',
        'Let go of any distracting thoughts.',
      ],
    ),
    MindResetActivity(
      id: '3',
      title: 'Neck Stretch',
      description: 'Simple neck rotations to release tension from scrolling.',
      type: MindResetType.stretch,
      durationSeconds: 120, // 2 mins
      assetPath: 'assets/stretch.png',
      steps: [
        'Sit up straight with your shoulders relaxed.',
        'Slowly tilt your head to the right shoulder.',
        'Hold for 5 seconds.',
        'Slowly tilt to the left shoulder.',
        'Gently rotate your head in a circle.',
      ],
    ),
    MindResetActivity(
      id: '4',
      title: 'Digital Detox',
      description: 'Put your phone down and look out a window.',
      type: MindResetType.breathing,
      durationSeconds: 300,
      assetPath: 'assets/breathing.png',
      steps: [
        'Place your phone face down or away from you.',
        'Look at a distant object (at least 20ft away).',
        'Soften your gaze and blink naturally.',
        'Breathe deeply and simply observe.',
      ],
    ),
    MindResetActivity(
      id: '5',
      title: 'Lo-Fi Beats',
      description: 'Chill beats to study or relax to.',
      type: MindResetType.audio,
      durationSeconds: 600,
      assetPath: 'assets/audio.png',
      steps: [
        'Put on your headphones.',
        'Set the volume to a comfortable level.',
        'Start your work or close your eyes to relax.',
        'Let the rhythm guide your focus.',
      ],
    ),
    MindResetActivity(
      id: '6',
      title: 'Deep Focus',
      description: 'Binaural beats for concentration.',
      type: MindResetType.audio,
      durationSeconds: 900,
      assetPath: 'assets/audio.png',
      steps: [
        'Headphones are required for best effect.',
        'Close your eyes or focus on your task.',
        'Allow the frequencies to sync your brainwaves.',
      ],
    ),
    MindResetActivity(
      id: '7',
      title: 'Eye Rest',
      description: 'Close your eyes and cover them with your palms.',
      type: MindResetType.stretch,
      durationSeconds: 60,
      assetPath: 'assets/stretch.png',
      steps: [
        'Rub your palms together until warm.',
        'Gently cup your palms over your closed eyes.',
        'Do not press on your eyeballs.',
        'Visualize total blackness and relax.',
      ],
    ),
    MindResetActivity(
      id: '8',
      title: 'Wrist Relief',
      description: 'Stretches for carpal tunnel prevention.',
      type: MindResetType.stretch,
      durationSeconds: 120,
      assetPath: 'assets/stretch.png',
      steps: [
        'Extend your arm with palm facing up.',
        'Gently pull your fingers back with the other hand.',
        'Hold for 10 seconds.',
        'Repeat with palm facing down.',
        'Switch hands and repeat.',
      ],
    ),
    MindResetActivity(
      id: '9',
      title: 'Brain Dump',
      description: 'Write down everything on your mind to clear space.',
      type: MindResetType.journaling,
      durationSeconds: 300,
      assetPath: 'assets/journal.png',
      steps: [
        'Grab a piece of paper or open a note app.',
        'Write down every worry, task, or thought.',
        'Do not judge or organize, just write.',
        'Once written, feel the weight lift off your mind.',
      ],
    ),
  ];

  Future<List<MindResetActivity>> getActivities() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _activities;
  }
}
