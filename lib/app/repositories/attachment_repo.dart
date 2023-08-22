
import 'package:Bareeq/app/providers/api_client/attachmentApi.dart';

import '../models/document.dart';

class AttachmentRepo {
  Future<List<Attachment>> getAttachments(
      {required String workPermitId,  String? attachmentType}) async {
    return AttachmentApi.getAttachments(
        workPermitId: workPermitId, attachmentType: attachmentType);
  }


}
