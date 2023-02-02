import 'package:get/get.dart';
import '../controllers/work_permits_controller.dart';

class WorkPermitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkPermitsController>(() => WorkPermitsController());
  }
}

