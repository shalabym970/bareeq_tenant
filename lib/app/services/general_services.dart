import 'dart:math';

import 'package:get/get_core/src/get_main.dart';

import '../../common/strings/strings.dart';

class GeneralServices {
  static String getKeyFromValue(Map<String, int> map, int targetValue) {
    for (var entry in map.entries) {
      if (entry.value == targetValue) {
        return entry.key;
      }
    }
    return Strings.na; // If the value is not found
  }

  static bool isEmailValid(String email) {
    // Regular expression for a valid email pattern
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  static int generateOtp() {
    int min = 100000; // Minimum 6-digit number
    int max = 999999; // Maximum 6-digit number
    Random random = Random();
    int otp = min + random.nextInt(max - min + 1);
    Get.log('========== generated otp : $otp ==========');
    return otp;
  }
}
