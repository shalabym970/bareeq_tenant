import 'dart:convert';
import 'dart:typed_data';
import 'package:Bareeq/common/constants.dart';
import 'package:Bareeq/common/strings/strings.dart';
import 'package:Bareeq/common/widgets/ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';

import '../../common/strings/error_strings.dart';

class AttachmentServices {
  static Future<String> convertBase64ToFile(
      {required String base64String, required String fileName}) async {
    String filePath = Constants.downloadPath + fileName;
    // Decode the Base64 string
    if (await File(filePath).exists()) {
      int count = 1;
      String newFileName;
      do {
        newFileName =
            '${getFileNameWithoutExtension(fileName)}$count.${getFileExtension(fileName)}';
        count++;
      } while (await File(Constants.downloadPath + newFileName).exists());
      filePath = Constants.downloadPath + newFileName;
    }
    // Create a new file in the documents directory
    File file = File(filePath);

    Uint8List bytes = base64Decode(base64String);
    await file
        .writeAsBytes(bytes)
        .then((value) => Ui.showToast(content: Strings.downloadSuccess))
        .onError((error, stackTrace) =>
            Ui.showToast(content: Strings.downloadFailed, error: true));

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

  /// Save file on device
  static downloadBase64File(
      {required String fileName,
      required String mimeType,
      required String base64String}) async {
    final fileNameConverted = AttachmentServices.convertToSnakeCase(fileName);
    String fileExtension = AttachmentServices.extractFileExtension(mimeType);
    String filePAth = await AttachmentServices.convertBase64ToFile(
        fileName: "$fileNameConverted.$fileExtension",
        base64String: base64String);

    Get.log('========== filePathNAME  : $filePAth ============');
  }

  static String getFileNameWithoutExtension(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    return dotIndex != -1 ? fileName.substring(0, dotIndex) : fileName;
  }

  static String getFileExtension(String fileName) {
    final dotIndex = fileName.lastIndexOf('.');
    return dotIndex != -1 ? fileName.substring(dotIndex + 1) : '';
  }

  ///pick file from device

  static Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'txt', 'jpeg'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      Ui.showToast(content: ErrorStrings.notSelectFile);
      return null;
    }
  }

  ///pick Multiple Files from device
  static Future<List<File>?> pickMultipleFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'txt', 'jpeg'],
    );

    if (result != null) {
      List<File> files = result.files.map((file) => File(file.path!)).toList();
      return files;
    } else {
      Ui.showToast(content: ErrorStrings.notSelectFile);
      return null;
    }
  }

  /// get file size by MB
  static Future<double> getFileSizeInMB({required File file}) async {
    int fileSizeInBytes = await file.length();
    double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
    return fileSizeInMB;
  }

  /// convert file to base64
  static Future<String?> convertFileToBase64({required File file}) async {
    try {
      List<int> fileBytes = await file.readAsBytes();
      String base64String = base64Encode(fileBytes);
      return base64String;
    } catch (e) {
      Ui.showToast(
          content: ErrorStrings.errorConvertFileToBase64 + e.toString());
      return null;
    }
  }
}
