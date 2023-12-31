import 'package:get/get.dart';
import '../../../common/widgets/ui.dart';
import '../../models/fit_out_model.dart';
import '../../models/fit_out_step_model.dart';
import '../../helper/api_helper.dart';
import '../../services/session_services.dart';
import '../../helper/token_helper.dart';

class FitOutApi extends GetxService {
  /// Get fit outs
  static Future<List<FitOutModel>> getFitOuts() async {
    String url =
        'blser_fitoutprocesses?\$select=blser_startdate,blser_approved,createdon,'
        'blser_approvedon,blser_completeddate,blser_name,blser_fitoutprocessid,blser_reviewedon,_blser_relatedtenant_value,'
        'blser_expectedopeningdate,blser_reviewed,_blser_relatedcontract_value,blser_processstatus'
        '&\$expand=blser_RelatedProperty(\$select=new_contracttypes,_transactioncurrencyid_value,_blser_country_value,'
        'blser_numberofunits,bls_locationdescription,advanced_location,bls_projectstatus,_blser_city_value,statuscode,'
        'createdon,blser_englishtitle,advanced_name,blser_fitoutprocessguide,blser_arabictitle,advanced_unit,'
        'advanced_description,new_governmentid),blser_RelatedUnit(\$select=advanced_name)'
        '&\$filter=(_blser_relatedtenant_value eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId})'
        ' and (blser_RelatedProperty/advanced_projectid ne null) and (blser_RelatedUnit/advanced_unitid ne null)'
        '&\$orderby=createdon desc';
    var response = await ApiHelper.getData(url: url);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
      Get.log(
          '=============== fit outs response :  $decodeResponse ==========');
      return decodeResponse['value']
          .map<FitOutModel>((obj) => FitOutModel.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase);
    }
  }

  /// Get fit outs steps
  static Future<List<FitOutStepModel>> getFitOutsSteps(
      {required String fitOutId}) async {
    String url =
        'blser_fitoutsteps?\$select=blser_description,blser_stepstatus,statuscode,_blser_relatedprocess_value,'
        'createdon,blser_name&\$expand=blser_fitoutstep_Tasks(\$select=subject)'
        '&\$filter=(_blser_relatedprocess_value%20eq $fitOutId)';
    Get.log('===============  fit out steps url :  $url ==========');
    var response = await ApiHelper.getData(url: url);
    Get.log(
        '=============== fit out steps response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
      return decodeResponse['value']
          .map<FitOutStepModel>((obj) => FitOutStepModel.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
