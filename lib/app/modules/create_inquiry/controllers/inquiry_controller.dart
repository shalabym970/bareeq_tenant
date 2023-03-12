import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../common/strings/strings.dart';

class InquiryController extends GetxController {
  final inquiryFirstFormKey = GlobalKey<FormState>();
  final inquirySecondFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final inquiryToController = TextEditingController();
  final messageController = TextEditingController();
  final leadValue = Strings.chooseLead;
  final leadList = <String>['Choose Lead','fj','hgh','hghg'];
  final contactValue = Strings.chooseContact;
  final contactList = <String>['Choose Contact','fj','hgh','hghg'];
  final projectValue = 'Choose Project';
  final projectList = <String>['Choose Project','fj','hgh','hghg'];
  final unitValue = 'Choose Unit';
  final unitList = <String>['Choose Unit','fj','hgh','hghg'];
}
