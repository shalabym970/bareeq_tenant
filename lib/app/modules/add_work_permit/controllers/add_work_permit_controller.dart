import 'package:Bareeq/common/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/strings/strings.dart';
import '../../../models/document.dart';

class AddWorkPermitController extends GetxController {
  final subjectController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final standardCheck = false.obs;
  final urgentCheck = false.obs;
  final acceptResponsibilityCheck = false.obs;
  final startDate = Rxn<DateTime>();
  final selectedStartDate = Strings.ddMMYY.obs;
  final endDate = Rxn<DateTime>();
  final selectedEndDate = Strings.ddMMYY.obs;
  final cprAttach = Attachment().obs;
  final insuranceAttach = Attachment().obs;
  final methodAttach = Attachment().obs;
  final riskAttach = Attachment().obs;
  final loadingCprAttach = false.obs;
  final loadingInsuranceAttach = false.obs;
  final loadingMethodAttach = false.obs;
  final loadingRiskAttach = false.obs;
  final relatedUnitValue = 'Unit 10 - Building 8';
  final relatedUnitList = <String>['Unit 10 - Building 8', 'fj', 'hgh', 'hghg'];
  final contractorValue = 'Contractor';
  final contractorList = <String>['Contractor', 'fj', 'hgh', 'hghg'];

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
        Get.log('==== End date Date : ${endDate.toString()} ===');
      }
    }
  }
}
