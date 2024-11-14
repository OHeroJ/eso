import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class DLNAConnectivity {
  final connectivity = Connectivity();

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  void init(Function(bool available) callback) {
    _connectivitySubscription = connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      final wifi = result
          .where((element) => element == ConnectivityResult.wifi)
          .toList();
      if (wifi.isNotEmpty) {
        callback(true);
      } else {
        callback(false);
      }
    });
  }

  Future<bool> checkConnectivityStatus() async {
    return await (connectivity.checkConnectivity()) == ConnectivityResult.wifi;
  }

  void release() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }
}
