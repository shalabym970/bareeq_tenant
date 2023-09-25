import 'package:bareeq/app/models/account_model.dart';
import 'package:bareeq/app/models/attachment.dart';
import 'package:bareeq/app/models/work_permit.dart';
import 'package:bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bareeq/app/repositories/attachment_repo.dart';
import 'package:bareeq/app/services/attachment_services.dart';
import 'package:bareeq/common/color_manager.dart';
import 'package:bareeq/common/constants.dart';
import 'package:bareeq/common/widgets/ui.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import 'dart:io';
import '../../../models/unit.dart';
import '../../../repositories/work_permit_repo.dart';
import '../../../services/check_internet_connection_service.dart';
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
  final contractorsList = <Account>[].obs;
  final addWorkPermitKey = GlobalKey<FormState>();
  final numberOfWorkersController = TextEditingController();
  final detailsController = TextEditingController();
  final subjectController = TextEditingController();
  final _workPermit = WorkPermit().obs;
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final workPermitRepo = WorkPermitRepo();
  final attachmentRepo = AttachmentRepo();
  final connectionController = Get.find<InternetConnectionController>();

  File? file;

  @override
  onInit() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      contractorValue.value = null;
      relatedUnitValue.value = null;
      getRelatedUnits();
      getContractors();
      super.onInit();
    }
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

  /// post work permits
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
                      .accountCustomerId);
              String workPermitId = await workPermitRepo.postWorkPermit(
                  request: _workPermit.value);
              Get.log(
                  '========== post Work permit id : $workPermitId ==========');
              await addAllFilesToAttachmentList(workPermitId: workPermitId);
              await postAttachments();

              Ui.showToast(content: Strings.workPermitAddedSuccessfully);
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

  /// post attachments
  postAttachments() async {
    try {
      if (uploadedAttachmentList.isNotEmpty) {
        await attachmentRepo.postAttachments(requests: uploadedAttachmentList);
      }
    } catch (e) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when post attachments: $e ==========');
    }
  }

  /// get all units wich related by this account
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

  /// get all contractors
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

  /// fill attachment list by files
  addAllFilesToAttachmentList({required String workPermitId}) async {
    if (insuranceFile.value != null) {
      String? base64 = await AttachmentServices.convertFileToBase64(
          file: insuranceFile.value!);
      String? mimeType = lookupMimeType(insuranceFile.value!.path);
      Get.log('========== insurance file base64 : $mimeType ==========');
      uploadedAttachmentList.add(Attachment(
        noteText: Constants.workPermitInsuranceAttachment,
        filename: Constants.workPermitInsuranceAttachment,
        objectIdValue: workPermitId.toString(),
        objectTypeCode: Constants.workPermitTableName,
        documentBody: base64,
        mimeType: mimeType,
      ));
    }
    if (cprFile.value != null) {
      String? base64 =
          await AttachmentServices.convertFileToBase64(file: cprFile.value!);
      String? mimeType = lookupMimeType(cprFile.value!.path);
      Get.log('========== cpr file base64 : $mimeType ==========');
      uploadedAttachmentList.add(Attachment(
        noteText: Constants.workPermitCprCardsAttachment,
        filename: Constants.workPermitCprCardsAttachment,
        objectIdValue: workPermitId.toString(),
        objectTypeCode: Constants.workPermitTableName,
        documentBody: base64,
        mimeType: mimeType,
      ));
    }
    if (methodFile.value != null) {
      String? base64 =
          await AttachmentServices.convertFileToBase64(file: methodFile.value!);
      String? mimeType = lookupMimeType(methodFile.value!.path);
      Get.log('========== method file base64 : $mimeType ==========');
      uploadedAttachmentList.add(Attachment(
        noteText: Constants.workPermitMethodStatementAttachment,
        filename: Constants.workPermitMethodStatementAttachment,
        objectIdValue: workPermitId.toString(),
        objectTypeCode: Constants.workPermitTableName,
        documentBody: base64,
        mimeType: mimeType,
      ));
    }
    if (riskFile.value != null) {
      String? base64 = await AttachmentServices.convertFileToBase64(
          file: insuranceFile.value!);
      String? mimeType = lookupMimeType(insuranceFile.value!.path);
      Get.log('========== riskFile file base64 : $mimeType ==========');
      uploadedAttachmentList.add(Attachment(
        noteText: Constants.workPermitRiskAssessmentAttachment,
        filename: Constants.workPermitRiskAssessmentAttachment,
        objectIdValue: workPermitId.toString(),
        objectTypeCode: Constants.workPermitTableName,
        documentBody: base64,
        mimeType: mimeType,
      ));
    }
  }
}
