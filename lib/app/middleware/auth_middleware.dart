import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/session_services.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<SessionServices>().hasSession()) {
      Get.find<SessionServices>().getSessionUser();
      Get.log("============= initial route is : dashboard ===============");
      return const RouteSettings(name: Routes.dashboard);
    }
    return null;
  }
}
