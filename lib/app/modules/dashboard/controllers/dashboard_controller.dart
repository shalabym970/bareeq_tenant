import 'package:Seef/app/services/session_services.dart';
import 'package:get/get.dart';

import '../../../models/contact_model.dart';

class DashboardController extends GetxController {
  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }
}
