enum RewireType { trivia, puzzle, prompt }

class RewireTask {
  final String id;
  final String title;
  final RewireType type;
  final String content;
  final List<String>? options;
  final String? correctAnswer;
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
