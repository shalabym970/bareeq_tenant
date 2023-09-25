import 'package:get/get.dart';
import '../controllers/acount_recover_controller.dart';

class AccountRecoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountRecoverController>(() => AccountRecoverController());
  }
}
