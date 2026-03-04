import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { isConnected, isDisconnected, unknown }

final connectivityServiceProvider =
    StateNotifierProvider<ConnectivityService, ConnectivityStatus>((ref) {
  return ConnectivityService();
});

class ConnectivityService extends StateNotifier<ConnectivityStatus> {
  ConnectivityService() : super(ConnectivityStatus.unknown) {
    _init();
  }

  void _init() async {
    final result = await Connectivity().checkConnectivity();
    _updateStatus(result);
    Connectivity().onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      state = ConnectivityStatus.isDisconnected;
    } else {
      state = ConnectivityStatus.isConnected;
    }
  }
}
