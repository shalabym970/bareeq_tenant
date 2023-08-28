import 'package:Bareeq/app/modules/profile/controllers/change_password_controller.dart';
import 'package:get/get.dart';
import '../controllers/add_contact_controller.dart';
import '../controllers/profile_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}
