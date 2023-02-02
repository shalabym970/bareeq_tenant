import 'package:get/get.dart';
import '../controllers/fit_outs_controller.dart';

class FitOutsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FitOutsController>(() => FitOutsController());
  }
}

