import 'dart:convert';
import 'dart:developer';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;


class TokenServices {
  static void setTokenExpiryDate() {
    DateTime tokenExpiryDate = DateTime.now().add(const Duration(minutes: 40));
    sharedPref!.setString('expiry_token_date', tokenExpiryDate.toString());
  }

  static bool accessTokenIsExpired() {
    log("expiry_token_date>>${sharedPref!.getString('expiry_token_date')}");
    return sharedPref!.getString('expiry_token_date') == null
        ? true
        : DateTime.now().isAfter(
        DateTime.parse(sharedPref!.getString('expiry_token_date')!));
  }

  static Future<void> refreshToken() async {
    await oauth.login();
    setTokenExpiryDate();
  }

  static decodeResponse({required Response<dynamic> response}) async {
    var decodeResponse = await jsonDecode(response.body) as Map<String, dynamic>;
    return decodeResponse;
  }


  getToken()async{
    String url =
        "https://login.microsoftonline.com/583aa4ea-8e7e-4e04-bd32-0158165f16af/oauth2/token";
    const String clientId = '1789a239-2a62-402b-9670-4f8722c8f7b5';
    const String resource = "https://bar.crm4.dynamics.com";
    const String clientSecret = 'wEM8Q~VQAaFhIMLl5vx1cg4AHXSr6oJX2HGHcak6';

    Map<String, dynamic> body = {
      'grant_type': "client_credentials",
      'client_id': clientId,
      'client_secret': clientSecret,
      'resource': resource,
    };

    try {
      var response = await http.post(Uri.parse(url), body: body);
      log("access token ${response.statusCode}");
      if (response.statusCode == 200) {
        userAuthInfo = Token.fromJson(jsonDecode(response.body));
        log('============================ ${response.body}');
        CacheHelper.saveData(
            key: 'access_token', value: userAuthInfo.accessToken);
        log('access_token ${userAuthInfo.accessToken}');

        log('refreshToken ${userAuthInfo.refreshToken}');
        var expireTime = DateTime.now().add(const Duration(minutes: 55));
        CacheHelper.saveData(key: 'expireTime', value: expireTime.toString());
      }
    } catch (e) {
      log('getAccessTokenFirstTime ${e.toString()}');
    }
  }

}
