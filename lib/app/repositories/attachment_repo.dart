import 'package:Bareeq/app/providers/api_client/attachmentApi.dart';

import '../models/document.dart';

class AttachmentRepo {
  Future<List<Attachment>> getAttachments(
      {required String recordId, String? attachmentType}) async {
    return await AttachmentApi.getAttachments(
        workPermitId: recordId, attachmentType: attachmentType);
  }

  Future<List<Attachment>> postAttachments({required List<Attachment> request})async{
    return await AttachmentApi.postAttachments(request: request);
  }
}
