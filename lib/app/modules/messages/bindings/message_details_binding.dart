import 'package:get/get.dart';
import '../controllers/message_details_controller.dart';
import '../controllers/messages_controller.dart';

class MessageDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageDetailsController>(() => MessageDetailsController());
  }
}
