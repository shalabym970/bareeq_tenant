import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../common/widgets/ui.dart';
import '../../models/case_model.dart';
import '../../services/nltm_auhtorization_service.dart';
import '../../services/session_services.dart';

class CasesApi {
  /// Get all cases
  static Future<List<Case>> getCases() async {
    String url =
        '${Constants.baseUrl}blser_cases?\$select=_blser_relatedproject_value,'
        'new_prioritycode,statuscode,blser_title,_blser_propertylease_value,statecode,'
        'blser_caseserial,blser_casetypecode,createdon,blser_datecompleted,_blser_leaseunit_value,'
        'blser_caseid,blser_description,_blser_account_value&'
        '\$expand=blser_case_blser_portalmessageses(\$select=subject,blser_messagetext,activityid,createdon)'
        ',blser_LeaseUnit(\$select=advanced_name,_bls_relatedleasecontract_value,statecode),blser_RelatedProject'
        '(\$select=advanced_name,advanced_buildingno)&\$filter=(_blser_contact_value eq ${Get.find<SessionServices>().currentUser.value.contactId}) '
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
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
