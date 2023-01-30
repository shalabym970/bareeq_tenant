import 'package:get/get.dart';
import '../controllers/fit_out_process_details_controller.dart';

class FitOutProcessDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FitOutProcessDetailsController>(() => FitOutProcessDetailsController());
  }
}

