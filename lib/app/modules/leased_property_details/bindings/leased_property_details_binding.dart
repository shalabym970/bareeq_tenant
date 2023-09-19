import 'package:get/get.dart';
import '../controllers/leased_property_details_controller.dart';

class LeasedPropertyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeasedPropertyDetailsController>(() => LeasedPropertyDetailsController());
  }
}

