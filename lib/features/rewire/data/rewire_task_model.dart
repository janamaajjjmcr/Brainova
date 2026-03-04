enum RewireType { trivia, puzzle, prompt }

class RewireTask {
  final String id;
  final String title;
  final RewireType type;
  final String content; // Question or Prompt
  final List<String>? options; // For trivia
  final String? correctAnswer; // For trivia
  final int pointsReward;

  RewireTask({
    required this.id,
    required this.title,
    required this.type,
    required this.content,
    this.options,
    this.correctAnswer,
    this.pointsReward = 5,
  });
}
