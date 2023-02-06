import 'package:get/get.dart';
import '../controllers/add_contractor_controller.dart';

class AddContractorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddContractorController>(() => AddContractorController());
  }
}

