import 'package:get/get.dart';

import '../controllers/leases_controller.dart';

class LeasesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeasesController>(() => LeasesController());
  }
}
