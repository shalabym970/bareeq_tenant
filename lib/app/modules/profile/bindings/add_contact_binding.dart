import 'package:get/get.dart';
import '../controllers/add_contact_controller.dart';
import '../controllers/profile_controller.dart';

class AddContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddContactController>(() => AddContactController());
  }
}

