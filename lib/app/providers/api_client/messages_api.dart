import 'package:Bareeq/app/models/message.dart';
import 'package:Bareeq/app/services/session_services.dart';
import 'package:get/get.dart';
import '../../helper/api_helper.dart';
import '../../helper/token_helper.dart';

class MessagesApi extends GetxService {
  /// Get messages
  static Future<List<MessageModel>> getMessagesForRecord(
      {required String regardingId}) async {
    String url = 'blser_portalmessageses?'
        '\$select=blser_readstatus,_blser_account_value,statuscode,subject,blser_messagetext,_blser_contact_value,blser_direction,createdon,_regardingobjectid_value'
        ',_createdby_value,prioritycode&\$filter=(_regardingobjectid_value eq $regardingId)'
        '&\$orderby=createdon desc';
    Get.log('===============  Messages url :  $url ==========');
    var response = await ApiHelper.getData(url: url);
    Get.log('=============== Messages response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await TokenHelper.decodeResponse(response: response);
      return decodeResponse['value']
          .map<MessageModel>((obj) => MessageModel.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// Get messages
  static Future<List<MessageModel>> getAllMessages(
      {required bool isInbox, required String type}) async {
    String url = isInbox == true
        ? 'blser_portalmessageses?\$select=blser_readstatus,_blser_account_value,'
            'statuscode,subject,blser_messagetext,_blser_contact_value,blser_direction,createdon,'
            '_regardingobjectid_value,_createdby_value,prioritycode&'
            '\$filter=(_blser_account_value eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId})'
            ' and (blser_direction eq false) &\$orderby=createdon desc'
        : 'blser_portalmessageses?\$select=blser_readstatus,_blser_account_value,'
            'statuscode,subject,blser_messagetext,_blser_contact_value,blser_direction,createdon,_regardingobjectid_value,'
            '_createdby_value,prioritycode&'
            '\$filter=(_blser_account_value eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId}) '
            'and (blser_direction eq true) &\$orderby=createdon desc';
    Get.log('===============  Messages url :  $url ==========');
    var response = await ApiHelper.getData(url: url);
    Get.log('=============== Messages response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await TokenHelper.decodeResponse(response: response);
      return decodeResponse['value']
          .map<MessageModel>((obj) => MessageModel.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// reply message
  static Future<String> replyMessage({required MessageModel request}) async {
    String url = "blser_portalmessageses";
    Get.log("========== reply message url :: $url ==========");
    var response = await ApiHelper.postData(body: request.toJson(), url: url);
    var decodeResponse = await TokenHelper.decodeResponse(response: response);
    Get.log(
        '=============== reply message response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      Map<String, dynamic> responseMap = decodeResponse;
      String messageId = responseMap['activityid'];
      return messageId;
    } else {
      throw Exception(decodeResponse['message']);
    }
  }
}