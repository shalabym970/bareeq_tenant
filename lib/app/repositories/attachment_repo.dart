import 'package:Bareeq/app/providers/api_client/attachmentApi.dart';

import '../models/document.dart';

class AttachmentRepo {
  Future<List<Attachment>> getAttachments(
      {required String recordId, String? attachmentType}) async {
    return await AttachmentApi.getAttachments(
        workPermitId: recordId, attachmentType: attachmentType);
  }

  Future postAttachments({required List<Attachment> requests}) async {
    return await AttachmentApi.postAttachments(requests: requests);
  }

  Future updateAttachment({required Attachment attachment}) async {
    return await AttachmentApi.updateAttachment(attachment: attachment);
  }

  Future deleteAttachment({required String attachmentId}) async {
    return await AttachmentApi.deleteAttachment(id: attachmentId);
  }
}
