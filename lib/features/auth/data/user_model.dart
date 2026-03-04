class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? country;
  final List<String> badges;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final int currentBrainRotLevel;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastActiveDate;
  final int points;
  final int contentDietCount;
  final String role; // 'user' or 'admin'

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.country,
    this.badges = const [],
    required this.createdAt,
    required this.lastLoginAt,
    this.currentBrainRotLevel = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastActiveDate,
    this.points = 0,
    this.contentDietCount = 0,
    this.role = 'user',
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      email: data['email'] ?? '',
      displayName: data['displayName'],
      photoUrl: data['photoUrl'],
      phoneNumber: data['phoneNumber'],
      dateOfBirth: data['dateOfBirth'] != null
          ? DateTime.tryParse(data['dateOfBirth'])
          : null,
      gender: data['gender'],
      country: data['country'],
      badges: List<String>.from(data['badges'] ?? []),
      createdAt: data['createdAt'] != null
          ? DateTime.tryParse(data['createdAt']) ?? DateTime.now()
          : DateTime.now(),
      lastLoginAt: data['lastLoginAt'] != null
          ? DateTime.tryParse(data['lastLoginAt']) ?? DateTime.now()
          : DateTime.now(),
      currentBrainRotLevel: data['currentBrainRotLevel'] ?? 0,
      currentStreak: data['currentStreak'] ?? data['streakDays'] ?? 0,
      longestStreak: data['longestStreak'] ?? 0,
      lastActiveDate: data['lastActiveDate'] != null
          ? DateTime.tryParse(data['lastActiveDate'])
          : null,
      points: data['points'] ?? 0,
      contentDietCount: data['contentDietCount'] ?? 0,
      role: data['role'] ?? 'user',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'country': country,
      'badges': badges,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt.toIso8601String(),
      'currentBrainRotLevel': currentBrainRotLevel,
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastActiveDate': lastActiveDate?.toIso8601String(),
      'points': points,
      'contentDietCount': contentDietCount,
      'role': role,
    };
  }

  UserModel copyWith({
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? country,
    List<String>? badges,
    DateTime? lastLoginAt,
    int? currentBrainRotLevel,
    int? currentStreak,
    int? longestStreak,
    DateTime? lastActiveDate,
    int? points,
    int? contentDietCount,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      badges: badges ?? this.badges,
      createdAt: createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      currentBrainRotLevel: currentBrainRotLevel ?? this.currentBrainRotLevel,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      points: points ?? this.points,
      contentDietCount: contentDietCount ?? this.contentDietCount,
      role: role,
    );
  }
}
