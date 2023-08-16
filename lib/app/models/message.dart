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
      this.regardingName});

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
        "blser_messagetext": messageBody,
        "activityid": activityId,
        "_regardingobjectid_value": regardingId,
        "blser_readstatus": readStatus,
        "_blser_account_value": accountId,
        "statuscode": statusCode,
        "blser_direction": direction,
        "_createdby_value": createdBy,
        "prioritycode": priorityCode,
        "_regardingobjectid_value@Microsoft.Dynamics.CRM.lookuplogicalname":
            regardingName
      };
}
