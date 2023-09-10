import 'dart:convert';
import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../main.dart';
import '../../models/document.dart';
import '../../services/nltm_auhtorization_service.dart';

class AttachmentApi {
  /// Get work permit attachment
  static Future<List<Attachment>> getAttachments(
      {required String workPermitId, String? attachmentType}) async {
    String url = attachmentType != null
        ? '${Constants.baseUrl}annotations?\$select=notetext,objecttypecode,mimetype,filename,_objectid_value,'
            'filesize,createdon,objecttypecode,documentbody&\$filter=(_objectid_value eq $workPermitId)'
            ' and (notetext eq \'$attachmentType\')'
        : '${Constants.baseUrl}annotations?\$select=notetext,objecttypecode,mimetype,filename,_objectid_value,'
            'filesize,createdon,objecttypecode,documentbody&\$filter=(_objectid_value eq $workPermitId)';
    var response = await NLTMAuthServices.client.get(Uri.parse(url),
        headers: {"Prefer": "odata.include-annotations=*"});
    Get.log('===============  attachment url :  $url ==========');
    Get.log(
        '===============  attachment response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
      return decodeResponse['value']
          .map<Attachment>((obj) => Attachment.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// post attachments
  static Future postAttachments({required List<Attachment> requests}) async {
    String url = "${Constants.baseUrl}annotations";
    Get.log("========== post Attachments url :: $url ==========");
    for (var request in requests) {
      var response = await NLTMAuthServices.client
          .post(Uri.parse(url),
              headers: Constants.headers,
              body: jsonEncode(request.toJson()),
              encoding: encoding)
          .catchError((error) {
        Get.log(error.toString());
      }).timeout(const Duration(seconds: 30));
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
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
    String url = "${Constants.baseUrl}annotations(${attachment.id})";
    Get.log("========== update attachment url : $url ==========");
    var response = await NLTMAuthServices.client
        .patch(Uri.parse(url),
            headers: Constants.headers,
            body: jsonEncode(attachment.toJson()),
            encoding: encoding)
        .catchError((error) {
      Get.log(error.toString());
    }).timeout(const Duration(seconds: 30));
    var decodeResponse =
        await NLTMAuthServices.decodeResponse(response: response);
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
    String url = "${Constants.baseUrl}annotations($id)";
    Get.log("========== delete attachment url : $url ==========");
    var response = await NLTMAuthServices.client
        .delete(Uri.parse(url), encoding: encoding)
        .catchError((error) {
      Get.log(error.toString());
    }).timeout(const Duration(seconds: 30));
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
    } else {
      throw Exception();
    }
  }
}
