import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateMessageController extends GetxController {
  final messageFormKey = GlobalKey<FormState>();

  final messageTitleController = TextEditingController();
  final messageController = TextEditingController();
  final caseValue = 'Case';
  final caseList = <String>['Case', 'fj', 'hgh', 'hghg'];
}
