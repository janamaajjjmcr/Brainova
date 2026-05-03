import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/badge_model.dart';

final badgeRepositoryProvider = Provider((ref) => BadgeRepository());

final badgesStreamProvider = StreamProvider<List<BadgeModel>>((ref) {
  return ref.watch(badgeRepositoryProvider).getBadgesStream();
});

class BadgeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  Stream<List<BadgeModel>> getBadgesStream() {
    final userId = _userId;
    if (userId == null) return Stream.value([]);
    return _firestore
        .collection('badges')
        .snapshots()
        .asyncMap((masterSnap) async {
      final userBadgesSnap = await _firestore
          .collection('users')
          .doc(userId)
          .collection('badges')
          .get();

      final userBadgeDataMap = {
        for (var doc in userBadgesSnap.docs) doc.id: doc.data()
      };

      return masterSnap.docs.map((doc) {
        return BadgeModel.fromFirestore(
          doc.data(),
          doc.id,
          userBadgeData: userBadgeDataMap[doc.id],
        );
      }).toList();
    });
  }

  Future<void> unlockBadge(String badgeId) async {
    final userId = _userId;
    if (userId == null) return;

    final userBadgeRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('badges')
        .doc(badgeId);

    final doc = await userBadgeRef.get();
    if (doc.exists && (doc.data()?['isUnlocked'] ?? false)) {
      return;
    }

    await userBadgeRef.set({
      'isUnlocked': true,
      'unlockedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> seedInitialBadges() async {

    final badges = [
      {
        'id': 'welcome',
        'title': 'New Beginning',
        'description':
            'You took the first step towards a better life. Welcome to Brainova!',
        'iconName': 'hand_waving',
        'conditionType': 'firstLogin',
        'conditionValue': 1,
        'unitLabel': 'login',
      },
      {
        'id': 'streak_3',
        'title': 'The Spark',
        'description':
            'A 3-day streak is the spark that starts the fire of change. Keep going!',
        'iconName': 'flame',
        'conditionType': 'streak',
        'conditionValue': 3,
        'unitLabel': 'days',
      },
      {
        'id': 'streak_7',
        'title': 'Pure Momentum',
        'description':
            'One full week of success! Your brain is starting to rewire itself.',
        'iconName': 'trophy',
        'conditionType': 'streak',
        'conditionValue': 7,
        'unitLabel': 'days',
      },
      {
        'id': 'mind_reset_5',
        'title': 'Mind Reset Master',
        'description':
            'Completed 5 mind reset sessions. Your peace of mind is growing!',
        'iconName': 'brain_circuit',
        'conditionType': 'tasksCompleted',
        'conditionValue': 5,
        'unitLabel': 'sessions',
      },
      {
        'id': 'streak_30',
        'title': 'Unstoppable',
        'description':
            '30 days of discipline. You are now in control of your own biology.',
        'iconName': 'medal',
        'conditionType': 'streak',
        'conditionValue': 30,
        'unitLabel': 'days',
      },
      {
        'id': 'profile_complete',
        'title': 'Fully Identity',
        'description':
            'Your profile is fully complete! You are now fully identified.',
        'iconName': 'user_check',
        'conditionType': 'profileComplete',
        'conditionValue': 4,
        'unitLabel': 'completed',
      },
      {
        'id': 'content_diet_10',
        'title': 'Content Diet Explorer',
        'description':
            'Logged 10 items in your content diet. Awareness is key!',
        'iconName': 'smartphone',
        'conditionType': 'dietLog',
        'conditionValue': 10,
        'unitLabel': 'completed',
      },
    ];

    for (var b in badges) {
      await _firestore
          .collection('badges')
          .doc(b['id'] as String)
          .set(b, SetOptions(merge: true));
    }
  }
}
