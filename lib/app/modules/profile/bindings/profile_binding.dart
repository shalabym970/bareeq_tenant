import 'package:get/get.dart';
import '../controllers/add_contact_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AddContactController>(() => AddContactController());
  }
}

