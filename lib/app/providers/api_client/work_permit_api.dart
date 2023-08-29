import 'package:Bareeq/app/models/unit.dart';
import 'package:Bareeq/app/models/work_permit.dart';
import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../common/widgets/ui.dart';
import '../../models/work_permit_item.dart';
import '../../services/nltm_auhtorization_service.dart';
import '../../services/session_services.dart';

class WorkPermitApi extends GetxService {
  /// Get work permits
  static Future<List<WorkPermitModel>> getWorkPermits() async {
    String url =
        '${Constants.baseUrl}blser_workpermits?\$select=blser_subject,new_type,statuscode,_blser_contractor_value,_blser_customer_value,'
        'blser_startdate,blser_enddate,blser_descriptionofwork,blser_workpermitid,blser_numberofworkers,blser_riskassessment,_ownerid_value,'
        'blser_seefcomments&\$expand=blser_RelatedUnit(\$select=advanced_name,statecode,_new_unittype_value,advanced_totalprice,createdon,'
        '_bls_relatedleaserenewal_value,_bls_relatedleasecontract_value,advanced_description,_bls_currentcontract_value,_ownerid_value,'
        'blser_erp_end_date,blser_erp_start_date),blser_Contractor(\$select=bls_accountstatus,name,accountid,blser_accounttype)'
        '&\$filter=(_blser_customer_value%20eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId})&\$orderby=createdon desc';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));
    Get.log('=============== Work Permit url :  $url ==========');
    Get.log(
        '=============== Work Permit response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
      return decodeResponse['value']
          .map<WorkPermitModel>((obj) => WorkPermitModel.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// Get work permit items
  static Future<List<WorkPermitItem>> getWorkPermitItems(
      {required String workPermitId}) async {
    String url =
        '${Constants.baseUrl}blser_workpermititems?\$select=statuscode,blser_workpermititemid,blser_id,'
        'createdon,_blser_workpermit_value,_ownerid_value,_owningbusinessunit_value,_createdby_value,'
        'blser_workdescription,blser_worktype&\$filter=(_blser_workpermit_value eq $workPermitId)'
        '&\$orderby=createdon desc';
    var response = await NLTMAuthServices.client.get(Uri.parse(url),
        headers: {"Prefer": "odata.include-annotations=*"});
    Get.log('=============== Work Permit items url :  $url ==========');
    Get.log(
        '=============== Work Permit items response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);

      return decodeResponse['value']
          .map<WorkPermitItem>((obj) => WorkPermitItem.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// Get work permit items
  static Future<List<Unit>> getRelatedUnits() async {
    String url =
        "${Constants.baseUrl}advanced_units?\$select=advanced_name&\$expand=advanced_advanced_unit_advanced_propertycontract"
        "(\$select=advanced_propertycontractid;\$expand=advanced_contactid(\$select=contactid;"
        "\$filter=(contactid eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId})))&"
        "\$filter=(advanced_advanced_unit_advanced_propertycontract/any(o1:(o1/advanced_propertycontractid ne null)))";
    var response = await NLTMAuthServices.client.get(Uri.parse(url),
        headers: {"Prefer": "odata.include-annotations=*"});
    Get.log('=============== related units url :  $url ==========');
    Get.log('=============== related response url :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);

      return decodeResponse['value']
          .map<Unit>((obj) => Unit.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
