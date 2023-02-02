import 'package:get/get.dart';
import '../controllers/cases_controller.dart';

class CasesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CasesController>(() => CasesController());
  }
}

