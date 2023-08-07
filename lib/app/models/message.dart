class MessageModel {
  MessageModel({
    this.subject,
    this.messageBody,
    this.activityId,
    this.createdOn,
    this.regardingId,
    this.readStatus,
    this.accountId,
    this.statusCode,
    this.direction,
    this.createdBy,
  });

  String? subject;
  String? messageBody;
  String? activityId;
  DateTime? createdOn;
  String? regardingId;
  bool? readStatus;
  String? accountId;
  int? statusCode;
  bool? direction;
  String? createdBy;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        subject: json["subject"],
        messageBody: json["blser_messagetext"],
        activityId: json["activityid"],
        createdOn: DateTime.parse(json["createdon"]),
        regardingId: json["_regardingobjectid_value"],
        readStatus: json["blser_readstatus"],
        accountId: json["_blser_account_value"],
        statusCode: json["statuscode"],
        direction: json["blser_direction"],
        createdBy: json["_createdby_value"],
      );

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
      };
}
