import 'package:get/get.dart';
import '../controllers/sold_property_details_controller.dart';

class SoldPropertyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SoldPropertyDetailsController>(() => SoldPropertyDetailsController());
  }
}

