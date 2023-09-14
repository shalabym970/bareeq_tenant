import 'package:get/get.dart';
import '../../models/attachment.dart';
import '../../helper/api_helper.dart';
import '../../helper/token_helper.dart';

class AttachmentApi {
  /// Get work permit attachment
  static Future<List<Attachment>> getAttachments(
      {required String workPermitId, String? attachmentType}) async {
    String url = attachmentType != null
        ? 'annotations?\$select=notetext,objecttypecode,mimetype,filename,_objectid_value,'
            'filesize,createdon,objecttypecode,documentbody&\$filter=(_objectid_value eq $workPermitId)'
            ' and (notetext eq \'$attachmentType\')'
        : 'annotations?\$select=notetext,objecttypecode,mimetype,filename,_objectid_value,'
            'filesize,createdon,objecttypecode,documentbody&\$filter=(_objectid_value eq $workPermitId)';
    Get.log('===============  attachment url :  $url ==========');
    var response = await ApiHelper.getData(url: url);
    Get.log(
        '===============  attachment response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await TokenHelper.decodeResponse(response: response);
      return decodeResponse['value']
          .map<Attachment>((obj) => Attachment.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// post attachments
  static Future postAttachments({required List<Attachment> requests}) async {
    String url = "annotations";
    Get.log("========== post Attachments url :: $url ==========");
    for (var request in requests) {
      var response =
          await ApiHelper.postData(body: request.toJson(), url: url);
      var decodeResponse =
          await TokenHelper.decodeResponse(response: response);
      Get.log(
          '========== post Attachments response :: $decodeResponse ==========');
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
      } else {
        throw Exception(decodeResponse['message']);
      }
    }
  }

  /// update attachment
  static Future updateAttachment({required Attachment attachment}) async {
    String url = "annotations(${attachment.id})";
    Get.log("========== update attachment url : $url ==========");
    var response = await ApiHelper.patchData(
      url: url,
      body: attachment.toJson(),
    );
    var decodeResponse = await TokenHelper.decodeResponse(response: response);
    Get.log(
        '========== update attachment response : $decodeResponse ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
    } else {
      throw Exception();
    }
  }

  /// delete attachment
  static Future deleteAttachment({required String id}) async {
    String url = "annotations($id)";
    Get.log("========== delete attachment url : $url ==========");
    var response = await ApiHelper.deleteData(url: url);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
    } else {
      throw Exception();
    }
  }
}
