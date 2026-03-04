class ChallengeUserStatus {
  final bool joined;
  final DateTime? endTime;

  const ChallengeUserStatus({
    required this.joined,
    required this.endTime,
  });

  bool get isActive =>
      joined && endTime != null && endTime!.isAfter(DateTime.now());
  bool get isCompleted =>
      joined && endTime != null && !endTime!.isAfter(DateTime.now());
}
