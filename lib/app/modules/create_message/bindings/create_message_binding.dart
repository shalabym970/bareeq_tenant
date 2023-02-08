import 'package:get/get.dart';

import '../controllers/create_message_controller.dart';

class CreateMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateMessageController>(() => CreateMessageController());
  }
}
