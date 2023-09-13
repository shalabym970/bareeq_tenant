class LoginActivityModel {
  LoginActivityModel({
    this.createdOn,
    this.createdId,
    this.activityId,
  });

  DateTime? createdOn;
  String? createdId;
  String? activityId;

  factory LoginActivityModel.fromJson(Map<String, dynamic> json) =>
      LoginActivityModel(
        createdOn: DateTime.parse(json["createdon"] ?? DateTime(0000, 00, 00)),
        createdId: json["_createdby_value"] ?? "null",
        activityId: json["activityid"] ?? "null",
      );
}
