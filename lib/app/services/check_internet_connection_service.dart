import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class InternetConnectionController extends GetxController {
  final isConnected = true.obs;

  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetConnectionController({required this.connectivity}) {
   monitorInternetConnection();
  }

   StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectionResult) {
      if (connectionResult == ConnectivityResult.wifi) {
        isConnected.value = true;
      } else if (connectionResult == ConnectivityResult.mobile) {
        isConnected.value = true;
      } else if (connectionResult == ConnectivityResult.none) {
        isConnected.value = false;
      }
    });
  }

  @override
  onClose() {
    connectivityStreamSubscription?.cancel();
  }
}
