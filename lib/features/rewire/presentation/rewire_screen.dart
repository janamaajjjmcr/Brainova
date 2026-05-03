import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:brainova/l10n/app_localizations.dart';
import '../../../core/theme/app_theme.dart';
import '../data/rewire_repository.dart';
import '../data/rewire_task_model.dart';
import '../../tracking/domain/brain_rot_service.dart';

class RewireScreen extends ConsumerStatefulWidget {
  const RewireScreen({super.key});

  @override
  ConsumerState<RewireScreen> createState() => _RewireScreenState();
}

class _RewireScreenState extends ConsumerState<RewireScreen> {
  String? _selectedOption;
  bool _isCompleted = false;
  bool _isCorrect = false;

  final _promptController = TextEditingController();
  final List<String> _completedTaskIds = [];
  late Future<RewireTask> _taskFuture;

  @override
  void initState() {
    super.initState();
    _loadNextTask();
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _loadNextTask() {
    setState(() {
      _taskFuture = ref
          .read(rewireRepositoryProvider)
          .getRandomTask(excludeIds: _completedTaskIds);
      _selectedOption = null;
      _isCompleted = false;
      _isCorrect = false;
      _promptController.clear();
    });
  }

  Future<void> _checkAnswer(RewireTask task) async {
    if (task.type == RewireType.trivia || task.type == RewireType.puzzle) {
      final isCorrect = _selectedOption == task.correctAnswer;
      setState(() {
        _isCorrect = isCorrect;
        _isCompleted = true;
      });
      if (isCorrect) {
        await ref.read(brainRotServiceProvider).completeRewire(
              task.title,
              points: task.pointsReward,
            );
        if (mounted) _completedTaskIds.add(task.id);
      }
    } else {
      if (_promptController.text.trim().isEmpty) return;

      setState(() {
        _isCorrect = true;
        _isCompleted = true;
      });
      ref.read(brainRotServiceProvider).completeRewire(
            task.title,
            points: task.pointsReward,
          );
      _completedTaskIds.add(task.id);
    }
  }

  void _nextTask() {
    _loadNextTask();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<RewireTask>(
        future: _taskFuture,
        builder: (context, snapshot) {
          final l10n = AppLocalizations.of(context);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final task = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTaskCard(task),
                const SizedBox(height: 32),
                if (!_isCompleted && task.type == RewireType.prompt) ...[
                  TextField(
                    controller: _promptController,
                    maxLines: 4,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: l10n.rewireTypeAnswer,
                      filled: true,
                      fillColor: AppTheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                if (_isCompleted) ...[
                  _buildResult(task),
                ] else ...[
                  if (task.type != RewireType.prompt && task.options != null)
                    ...List.generate(task.options!.length, (index) {
                      final option = task.options![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() => _selectedOption = option);
                            _checkAnswer(task);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.surface,
                            foregroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                          child: Text(_getLocalizedOption(task.id, index, option, l10n)),
                        ),
                      );
                    }),
                  if (task.type == RewireType.prompt)
                    ElevatedButton(
                      onPressed: () => _checkAnswer(task),
                      child: Text(l10n.rewireSubmitAnswer),
                    ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskCard(RewireTask task) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              LucideIcons.brainCircuit,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _getLocalizedTitle(task.id, l10n),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            _getLocalizedContent(task.id, l10n),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildResult(RewireTask task) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Icon(
          _isCorrect ? LucideIcons.checkCircle : LucideIcons.xCircle,
          size: 64,
          color: _isCorrect ? AppTheme.success : AppTheme.error,
        ),
        const SizedBox(height: 16),
        Text(
          _isCorrect
              ? l10n.rewireCorrect(task.pointsReward)
              : l10n.rewireIncorrect,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 32),
        if (!_isCorrect)
          ElevatedButton(
            onPressed: () {
              setState(() => _isCompleted = false);
            },
            child: Text(l10n.rewireTryAgain),
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () => context.go('/home'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
                child: Text(l10n.rewireExit),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _nextTask,
                child: Text(l10n.rewireNextTask),
              ),
            ],
          ),
      ],
    );
  }
  String _getLocalizedTitle(String id, AppLocalizations l10n) {
    switch (id) {
      case '1': return l10n.rewireTask1Title;
      case '2': return l10n.rewireTask2Title;
      case '3': return l10n.rewireTask3Title;
      case '4': return l10n.rewireTask4Title;
      case '5': return l10n.rewireTask5Title;
      case '6': return l10n.rewireTask6Title;
      case '7': return l10n.rewireTask7Title;
      case '8': return l10n.rewireTask8Title;
      case '9': return l10n.rewireTask9Title;
      case '10': return l10n.rewireTask10Title;
      case '11': return l10n.rewireTask11Title;
      case '12': return l10n.rewireTask12Title;
      case '13': return l10n.rewireTask13Title;
      case '14': return l10n.rewireTask14Title;
      case '15': return l10n.rewireTask15Title;
      case '16': return l10n.rewireTask16Title;
      case '17': return l10n.rewireTask17Title;
      case '17b': return l10n.rewireTask17bTitle;
      case '18': return l10n.rewireTask18Title;
      case '19': return l10n.rewireTask19Title;
      case '20': return l10n.rewireTask20Title;
      case '21': return l10n.rewireTask21Title;
      case '22': return l10n.rewireTask22Title;
      default: return "";
    }
  }

  String _getLocalizedContent(String id, AppLocalizations l10n) {
    switch (id) {
      case '1': return l10n.rewireTask1Content;
      case '2': return l10n.rewireTask2Content;
      case '3': return l10n.rewireTask3Content;
      case '4': return l10n.rewireTask4Content;
      case '5': return l10n.rewireTask5Content;
      case '6': return l10n.rewireTask6Content;
      case '7': return l10n.rewireTask7Content;
      case '8': return l10n.rewireTask8Content;
      case '9': return l10n.rewireTask9Content;
      case '10': return l10n.rewireTask10Content;
      case '11': return l10n.rewireTask11Content;
      case '12': return l10n.rewireTask12Content;
      case '13': return l10n.rewireTask13Content;
      case '14': return l10n.rewireTask14Content;
      case '15': return l10n.rewireTask15Content;
      case '16': return l10n.rewireTask16Content;
      case '17': return l10n.rewireTask17Content;
      case '17b': return l10n.rewireTask17bContent;
      case '18': return l10n.rewireTask18Content;
      case '19': return l10n.rewireTask19Content;
      case '20': return l10n.rewireTask20Content;
      case '21': return l10n.rewireTask21Content;
      case '22': return l10n.rewireTask22Content;
      default: return "";
    }
  }

  String _getLocalizedOption(String id, int index, String original, AppLocalizations l10n) {
    switch (id) {
      case '1':
        if (index == 0) return l10n.rewireTask1Option1;
        if (index == 1) return l10n.rewireTask1Option2;
        if (index == 2) return l10n.rewireTask1Option3;
        if (index == 3) return l10n.rewireTask1Option4;
        break;
      case '2':
        if (index == 0) return l10n.rewireTask2Option1;
        if (index == 1) return l10n.rewireTask2Option2;
        if (index == 2) return l10n.rewireTask2Option3;
        if (index == 3) return l10n.rewireTask2Option4;
        break;
      case '4':
        if (index == 0) return l10n.rewireTask4Option1;
        if (index == 1) return l10n.rewireTask4Option2;
        if (index == 2) return l10n.rewireTask4Option3;
        if (index == 3) return l10n.rewireTask4Option4;
        break;
      case '5':
        if (index == 0) return l10n.rewireTask5Option1;
        if (index == 1) return l10n.rewireTask5Option2;
        if (index == 2) return l10n.rewireTask5Option3;
        if (index == 3) return l10n.rewireTask5Option4;
        break;
      case '6':
        if (index == 0) return l10n.rewireTask6Option1;
        if (index == 1) return l10n.rewireTask6Option2;
        if (index == 2) return l10n.rewireTask6Option3;
        if (index == 3) return l10n.rewireTask6Option4;
        break;
      case '7':
        if (index == 0) return l10n.rewireTask7Option1;
        if (index == 1) return l10n.rewireTask7Option2;
        if (index == 2) return l10n.rewireTask7Option3;
        if (index == 3) return l10n.rewireTask7Option4;
        break;
      case '9':
        if (index == 0) return l10n.rewireTask9Option1;
        if (index == 1) return l10n.rewireTask9Option2;
        if (index == 2) return l10n.rewireTask9Option3;
        if (index == 3) return l10n.rewireTask9Option4;
        break;
      case '10':
        if (index == 0) return l10n.rewireTask10Option1;
        if (index == 1) return l10n.rewireTask10Option2;
        if (index == 2) return l10n.rewireTask10Option3;
        if (index == 3) return l10n.rewireTask10Option4;
        break;
      case '11':
        if (index == 0) return l10n.rewireTask11Option1;
        if (index == 1) return l10n.rewireTask11Option2;
        if (index == 2) return l10n.rewireTask11Option3;
        if (index == 3) return l10n.rewireTask11Option4;
        break;
      case '12':
        if (index == 0) return l10n.rewireTask12Option1;
        if (index == 1) return l10n.rewireTask12Option2;
        if (index == 2) return l10n.rewireTask12Option3;
        if (index == 3) return l10n.rewireTask12Option4;
        break;
      case '14':
        if (index == 0) return l10n.rewireTask14Option1;
        if (index == 1) return l10n.rewireTask14Option2;
        if (index == 2) return l10n.rewireTask14Option3;
        if (index == 3) return l10n.rewireTask14Option4;
        break;
      case '15':
        if (index == 0) return l10n.rewireTask15Option1;
        if (index == 1) return l10n.rewireTask15Option2;
        if (index == 2) return l10n.rewireTask15Option3;
        if (index == 3) return l10n.rewireTask15Option4;
        break;
      case '16':
        if (index == 0) return l10n.rewireTask16Option1;
        if (index == 1) return l10n.rewireTask16Option2;
        if (index == 2) return l10n.rewireTask16Option3;
        if (index == 3) return l10n.rewireTask16Option4;
        break;
      case '17':
        if (index == 0) return l10n.rewireTask17Option1;
        if (index == 1) return l10n.rewireTask17Option2;
        if (index == 2) return l10n.rewireTask17Option3;
        if (index == 3) return l10n.rewireTask17Option4;
        break;
      case '17b':
        if (index == 0) return l10n.rewireTask17bOption1;
        if (index == 1) return l10n.rewireTask17bOption2;
        if (index == 2) return l10n.rewireTask17bOption3;
        if (index == 3) return l10n.rewireTask17bOption4;
        break;
      case '19':
        if (index == 0) return l10n.rewireTask19Option1;
        if (index == 1) return l10n.rewireTask19Option2;
        if (index == 2) return l10n.rewireTask19Option3;
        if (index == 3) return l10n.rewireTask19Option4;
        break;
      case '20':
        if (index == 0) return l10n.rewireTask20Option1;
        if (index == 1) return l10n.rewireTask20Option2;
        if (index == 2) return l10n.rewireTask20Option3;
        if (index == 3) return l10n.rewireTask20Option4;
        break;
      case '21':
        if (index == 0) return l10n.rewireTask21Option1;
        if (index == 1) return l10n.rewireTask21Option2;
        if (index == 2) return l10n.rewireTask21Option3;
        if (index == 3) return l10n.rewireTask21Option4;
        break;
      case '22':
        if (index == 0) return l10n.rewireTask22Option1;
        if (index == 1) return l10n.rewireTask22Option2;
        if (index == 2) return l10n.rewireTask22Option3;
        if (index == 3) return l10n.rewireTask22Option4;
        break;
    }
    return original;
  }
}
