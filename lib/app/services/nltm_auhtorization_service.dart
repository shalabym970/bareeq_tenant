import 'dart:convert';

import 'package:http/http.dart';
import 'package:ntlm/ntlm.dart';

import '../../common/constants.dart';

class NLTMAuthServices {
  static var client = NTLMClient(
      domain: 'blive',
      username: Constants.username,
      password: Constants.password);

  static decodeResponse({required Response response}) async {
    var decodeResponse = await jsonDecode(response.body) as Map<String, dynamic>;
    return decodeResponse;
  }
}
