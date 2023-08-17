import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../models/document.dart';

class AttachmentServices {
  static Future<File?> transferAttachmentToFile(
      {required Attachment attachment, required String recordName}) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      List<int> bytes = base64Decode(attachment.documentBody!);
      final file =
          File('${appStorage.path}/$recordName/${attachment.mimeType}');
      await file.writeAsBytes(bytes);

      return file;
    } catch (e) {
      return null;
    }
  }

  static openAttachment(
      {required Attachment attachment, required String recordName}) async {
    final file = await transferAttachmentToFile(
        attachment: attachment, recordName: recordName);
    if (file == null){
      Get.log(" ===== file is null =========");
    }
    Get.log("path : ${file?.path}");
    OpenFile.open(file?.path);
  }
}
