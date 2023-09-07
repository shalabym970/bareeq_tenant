import 'package:Bareeq/app/models/account_model.dart';
import 'package:Bareeq/app/models/document.dart';
import 'package:Bareeq/app/models/work_permit.dart';
import 'package:Bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:Bareeq/app/repositories/attachment_repo.dart';
import 'package:Bareeq/app/services/attachment_services.dart';
import 'package:Bareeq/common/color_manager.dart';
import 'package:Bareeq/common/constants.dart';
import 'package:Bareeq/common/widgets/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import 'dart:io';
import '../../../models/unit.dart';
import '../../../repositories/work_permit_repo.dart';
import '../../../services/session_services.dart';

class CreateWorkPermitController extends GetxController {
  final standardCheck = true.obs;
  final urgentCheck = false.obs;
  final acceptResponsibilityCheck = false.obs;
  final submitLoading = false.obs;
  final loadingRelatedUnits = false.obs;
  final errorRelatedUnits = false.obs;
  final loadingContractors = false.obs;
  final errorContractors = false.obs;
  final startDate = Rxn<DateTime>();
  final relatedUnitsList = <Unit>[].obs;
  final selectedStartDate = Strings.selectStartDate.obs;
  final endDate = Rxn<DateTime>();
  final selectedEndDate = Strings.selectEndDate.obs;
  final cprFile = Rxn<File>();
  final insuranceFile = Rxn<File>();
  final methodFile = Rxn<File>();
  final riskFile = Rxn<File>();
  final relatedUnitValue = Rxn<Unit>();
  final contractorValue = Rxn<Account>();
  final uploadedAttachmentList = <Attachment>[].obs;
  final uploadedFilesList = <File>[].obs;
  final contractorsList = <Account>[].obs;
  final addWorkPermitKey = GlobalKey<FormState>();
  final numberOfWorkersController = TextEditingController();
  final detailsController = TextEditingController();
  final subjectController = TextEditingController();
  final _workPermit = WorkPermit().obs;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  WorkPermitRepo workPermitRepo = WorkPermitRepo();
  AttachmentRepo attachmentRepo = AttachmentRepo();
  File? file;

  @override
  onInit() async {
    getRelatedUnits();
    getContractors();
    super.onInit();
  }

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
      cprFile.value =
          cprFile.value != null && file == null ? cprFile.value : file;
      file = null;
    } else if (fileType == Constants.insuranceFile) {
      file = await AttachmentServices.pickFile();
      insuranceFile.value = insuranceFile.value != null && file == null
          ? insuranceFile.value
          : file;
      file = null;
    } else if (fileType == Constants.methodFile) {
      file = await AttachmentServices.pickFile();
      methodFile.value =
          methodFile.value != null && file == null ? methodFile.value : file;
      file = null;
    } else {
      file = await AttachmentServices.pickFile();
      riskFile.value =
          riskFile.value != null && file == null ? riskFile.value : file;
      file = null;
    }
  }

  submitWorkPermit() async {
    try {
      if (addWorkPermitKey.currentState!.validate()) {
        if (relatedUnitValue.value != null) {
          if (contractorValue.value != null) {
            if (acceptResponsibilityCheck.isTrue) {
              addWorkPermitKey.currentState?.save();
              submitLoading.value = true;
              _workPermit.value = WorkPermit(
                  type: urgentCheck.value,
                  subject: subjectController.text,
                  startDate: startDate.value,
                  endDate: endDate.value,
                  contractor: contractorValue.value,
                  relatedUnit: relatedUnitValue.value,
                  description: detailsController.text,
                  numberOfWorkers: int.parse(numberOfWorkersController.text),
                  contract: relatedUnitValue.value?.contract?.first,
                  customerId: Get.find<SessionServices>()
                      .currentUser
                      .value
                      .account!
                      .id);
              await workPermitRepo.postWorkPermit(request: _workPermit.value);
              await postAttachments();

              Ui.showToast(content: Strings.workPermitAddedSuccessfuly);
              Get.back(
                  result: Get.find<DashboardController>().getWorkPermits());
            } else {
              Ui.showToast(
                  content: ErrorStrings.pleaseAcceptResponsibility,
                  error: true);
            }
          } else {
            Ui.showToast(
                content: ErrorStrings.pleaseSelectContractor, error: true);
          }
        } else {
          Ui.showToast(
              content: ErrorStrings.pleaseSelectRelatedUnit, error: true);
        }
      } else {
        Ui.showToast(content: ErrorStrings.pleaseFillFields, error: true);
      }
    } catch (e) {
      submitLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedAddWorkPermit));
      Get.log('========== Error when create work permit : $e ==========');
    } finally {
      submitLoading.value = false;
    }
  }

  postAttachments() async {
    try {
      if (insuranceFile.value != null ||
          cprFile.value != null ||
          methodFile.value != null ||
          riskFile.value != null) {
        addAllFilesToList();

        await attachmentRepo.postAttachments(request: uploadedAttachmentList);
      }
    } catch (e) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when post attachments: $e ==========');
    }
  }

  void getRelatedUnits() async {
    try {
      errorRelatedUnits.value = false;
      loadingRelatedUnits.value = true;
      relatedUnitsList.assignAll(await workPermitRepo.getRelatedUnites());
    } catch (e) {
      errorRelatedUnits.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get related Unites : $e ==========');
    } finally {
      loadingRelatedUnits.value = false;
    }
  }

  void getContractors() async {
    try {
      errorContractors.value = false;
      loadingContractors.value = true;
      contractorsList.assignAll(await workPermitRepo.getContractors());
    } catch (e) {
      errorContractors.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get contractors : $e ==========');
    } finally {
      loadingContractors.value = false;
    }
  }

  addAllFilesToList() {
    if (insuranceFile.value != null) {
      uploadedFilesList.add(insuranceFile.value!);
    }
    if (cprFile.value != null) {
      uploadedFilesList.add(cprFile.value!);
    }
    if (methodFile.value != null) {
      uploadedFilesList.add(methodFile.value!);
    }
    if (riskFile.value != null) {
      uploadedFilesList.add(riskFile.value!);
    }
  }

//Todo: you must implement this as soon as possible
// Attachment convertFileToAttachment(File file) {
//   return Attachment(name: file.uri.pathSegments.last, path: file.path);
// }
}
