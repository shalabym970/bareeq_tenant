import 'package:Seef/app/models/lease_model.dart';
import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../common/widgets/ui.dart';
import '../../models/case_model.dart';
import '../../services/nltm_auhtorization_service.dart';
import '../../services/session_services.dart';

class LeasesApi {
  /// Get all cases
  static Future<List<LeaseModel>> getLeases() async {
    String url =
        '${Constants.baseUrl}advanced_propertycontracts?\$select=advanced_propertycontractid,advanced_enddate,advanced_terminationdate,advanced_contractdate,advanced_contractperiod,advanced_startdate,new_commencementdate,advanced_contracttype,advanced_name,blser_brandname,new_erpcontractnumber,blser_leasenumber,advanced_contractstatus,advanced_rentamount&\$expand=advanced_unitid(\$select=advanced_name),blser_BrandShop(\$select=blser_name),blser_Property(\$select=advanced_name)&\$filter=(_bls_customeraccount_value eq b6cd583c-ef58-ed11-93c4-6045bd0f6dd1) and (advanced_unitid/advanced_unitid ne null) and (blser_BrandShop/blser_erpshopid ne null) and (blser_Property/advanced_projectid ne null)';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));
    Get.log('=============== Leases url :  $url ==========');
    Get.log('=============== Leases response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
      return decodeResponse['value']
          .map<LeaseModel>((obj) => LeaseModel.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }
}