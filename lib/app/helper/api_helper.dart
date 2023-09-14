import 'dart:convert';
import 'package:Bareeq/app/helper/cash_helper.dart';
import 'package:Bareeq/app/helper/token_helper.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../../common/constants.dart';
import '../../main.dart';

class ApiHelper {
  ///Post
  static Future<http.Response> postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    if (TokenHelper.accessTokenIsExpired()) {
      await TokenHelper.refreshToken();
    }
    var token = CashHelper.getData(key: 'access_token');
    Constants.headers['Authorization'] = 'Bearer $token';

    return await http
        .post(
      Uri.parse(Constants.baseUrl + url),
      body: jsonEncode(body),
      headers: Constants.headers,
    )
        .catchError((error) {
      return error;
    });
  }

  ///Get
  static Future<http.Response> getData({
    required String url,
  }) async {
    if (TokenHelper.accessTokenIsExpired()) {
      await TokenHelper.refreshToken();
    }
    var token = CashHelper.getData(key: 'access_token');
    Constants.headers['Authorization'] = 'Bearer $token';
    var response = await http
        .get(Uri.parse(Constants.baseUrl + url), headers: Constants.headers)
        .catchError((error) {
      return error;
    });

    return response;
  }

  ///Patch
  static Future<http.Response> patchData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    if (TokenHelper.accessTokenIsExpired()) {
      await TokenHelper.refreshToken();
    }
    var token = CashHelper.getData(key: 'access_token');
    Constants.headers['Authorization'] = 'Bearer $token';
    return await http
        .patch(Uri.parse(Constants.baseUrl + url),
            body: body, headers: Constants.headers)
        .catchError((error) {
      return error;
    });
  }

  ///Delete
  static Future<Response> deleteData({
    required String url,
  }) async {
    if (TokenHelper.accessTokenIsExpired()) {
      await TokenHelper.refreshToken();
    }
    var token = CashHelper.getData(key: 'access_token');
    Constants.headers['Authorization'] = 'Bearer $token';

    return await http
        .delete(Uri.parse(Constants.baseUrl + url),
            encoding: encoding, headers: Constants.headers)
        .catchError((error) {
      return error;
    }) as Response;
  }
}
