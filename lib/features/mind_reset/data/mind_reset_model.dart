enum MindResetType { breathing, audio, stretch, journaling }

class MindResetActivity {
  final String id;
  final String title;
  final String description;
  final MindResetType type;
  final int durationSeconds;
  final String assetPath; // Could be image or audio path
  final int pointsReward;
  final List<String> steps;

  MindResetActivity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.durationSeconds,
    required this.assetPath,
    this.pointsReward = 15,
    this.steps = const [],
  });
}
