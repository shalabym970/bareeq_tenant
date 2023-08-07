import 'package:Seef/app/models/work_permit_item.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../models/work_permit.dart';

class WorkPermitDetailsController extends GetxController {
  final loadingWorkPermitItems = false.obs;
  final loadingMessages = false.obs;
  final loadingAttachments = false.obs;
  final errorWorkPermitItems = false.obs;
  final errorMessages = false.obs;
  final errorAttachments = false.obs;
  final workPermitItems = <WorkPermitItem>[].obs;
  final messages = <Message>[].obs;
  WorkPermit workPermit = Get.arguments;

  getMessages() {}

  getWorkPermitItems() {}
}
