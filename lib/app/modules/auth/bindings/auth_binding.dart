import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '../../../services/check_internet_connection_service.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.put(InternetConnectionController(connectivity:  Connectivity()));
  }
}

