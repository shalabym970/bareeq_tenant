import 'package:bareeq/app/models/leased_property.dart';
import 'package:bareeq/app/models/sold_property.dart';
import 'package:get/get.dart';
import '../../helper/api_helper.dart';
import '../../services/session_services.dart';
import '../../helper/token_helper.dart';

class PropertiesApi {
  /// Get all leased properties
  static Future<List<LeasedProperty>> getLeasedProperties() async {
    String url =
        'advanced_propertycontracts?\$select=advanced_propertycontractid,advanced_enddate,'
        'advanced_terminationdate,advanced_contractdate,advanced_contractperiod,advanced_startdate,'
        'new_commencementdate,advanced_contracttype,advanced_name,blser_brandname,new_erpcontractnumber,'
        'blser_leasenumber,advanced_contractstatus,advanced_rentamount&\$expand=advanced_unitid(\$select=advanced_name),'
        'blser_BrandShop(\$select=blser_name),blser_Property(\$select=advanced_name)'
        '&\$filter=(_bls_customeraccount_value eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId}) '
        '&\$orderby=createdon desc';
    var response = await ApiHelper.getData(url: url);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
      Get.log('=============== Leases response :  $decodeResponse ==========');
      return decodeResponse['value']
          .map<LeasedProperty>((obj) => LeasedProperty.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// Get all sold properties
  static Future<List<SoldProperty>> getSoldProperties() async {
    String url = "blser_propertyagreements?"
        "\$select=blser_agreementtype,blser_transferdate,blser_agreementdate,blser_agreementref,blser_name,"
        "blser_agreementstatus&\$expand=blser_PropertyUnit(\$select=advanced_name),"
        "blser_Property(\$select=advanced_name)&\$filter=(_blser_customeraccount_value eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId}) "
        "and (blser_agreementtype eq 550220000) &\$orderby=createdon desc";
    var response = await ApiHelper.getData(url: url);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
      Get.log(
          '=============== sold properties response :  $decodeResponse ==========');

      return decodeResponse['value']
          .map<SoldProperty>((obj) => SoldProperty.fromJson(obj))
          .toList();
    } else {
      Get.log(
          '=============== sold properties reason Phrase :  ${response.reasonPhrase} ==========');
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
