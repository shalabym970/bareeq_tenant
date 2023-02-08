import 'package:get/get.dart';
import '../controllers/create_work_permit_item_controller.dart';

class CreateWorkPermitItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateWorkPermitItemController>(() => CreateWorkPermitItemController());
  }
}
