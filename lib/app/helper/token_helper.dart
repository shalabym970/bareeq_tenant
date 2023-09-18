import 'dart:convert';
import 'package:bareeq/app/providers/api_client/contact_api.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'cash_helper.dart';

class TokenHelper {
  static void setTokenExpiryDate() {
    DateTime tokenExpiryDate = DateTime.now().add(const Duration(minutes: 55));
    CashHelper.saveData(
        key: 'expiry_token_date', value: tokenExpiryDate.toString());
  }

  static bool accessTokenIsExpired() {
    Get.log(
        "expiry_token_date>>${CashHelper.getData(key: 'expiry_token_date')}");
    return CashHelper.getData(key: 'expiry_token_date') == null
        ? true
        : DateTime.now().isAfter(
            DateTime.parse(CashHelper.getData(key: 'expiry_token_date')!));
  }

  static Future<void> refreshToken() async {
    await ContactApi.getToken();
    setTokenExpiryDate();
  }

  static decodeResponse({required http.Response response}) async {
    var decodeResponse =
        await jsonDecode(response.body) as Map<String, dynamic>;
    return decodeResponse;
  }
}
