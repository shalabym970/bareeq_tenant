import 'package:get/get.dart';
import '../controllers/case_details_controller.dart';

class CaseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaseDetailsController>(() => CaseDetailsController());
  }
}

