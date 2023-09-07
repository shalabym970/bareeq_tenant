import 'package:get/get.dart';
import '../../../common/constants.dart';
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

  static postAttachments({required List<Attachment> request}) {

  }
}
