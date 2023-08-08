import 'package:Seef/app/models/project.dart';
import 'package:Seef/app/models/unit.dart';

class FitOutModel {
  DateTime? startDate;
  bool? approved;
  DateTime? createdOn;
  DateTime? approvedOn;
  DateTime? completedDate;
  String? name;
  String? id;
  DateTime? reviewedOn;
  String? accountId;
  DateTime? expectedOpeningDate;
  bool? reviewed;
  String? relatedContractId;
  int? status;
  Project? property;
  Unit? unit;

  FitOutModel({
    this.startDate,
    this.approved,
    this.createdOn,
    this.approvedOn,
    this.completedDate,
    this.name,
    this.id,
    this.reviewedOn,
    this.accountId,
    this.expectedOpeningDate,
    this.reviewed,
    this.relatedContractId,
    this.status,
    this.property,
    this.unit,
  });

  factory FitOutModel.fromJson(Map<String, dynamic> json) => FitOutModel(
        startDate: json["blser_startdate"] == null
            ? null
            : DateTime.parse(json["blser_startdate"]),
        approved: json["blser_approved"],
        createdOn: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        approvedOn: json["blser_approvedon"] == null
            ? null
            : DateTime.parse(json["blser_approvedon"]),
        completedDate: json["blser_completeddate"] == null
            ? null
            : DateTime.parse(json["blser_completeddate"]),
        name: json["blser_name"],
        id: json["blser_fitoutprocessid"],
        reviewedOn: json["blser_reviewedon"] == null
            ? null
            : DateTime.parse(json["blser_reviewedon"]),
        accountId: json["_blser_relatedtenant_value"],
        expectedOpeningDate: json["blser_expectedopeningdate"] == null
            ? null
            : DateTime.parse(json["blser_expectedopeningdate"]),
        reviewed: json["blser_reviewed"],
        relatedContractId: json["_blser_relatedcontract_value"],
        status: json["blser_processstatus"],
        property: json["blser_RelatedProperty"] == null
            ? null
            : Project.fromJson(json["blser_RelatedProperty"]),
        unit: json["blser_RelatedUnit"] == null
            ? null
            : Unit.fromJson(json["blser_RelatedUnit"]),
      );

  Map<String, dynamic> toJson() => {
        "blser_startdate": startDate?.toIso8601String(),
        "blser_approved": approved,
        "createdon": createdOn?.toIso8601String(),
        "blser_approvedon": approvedOn,
        "blser_completeddate": completedDate?.toIso8601String(),
        "blser_name": name,
        "blser_fitoutprocessid": id,
        "blser_reviewedon": reviewedOn,
        "_blser_relatedtenant_value": accountId,
        "blser_expectedopeningdate": expectedOpeningDate?.toIso8601String(),
        "blser_reviewed": reviewed,
        "_blser_relatedcontract_value": relatedContractId,
        "blser_processstatus": status,
        "blser_RelatedProperty": property?.toJson(),
        "blser_RelatedUnit": unit?.toJson(),
      };
}
