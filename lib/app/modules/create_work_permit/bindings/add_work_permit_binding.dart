import 'package:get/get.dart';
import '../controllers/add_work_permit_controller.dart';

class AddWorkPermitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddWorkPermitController>(() => AddWorkPermitController());
  }
}

