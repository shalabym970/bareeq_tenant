import 'package:Seef/app/models/unit.dart';
import 'package:Seef/app/models/work_permit_item.dart';

class WorkPermit {
  String? subject;
  bool? type;
  String? contractorId;
  String? customerId;
  DateTime? startDate;
  DateTime? endDate;
  int? stateCode;
  String? description;
  String? workPermitId;
  int? numberOfWorkers;
  bool? riskAssessment;
  String? ownerId;
  String? comment;
  List<WorkPermitItem>? workPermitItems;
  Unit? relatedUnit;

  WorkPermit(
      {this.subject,
      this.type,
      this.contractorId,
      this.customerId,
      this.startDate,
      this.endDate,
      this.stateCode,
      this.description,
      this.workPermitId,
      this.numberOfWorkers,
      this.riskAssessment,
      this.ownerId,
      this.workPermitItems,
      this.relatedUnit,
      this.comment});

  factory WorkPermit.fromJson(Map<String, dynamic> json) => WorkPermit(
        subject: json["blser_subject"],
        type: json["new_type"],
        contractorId: json["_blser_contractor_value"],
        customerId: json["_blser_customer_value"],
        startDate: json["blser_startdate"] == null
            ? null
            : DateTime.parse(json["blser_startdate"]),
        endDate: json["blser_enddate"] == null
            ? null
            : DateTime.parse(json["blser_enddate"]),
        stateCode: json["statecode"],
        description: json["blser_descriptionofwork"],
        workPermitId: json["blser_workpermitid"],
        numberOfWorkers: json["blser_numberofworkers"],
        riskAssessment: json["blser_riskassessment"],
        ownerId: json["_ownerid_value"],
        comment: json["blser_seefcomments"],
        workPermitItems: json[
                    "blser_blser_workpermit_blser_workpermititem_WorkPermit"] ==
                null
            ? []
            : List<WorkPermitItem>.from(
                json["blser_blser_workpermit_blser_workpermititem_WorkPermit"]!
                    .map((x) => WorkPermitItem.fromJson(x))),
        relatedUnit: json["blser_RelatedUnit"] == null
            ? null
            : Unit.fromJson(json["blser_RelatedUnit"]),
      );

  Map<String, dynamic> toJson() => {
        "blser_subject": subject,
        "new_type": type,
        "blser_seefcomments": comment,
        "_blser_contractor_value": contractorId,
        "_blser_customer_value": customerId,
        "blser_startdate": startDate?.toIso8601String(),
        "blser_enddate": endDate?.toIso8601String(),
        "statecode": stateCode,
        "blser_descriptionofwork": description,
        "blser_workpermitid": workPermitId,
        "blser_numberofworkers": numberOfWorkers,
        "blser_riskassessment": riskAssessment,
        "_ownerid_value": ownerId,
        "blser_blser_workpermit_blser_workpermititem_WorkPermit":
            workPermitItems == null
                ? []
                : List<dynamic>.from(workPermitItems!.map((x) => x.toJson())),
        "blser_RelatedUnit": relatedUnit?.toJson(),
      };
}
