import 'package:get/get.dart';
import '../controllers/create_work_permit_controller.dart';

class AddWorkPermitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateWorkPermitController>(() => CreateWorkPermitController());
  }
}

