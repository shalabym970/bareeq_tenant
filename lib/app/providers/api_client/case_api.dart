import 'dart:convert';

import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../main.dart';
import '../../models/case_model.dart';
import '../../services/nltm_auhtorization_service.dart';
import '../../services/session_services.dart';

class CasesApi {
  /// Get all cases
  static Future<List<Case>> getCases() async {
    String url =
        '${Constants.baseUrl}blser_cases?\$select=blser_natureofcomplaint,_blser_relatedproject_value,'
        'new_prioritycode,blser_title,'
        'blser_caseserial,blser_casetypecode,createdon,blser_datecompleted,_blser_leaseunit_value,'
        'blser_caseid,blser_description,_blser_account_value&'
        '\$expand=blser_case_blser_portalmessageses(\$select=subject,blser_messagetext,activityid,createdon)'
        ',blser_LeaseUnit(\$select=advanced_name,_bls_relatedleasecontract_value,statecode),blser_RelatedProject'
        '(\$select=advanced_name,advanced_buildingno)&\$filter=(_blser_contact_value eq ${Get.find<SessionServices>().currentUser.value.id}) '
        'and (blser_RelatedProject/advanced_projectid ne null)&\$orderby=createdon desc';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));
    Get.log('=============== Cases url :  $url ==========');
    Get.log('=============== Cases response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
      return decodeResponse['value']
          .map<Case>((obj) => Case.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// Post case
  static Future postCase({required Case request}) async {
    String url = "${Constants.baseUrl}blser_cases";
    Get.log("========== post case url :: $url ==========");
    var response = await NLTMAuthServices.client
        .post(Uri.parse(url),
            headers: Constants.headers,
            body: jsonEncode(request.toJson()),
            encoding: encoding)
        .catchError((error) {
      Get.log(error.toString());
    }).timeout(const Duration(seconds: 30));
    var decodeResponse =
        await NLTMAuthServices.decodeResponse(response: response);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      Get.log(
          '=============== post Case response :  ${response.body} ==========');
    } else {
      throw Exception(decodeResponse['message']);
    }
  }
}
