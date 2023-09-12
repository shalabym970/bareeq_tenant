import 'package:get/get.dart';
import '../services/session_services.dart';

class MessageModel {
  MessageModel(
      {this.subject,
      this.messageBody,
      this.activityId,
      this.createdOn,
      this.regardingId,
      this.readStatus,
      this.accountId,
      this.statusCode,
      this.direction,
      this.createdBy,
      this.priorityCode,
      this.regardingName,
      this.scheduledStart});

  String? subject;
  String? messageBody;
  String? activityId;
  String? createdOn;
  String? regardingId;
  bool? readStatus;
  String? accountId;
  int? statusCode;
  bool? direction;
  String? createdBy;
  int? priorityCode;
  String? regardingName;
  DateTime? scheduledStart;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      subject: json["subject"],
      messageBody: json["blser_messagetext"],
      activityId: json["activityid"],
      createdOn: json["createdon@OData.Community.Display.V1.FormattedValue"],
      regardingId: json["_regardingobjectid_value"],
      readStatus: json["blser_readstatus"],
      accountId: json["_blser_account_value"],
      statusCode: json["statuscode"],
      direction: json["blser_direction"],
      createdBy: json["_createdby_value"],
      priorityCode: json["prioritycode"],
      regardingName: json[
          "_regardingobjectid_value@Microsoft.Dynamics.CRM.lookuplogicalname"]);

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "blser_Account_blser_portalmessages@odata.bind":
            "/accounts(${Get.find<SessionServices>().currentUser.value.accountCustomerId})",
        "blser_Contact_blser_portalmessages@odata.bind":
            "/contacts(${Get.find<SessionServices>().currentUser.value.id})",
        "regardingobjectid_blser_workpermit_blser_portalmessages@odata.bind":
            "/${regardingName}s($regardingId)",
        "blser_messagetext": messageBody,
        "blser_readstatus": readStatus,
        "blser_direction": direction,
        "prioritycode": priorityCode,
        "scheduledstart": scheduledStart?.toIso8601String()
      };
}
