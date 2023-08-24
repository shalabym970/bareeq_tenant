import 'package:Bareeq/app/models/project.dart';
import 'package:Bareeq/app/models/unit.dart';

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
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_startdate"]),
        approved: json["blser_approved"],
        createdOn: json["createdon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["createdon"]),
        approvedOn: json["blser_approvedon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_approvedon"]),
        completedDate: DateTime.parse(
            json["blser_completeddate"] ?? DateTime(0000, 00, 00)),
        name: json["blser_name"],
        id: json["blser_fitoutprocessid"],
        reviewedOn: json["blser_reviewedon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_reviewedon"]),
        accountId: json["_blser_relatedtenant_value"],
        expectedOpeningDate: json["blser_expectedopeningdate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_expectedopeningdate"]),
        reviewed: json["blser_reviewed"],
        relatedContractId: json["_blser_relatedcontract_value"],
        status: json["blser_processstatus"],
        property: Project.fromJson(json["blser_RelatedProperty"]),
        unit: json["blser_RelatedUnit"] == null
            ? null
            : Unit.fromJson(json["blser_RelatedUnit"]),
      );
}
