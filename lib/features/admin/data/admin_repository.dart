import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository();
});

class AdminRepository {
  AdminRepository();

  Future<bool> isAdmin(String uid) async {
    // Mock admin check: Allow all users as admins for testing or none
    // return uid.contains('admin');
    return true; // Simplified: Everyone is admin locally for now
  }

  Future<Map<String, dynamic>> getSystemMetrics() async {
    // Mock Data for MVP
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      'totalUsers': 142,
      'activeToday': 36,
      'avgBrainRot': 45,
      'mindResetsCompleted': 890,
      'mostPopularActivity': 'Box Breathing',
    };
  }
}
