import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_theme.dart';
import '../data/mind_reset_model.dart';
import '../../tracking/domain/brain_rot_service.dart';

class MindResetPlayerScreen extends ConsumerStatefulWidget {
  final MindResetActivity activity;

  const MindResetPlayerScreen({super.key, required this.activity});

  @override
  ConsumerState<MindResetPlayerScreen> createState() =>
      _MindResetPlayerScreenState();
}

class _MindResetPlayerScreenState extends ConsumerState<MindResetPlayerScreen> {
  late int _remainingSeconds;
  late int _totalSeconds;
  Timer? _timer;
  bool _isPlaying = false;
  bool _isCompleted = false;
  int _selectedDurationMinutes = 5; // Default

  @override
  void initState() {
    super.initState();
    _setDuration(5); // Default to 5 minutes
  }

  void _setDuration(int minutes) {
    if (_isPlaying) return; // Don't change while playing
    setState(() {
      _selectedDurationMinutes = minutes;
      _totalSeconds = minutes * 60;
      _remainingSeconds = _totalSeconds;
    });
  }

  void _toggleTimer() {
    if (_isPlaying) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds > 0) {
          setState(() => _remainingSeconds--);
        } else {
          _completeActivity();
        }
      });
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  Future<void> _completeActivity() async {
    _timer?.cancel();
    setState(() {
      _isPlaying = false;
      _isCompleted = true;
    });

    // Call Logic
    final bonusFactor = _selectedDurationMinutes ~/ 5;
    await ref.read(brainRotServiceProvider).completeMindReset(
          widget.activity.title,
          points: widget.activity.pointsReward * bonusFactor,
          durationSeconds: _totalSeconds,
        );
  }

  String get _timerText {
    final minutes = (_remainingSeconds / 60).floor().toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine gradient based on activity type
    Gradient backgroundGradient;
    switch (widget.activity.type) {
      case MindResetType.breathing:
        backgroundGradient = AppTheme.healingGradient;
        break;
      case MindResetType.audio:
        backgroundGradient = AppTheme.focusGradient;
        break;
      case MindResetType.stretch:
        backgroundGradient = AppTheme.energyGradient;
        break;
      case MindResetType.journaling:
        backgroundGradient = AppTheme.primaryGradient;
        break;
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => context.pop(),
                      ),
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.wind,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.activity.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 48), // Balance spacing
                    ],
                  ),
                ),

                const SizedBox(height: 48), // Top spacing
                // Timer Circle
                if (!_isCompleted) ...[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: CircularProgressIndicator(
                          value: 1 - (_remainingSeconds / _totalSeconds),
                          strokeWidth: 8,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        _timerText,
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              "INSTRUCTIONS",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (widget.activity.steps.isNotEmpty)
                            ...widget.activity.steps.asMap().entries.map((
                              entry,
                            ) {
                              final idx = entry.key + 1;
                              final step = entry.value;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        '$idx',
                                        style: TextStyle(
                                          color: AppTheme.primary,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        step,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                          else
                            Text(
                              widget.activity.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Duration Selector
                  if (!_isPlaying)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _DurationChip(
                          minutes: 5,
                          isSelected: _selectedDurationMinutes == 5,
                          onTap: () => _setDuration(5),
                        ),
                        const SizedBox(width: 16),
                        _DurationChip(
                          minutes: 10,
                          isSelected: _selectedDurationMinutes == 10,
                          onTap: () => _setDuration(10),
                        ),
                        const SizedBox(width: 16),
                        _DurationChip(
                          minutes: 20,
                          isSelected: _selectedDurationMinutes == 20,
                          onTap: () => _setDuration(20),
                        ),
                      ],
                    ),
                  const SizedBox(height: 48),

                  // Controls
                  GestureDetector(
                    onTap: _toggleTimer,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        _isPlaying ? LucideIcons.pause : LucideIcons.play,
                        color: AppTheme.pink,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _isPlaying
                        ? 'Focus on your breath'
                        : 'Select duration and start',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ] else ...[
                  // Completion State
                  const Icon(
                    LucideIcons.checkCircle,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Activity Completed!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "-${widget.activity.pointsReward * (_selectedDurationMinutes ~/ 5)} Rot", // Bonus for longer duration
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.pink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                    ),
                    child: const Text("Done"),
                  ),
                ],
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  final int minutes;
  final bool isSelected;
  final VoidCallback onTap;

  const _DurationChip({
    required this.minutes,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          '$minutes min',
          style: TextStyle(
            color: isSelected ? AppTheme.pink : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
