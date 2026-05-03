import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'rewire_task_model.dart';
import 'dart:math';

final rewireRepositoryProvider = Provider<RewireRepository>((ref) {
  return RewireRepository();
});

class RewireRepository {
  final List<RewireTask> _tasks = [
    RewireTask(
      id: '1',
      title: 'Capital City Trivia',
      type: RewireType.trivia,
      content: 'What is the capital of Mongolia?',
      options: ['Ulaanbaatar', 'Astana', 'Kathmandu', 'Thimphu'],
      correctAnswer: 'Ulaanbaatar',
    ),
    RewireTask(
      id: '2',
      title: 'Math Teaser',
      type: RewireType.trivia,
      content: 'What is 15% of 80?',
      options: ['12', '10', '15', '14'],
      correctAnswer: '12',
    ),
    RewireTask(
      id: '3',
      title: 'Gratitude Prompt',
      type: RewireType.prompt,
      content: 'List 3 things you are grateful for right now.',
    ),
    RewireTask(
      id: '4',
      title: 'Pattern Puzzle',
      type: RewireType.puzzle,
      content: 'If A=1, B=2, C=3, what is BAD?',
      options: ['214', '216', '124', '142'],
      correctAnswer: '214',
    ),
    RewireTask(
      id: '5',
      title: 'Quick Math',
      type: RewireType.trivia,
      content: 'What is 7 x 8?',
      options: ['54', '56', '58', '62'],
      correctAnswer: '56',
    ),
    RewireTask(
      id: '6',
      title: 'Color Stroop',
      type: RewireType.trivia,
      content: 'Which color is associated with "Envy"?',
      options: ['Red', 'Green', 'Blue', 'Yellow'],
      correctAnswer: 'Green',
    ),
    RewireTask(
      id: '7',
      title: 'Sequence Logic',
      type: RewireType.puzzle,
      content: '2, 4, 8, 16, ...?',
      options: ['24', '30', '32', '64'],
      correctAnswer: '32',
    ),
    RewireTask(
      id: '8',
      title: 'Mindfulness',
      type: RewireType.prompt,
      content: 'Name one thing you can smell right now.',
    ),
    RewireTask(
      id: '9',
      title: 'Geography',
      type: RewireType.trivia,
      content: 'Which continent is the Sahara Desert in?',
      options: ['Asia', 'Africa', 'South America', 'Australia'],
      correctAnswer: 'Africa',
    ),
    RewireTask(
      id: '10',
      title: 'Binary Code',
      type: RewireType.trivia,
      content: 'What is 1010 in decimal?',
      options: ['8', '10', '12', '5'],
      correctAnswer: '10',
    ),
    RewireTask(
      id: '11',
      title: 'Word Association',
      type: RewireType.trivia,
      content: 'Opposite of "Benevolent"?',
      options: ['Kind', 'Malevolent', 'Generous', 'Happy'],
      correctAnswer: 'Malevolent',
    ),
    RewireTask(
      id: '12',
      title: 'Coding Trivia',
      type: RewireType.trivia,
      content: 'Which language is used for Flutter?',
      options: ['Java', 'Swift', 'Dart', 'Python'],
      correctAnswer: 'Dart',
    ),
    RewireTask(
      id: '13',
      title: 'Focus Check',
      type: RewireType.prompt,
      content: 'Take a deep breath and type "I am focused".',
    ),
    RewireTask(
      id: '14',
      title: 'Chemistry',
      type: RewireType.trivia,
      content: 'Symbol for Gold?',
      options: ['Ag', 'Au', 'Fe', 'Cu'],
      correctAnswer: 'Au',
    ),
    RewireTask(
      id: '15',
      title: 'Capital City',
      type: RewireType.trivia,
      content: 'Capital of Canada?',
      options: ['Toronto', 'Vancouver', 'Ottawa', 'Montreal'],
      correctAnswer: 'Ottawa',
    ),
    RewireTask(
      id: '16',
      title: 'Astronomy',
      type: RewireType.trivia,
      content: 'Which planet is the "Red Planet"?',
      options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      correctAnswer: 'Mars',
    ),
    RewireTask(
      id: '17',
      title: 'Anagram',
      type: RewireType.puzzle,
      content: 'Unscramble: EFOLI',
      options: ['Life', 'File', 'Foil', 'Life/File'],
      correctAnswer:
          'Life/File',
    ),
    RewireTask(
      id: '17b',
      title: 'Anagram',
      type: RewireType.trivia,
      content: 'Unscramble: T R A E H',
      options: ['Earth', 'Hater', 'Heart', 'All'],
      correctAnswer: 'All',
    ),
    RewireTask(
      id: '18',
      title: 'Reflection',
      type: RewireType.prompt,
      content: 'What is one small goal for today?',
    ),
    RewireTask(
      id: '19',
      title: 'Physics',
      type: RewireType.trivia,
      content: 'Speed of light is approx?',
      options: ['300k km/s', '150k km/s', '1M km/s', 'Sound speed'],
      correctAnswer: '300k km/s',
    ),
    RewireTask(
      id: '20',
      title: 'History',
      type: RewireType.trivia,
      content: 'Year of the first Moon landing?',
      options: ['1965', '1969', '1972', '1959'],
      correctAnswer: '1969',
    ),
    RewireTask(
      id: '21',
      title: 'Anatomy',
      type: RewireType.trivia,
      content: 'Largest organ in the body?',
      options: ['Liver', 'Brain', 'Skin', 'Heart'],
      correctAnswer: 'Skin',
    ),
    RewireTask(
      id: '22',
      title: 'Riddle',
      type: RewireType.trivia,
      content: 'What comes down but never goes up?',
      options: ['Rain', 'Age', 'Balloon', 'Smoke'],
      correctAnswer: 'Rain',
    ),
  ];

  Future<RewireTask> getRandomTask({List<String> excludeIds = const []}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final available = _tasks.where((t) => !excludeIds.contains(t.id)).toList();
    if (available.isEmpty) {
      final random = Random();
      return _tasks[random.nextInt(_tasks.length)];
    }
    final random = Random();
    return available[random.nextInt(available.length)];
  }
}
