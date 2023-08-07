import 'package:Seef/app/models/work_permit.dart';
import 'package:get/get.dart';

import '../../../common/constants.dart';
import '../../../common/widgets/ui.dart';
import '../../services/nltm_auhtorization_service.dart';
import '../../services/session_services.dart';

class WorkPermitApi extends GetxService {
  /// Get work permits
  static Future<List<WorkPermit>> getWorkPermits() async {
    String url =
        '${Constants.baseUrl}blser_workpermits?\$select=blser_subject,new_type,_blser_contractor_value,_blser_customer_value,blser_startdate,blser_enddate,statecode,%20blser_descriptionofwork,blser_workpermitid,blser_numberofworkers,blser_riskassessment,_ownerid_value,blser_seefcomments&\$expand=blser_blser_workpermit_blser_workpermititem_WorkPermit(\$select=statecode,blser_workpermititemid,blser_id,createdon,_blser_workpermit_value,_ownerid_value,%20_createdby_value,blser_workdescription,blser_worktype),blser_RelatedUnit(\$select=advanced_name,statecode,_new_unittype_value,advanced_totalprice,createdon,_bls_relatedleaserenewal_value,_bls_relatedleasecontract_value,advanced_description,_bls_currentcontract_value,_ownerid_value,blser_erp_end_date,blser_erp_start_date),blser_Contractor(\$select=bls_accountstatus,name,accountid,blser_accounttype)&\$filter=(_blser_customer_value%20eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId})';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));

    var decodeResponse =
        await NLTMAuthServices.decodeResponse(response: response);
    Get.log('=============== Work Permit url :  $url ==========');
    Get.log('=============== Work Permit response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      return decodeResponse['value']
          .map<WorkPermit>((obj) => WorkPermit.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: decodeResponse['message']));
      throw Exception(decodeResponse['message']);
    }
  }
}
