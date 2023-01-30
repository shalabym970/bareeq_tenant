import 'package:get/get.dart';
import '../controllers/lease_details_controller.dart';

class LeaseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaseDetailsController>(() => LeaseDetailsController());
  }
}

