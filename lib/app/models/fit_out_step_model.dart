import 'fit_out_step_task.dart';

class FitOutStepModel {
  String? description;
  int? status;
  int? statusCode;
  String? relatedProcessId;
  DateTime? createdOn;
  String? name;
  String? id;
  List<FitOutStepTask>? fitOutStepTask;


  FitOutStepModel({
    this.description,
    this.status,
    this.statusCode,
    this.relatedProcessId,
    this.createdOn,
    this.name,
    this.id,
    this.fitOutStepTask
  });

  factory FitOutStepModel.fromJson(Map<String, dynamic> json) =>
      FitOutStepModel(
        description: json["blser_description"],
        status: json["blser_stepstatus"],
        statusCode: json["statuscode"],
        relatedProcessId: json["_blser_relatedprocess_value"],
        createdOn:  json["createdon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["createdon"]),
        name: json["blser_name"],
        id: json["blser_fitoutstepid"],
        fitOutStepTask: json["blser_fitoutstep_Tasks"] == null ? [] : List<FitOutStepTask>.from(json["blser_fitoutstep_Tasks"]!.map((x) => FitOutStepTask.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "blser_description": description,
        "blser_stepstatus": status,
        "statuscode": statusCode,
        "_blser_relatedprocess_value": relatedProcessId,
        "createdon": createdOn?.toIso8601String(),
        "blser_name": name,
        "blser_fitoutstepid": id,
      };
}
