import 'package:get/get.dart';

import '../controllers/inquiry_controller.dart';

class InquiryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InquiryController>(() => InquiryController());
  }
}

