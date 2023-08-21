import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class AttachmentServices {
  static Future<String> convertBase64ToFile(
      {required String base64String, required String fileName}) async {
    // Decode the Base64 string
    Uint8List bytes = base64Decode(base64String);

    // Get the application documents directory
    String dir = (await getApplicationDocumentsDirectory()).path;
    Get.log('========== appDocumentsDirectory : $dir ============');

    // Create a new file in the documents directory
    File file = File('/storage/emulated/0/Download/$fileName');
    await file.writeAsBytes(bytes);

    return file.path;
  }

  /// To Convert The String With Space in Attachment With Spase To Snack Case
  /// EX: "Method Statement Attachment" -> "method_statement_attachment"
  static String convertToSnakeCase(String input) {
    return input.toLowerCase().replaceAll(' ', '_');
  }

  /// Extract File Extension From The Mime Type EX: "image/png" -> ".png"
  static String extractFileExtension(String mimeType) {
    int slashIndex = mimeType.lastIndexOf('/');
    if (slashIndex != -1 && slashIndex < mimeType.length - 1) {
      return mimeType.substring(slashIndex + 1);
    }
    return '';
  }
}
