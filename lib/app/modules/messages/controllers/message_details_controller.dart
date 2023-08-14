import 'package:get/get.dart';
import '../../../models/message.dart';

class MessageDetailsController extends GetxController {
  final rout = Get.arguments[0];
  MessageModel message = Get.arguments[1];
}
