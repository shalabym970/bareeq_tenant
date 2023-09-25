import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../helper/cash_helper.dart';
import '../routes/app_routes.dart';
import '../services/check_internet_connection_service.dart';
import '../services/session_services.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<SessionServices>().hasSession()) {
      Get.find<SessionServices>().getSessionUser();
      Get.log(
          "============= user id  : ${CashHelper.getData(key: 'user_id')} ===============");
      Get.log("============= initial route is : dashboard ===============");
      return const RouteSettings(name: Routes.dashboard);
    }
    return null;
  }
}
