import 'package:get/get.dart';
import '../controllers/work_permit_details_controller.dart';

class WorkPermitDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WorkPermitDetailsController>(WorkPermitDetailsController());
  }
}

