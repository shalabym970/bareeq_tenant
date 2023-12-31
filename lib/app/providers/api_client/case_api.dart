import 'package:get/get.dart';
import '../../models/case_model.dart';
import '../../helper/api_helper.dart';
import '../../services/session_services.dart';
import '../../helper/token_helper.dart';

class CasesApi {
  /// Get all cases
  static Future<List<Case>> getCases() async {
    String url =
        'blser_cases?\$select=blser_natureofcomplaint,_blser_relatedproject_value,'
        'new_prioritycode,blser_title,'
        'blser_caseserial,blser_casetypecode,createdon,blser_datecompleted,_blser_leaseunit_value,'
        'blser_caseid,blser_description,_blser_account_value&'
        '\$expand=blser_case_blser_portalmessageses(\$select=subject,blser_messagetext,activityid,createdon),blser_PropertyLease(\$select=advanced_name)'
        ',blser_LeaseUnit(\$select=advanced_name,_bls_relatedleasecontract_value,statecode),blser_RelatedProject'
        '(\$select=advanced_name,advanced_buildingno)&\$filter=(_blser_contact_value eq ${Get.find<SessionServices>().currentUser.value.id})'
        '&\$orderby=createdon desc';

    var response = await ApiHelper.getData(url: url);
    Get.log('=============== Cases response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
      return decodeResponse['value']
          .map<Case>((obj) => Case.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// Post case
  static postCase({required Case request}) async {
    String url = "blser_cases";
    Get.log("========== post case url :: $url ==========");
    var response = await ApiHelper.postData(body: request.toJson(), url: url);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      Get.log(
          '=============== post Case response :  ${response.body} ==========');
      Get.log(
          '=============== post Case reasonPhrase :  ${response.reasonPhrase} ==========');
    } else {
      Get.log(
          '=============== post Case reasonPhrase :  ${response.reasonPhrase} ==========');
      throw Exception(response.reasonPhrase);
    }
  }
}
