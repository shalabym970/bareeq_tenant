import 'dart:convert';
import 'package:Bareeq/app/services/token_services.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import '../../common/constants.dart';
import '../../main.dart';

class ApiServices {
  ///Post
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    if (TokenServices.accessTokenIsExpired()) {
      await TokenServices.refreshToken();
    }
    var token = await oauth.getAccessToken();
    Constants.headers['Authorization'] = 'Bearer $token';

    return await http
        .post(
      Uri.parse(Constants.baseUrl + url),
      body: jsonEncode(body),
      headers: Constants.headers,
    )
        .catchError((error) {
      return error;
    }) as Response;
  }

  ///Get
  static Future<Response> getData({
    required String url,
  }) async {
    if (TokenServices.accessTokenIsExpired()) {
      await TokenServices.refreshToken();
    }
    var token = await oauth.getAccessToken();
    Constants.headers['Authorization'] = 'Bearer $token';

    return await http
        .get(Uri.parse(Constants.baseUrl + url), headers: Constants.headers)
        .catchError((error) {
      return error;
    }) as Response;
  }

  ///Patch
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    if (TokenServices.accessTokenIsExpired()) {
      await TokenServices.refreshToken();
    }
    var token = await oauth.getAccessToken();
    Constants.headers['Authorization'] = 'Bearer $token';
    return await http
        .patch(Uri.parse(Constants.baseUrl + url),
            body: body, headers: Constants.headers)
        .catchError((error) {
      return error;
    }) as Response;
  }

  ///Delete
  static Future<Response> deleteData({
    required String url,
  }) async {
    if (TokenServices.accessTokenIsExpired()) {
      await TokenServices.refreshToken();
    }
    var token = await oauth.getAccessToken();
    Constants.headers['Authorization'] = 'Bearer $token';

    return await http
        .delete(Uri.parse(Constants.baseUrl + url),
            encoding: encoding, headers: Constants.headers)
        .catchError((error) {
      return error;
    }) as Response;
  }
}
