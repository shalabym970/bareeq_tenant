import 'package:Bareeq/app/services/attachment_services.dart';
import 'package:Bareeq/common/color_manager.dart';
import 'package:Bareeq/common/constants.dart';
import 'package:Bareeq/common/widgets/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/strings/strings.dart';
import 'dart:io';

class AddWorkPermitController extends GetxController {
  final standardCheck = true.obs;
  final urgentCheck = false.obs;
  final acceptResponsibilityCheck = false.obs;
  final startDate = Rxn<DateTime>();
  final selectedStartDate = Strings.selectStartDate.obs;
  final endDate = Rxn<DateTime>();
  final selectedEndDate = Strings.selectEndDate.obs;
  final cprAttach = Rxn<File>();
  final insuranceAttach = Rxn<File>();
  final methodAttach = Rxn<File>();
  final riskAttach = Rxn<File>();
  final relatedUnitValue = 'Unit 10 - Building 8';
  final relatedUnitList = <String>['Unit 10 - Building 8', 'fj', 'hgh', 'hghg'];
  final contractorValue = 'Contractor';
  final contractorList = <String>['Contractor', 'fj', 'hgh', 'hghg'];
  final addWorkPermitKey = GlobalKey<FormState>();
  final numberOfWorkersController = TextEditingController();
  final detailsController = TextEditingController();
  final subjectController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  File? file;

  Future<void> selectDate({required bool dateTypeIsStart}) async {
    if (dateTypeIsStart == true) {
      startDate.value = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2035),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: ColorManager.mainColor,
              colorScheme: ColorScheme.light(primary: ColorManager.mainColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
      );

      if (startDate.value != null) {
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        selectedStartDate.value = formatter.format(startDate.value!);
        startDateController.text = selectedStartDate.value;
        Get.log('==== Start Date : ${startDate.toString()} ===');
      }
    } else {
      endDate.value = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2035),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: ColorManager.mainColor,
              colorScheme: ColorScheme.light(primary: ColorManager.mainColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
      );
      if (endDate.value != null) {
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        selectedEndDate.value = formatter.format(endDate.value!);
        endDateController.text = selectedEndDate.value;
        Get.log('==== End date Date : ${endDate.toString()} ===');
      }
    }
  }

  selectFile({required String fileType}) async {
    if (fileType == Constants.cprFile) {
      file = await AttachmentServices.pickFile();
      cprAttach.value =
          cprAttach.value != null && file == null ? cprAttach.value : file;
      file = null;
    } else if (fileType == Constants.insuranceFile) {
      file = await AttachmentServices.pickFile();
      insuranceAttach.value = insuranceAttach.value != null && file == null
          ? insuranceAttach.value
          : file;
      file = null;
    } else if (fileType == Constants.methodFile) {
      file = await AttachmentServices.pickFile();
      methodAttach.value = methodAttach.value != null && file == null
          ? methodAttach.value
          : file;
      file = null;
    } else {
      file = await AttachmentServices.pickFile();
      riskAttach.value =
          riskAttach.value != null && file == null ? riskAttach.value : file;
      file = null;
    }
  }

  submitWorkPermit() {
    if (addWorkPermitKey.currentState!.validate()) {
      if (acceptResponsibilityCheck.isTrue) {
        addWorkPermitKey.currentState?.save();
      } else {
        Ui.showToast(content: Strings.pleaseAcceptResponsibility, error: true);
      }
    }
  }
}
