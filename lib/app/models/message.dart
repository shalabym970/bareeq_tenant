class MessageModel {
  MessageModel({
    this.subject,
    this.message,
    this.activityId,
    this.createdOn,
    this.regardingId,
  });

  String? subject;
  String? message;
  String? activityId;
  DateTime? createdOn;
  String? regardingId;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    subject: json["subject"],
    message: json["blser_messagetext"],
    activityId: json["activityid"],
    createdOn: DateTime.parse(json["createdon"]),
    regardingId: json["_regardingobjectid_value"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "blser_messagetext": message,
    "activityid": activityId,
    "_regardingobjectid_value": regardingId,
  };
}