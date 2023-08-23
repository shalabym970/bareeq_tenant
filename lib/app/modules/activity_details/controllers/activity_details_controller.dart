import 'package:get/get.dart';


class ActivityDetailsController extends GetxController {

  @override
  onClose() {
    Get.log('========== ActivityDetailsController is closed =========');
    Get.delete<ActivityDetailsController>();
  }

}