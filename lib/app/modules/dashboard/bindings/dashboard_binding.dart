import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '../../../services/check_internet_connection_service.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.put(InternetConnectionController(connectivity: Connectivity()));
  }
}
