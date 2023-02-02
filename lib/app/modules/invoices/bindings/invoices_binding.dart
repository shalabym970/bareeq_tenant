import 'package:get/get.dart';

import '../controllers/invoices_controller.dart';

class InvoicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoicesController>(() => InvoicesController());
  }
}
