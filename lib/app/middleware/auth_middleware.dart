import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // if (Get.find<SessionServices>().hasSession()) {
    //   Get.find<SessionServices>().getSessionUser();
    //   Get.log("============= initial route is : root ===============");
    //   Get.find<SessionServices>().refreshToken();
    //
    //   return const RouteSettings(name: Routes.root);
    // }
    return null;
  }
}
