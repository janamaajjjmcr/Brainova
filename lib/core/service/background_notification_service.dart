import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/reality_check/domain/reality_check_service.dart';
import '../../features/auth/data/auth_repository.dart';

final backgroundNotificationServiceProvider =
    Provider<BackgroundNotificationService>((ref) {
  return BackgroundNotificationService(ref);
});

class BackgroundNotificationService {
  final Ref _ref;
  Timer? _timer;

  BackgroundNotificationService(this._ref);

  void start() {
    _timer?.cancel();
    // Check every 5 minutes (or whatever interval is appropriate for demo)
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _checkRotation();
    });

    // Initial check
    _checkRotation();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _checkRotation() async {
    final auth = _ref.read(authRepositoryProvider);
    final user = auth.currentUser;
    print('DEBUG: Periodic check triggered. User logged in: ${user != null}');

    if (user == null) {
      return;
    }

    print('DEBUG: Running RealityCheck for user: ${user.uid}');
    final service = _ref.read(realityCheckServiceProvider);
    await service.runRealityCheck(user.uid);
  }
}
