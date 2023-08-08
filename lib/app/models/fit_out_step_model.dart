class FitOutStepModel {
  String? description;
  int? status;
  int? statusCode;
  String? relatedProcessId;
  DateTime? createdOn;
  String? name;
  String? fitOutStepId;

  FitOutStepModel({
    this.description,
    this.status,
    this.statusCode,
    this.relatedProcessId,
    this.createdOn,
    this.name,
    this.fitOutStepId,
  });

  factory FitOutStepModel.fromJson(Map<String, dynamic> json) =>
      FitOutStepModel(
        description: json["blser_description"],
        status: json["blser_stepstatus"],
        statusCode: json["statuscode"],
        relatedProcessId: json["_blser_relatedprocess_value"],
        createdOn: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        name: json["blser_name"],
        fitOutStepId: json["blser_fitoutstepid"],
      );

  Map<String, dynamic> toJson() => {
        "blser_description": description,
        "blser_stepstatus": status,
        "statuscode": statusCode,
        "_blser_relatedprocess_value": relatedProcessId,
        "createdon": createdOn?.toIso8601String(),
        "blser_name": name,
        "blser_fitoutstepid": fitOutStepId,
      };
}
