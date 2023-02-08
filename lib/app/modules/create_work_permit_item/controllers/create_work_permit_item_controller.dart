import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateWorkPermitItemController extends GetxController {
  final messageFormKey = GlobalKey<FormState>();

  final messageTitleController = TextEditingController();
  final descriptionController = TextEditingController();
  final relatedWorkPermitValue = 'WP--02--23';
  final relatedWorkPermitList = <String>['WP--02--23', 'fj', 'hgh', 'hghg'];
  final itemTypeValue = 'WP--02--23';
  final itemTypeList = <String>['WP--02--23', 'fj', 'hgh', 'hghg'];
}
