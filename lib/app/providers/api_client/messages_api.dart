import 'package:Seef/app/models/message.dart';
import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../common/widgets/ui.dart';
import '../../services/nltm_auhtorization_service.dart';

class MessagesApi extends GetxService {
  /// Get messages
  static Future<List<MessageModel>> getMessages(
      {required String regardingId}) async {
    String url =
        '${Constants.baseUrl}blser_portalmessageses?\$select=blser_readstatus,_blser_account_value,statuscode,subject,blser_messagetext,_blser_contact_value,blser_direction,createdon,_regardingobjectid_value,_createdby_value,prioritycode&\$filter=(_regardingobjectid_value eq $regardingId)';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));
    Get.log('===============  Messages url :  $url ==========');
    Get.log('=============== Messages response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
      return decodeResponse['value']
          .map<MessageModel>((obj) => MessageModel.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
