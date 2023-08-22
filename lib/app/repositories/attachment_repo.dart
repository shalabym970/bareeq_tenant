
import 'package:Bareeq/app/providers/api_client/attachmentApi.dart';

import '../models/document.dart';

class AttachmentRepo {
  Future<List<Attachment>> getAttachments(
      {required String recordId,  String? attachmentType}) async {
    return AttachmentApi.getAttachments(
        workPermitId: recordId, attachmentType: attachmentType);
  }


}
