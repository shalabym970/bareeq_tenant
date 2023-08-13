import 'package:Seef/app/models/unit.dart';
import 'package:Seef/app/models/work_permit_item.dart';

import 'account_model.dart';

class WorkPermitModel {
  String? subject;
  bool? type;
  String? contractorId;
  String? customerId;
  DateTime? startDate;
  DateTime? endDate;
  int? statusCode;
  String? description;
  String? workPermitId;
  int? numberOfWorkers;
  bool? riskAssessment;
  String? ownerId;
  String? comment;
  List<WorkPermit>? workPermitItems;
  Unit? relatedUnit;
  Account? contractor;

  WorkPermitModel(
      {this.subject,
      this.type,
      this.contractorId,
      this.customerId,
      this.startDate,
      this.endDate,
      this.statusCode,
      this.description,
      this.workPermitId,
      this.numberOfWorkers,
      this.riskAssessment,
      this.ownerId,
      this.workPermitItems,
      this.relatedUnit,
      this.comment,
      this.contractor});

  factory WorkPermitModel.fromJson(Map<String, dynamic> json) => WorkPermitModel(
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
        statusCode: json["statuscode"],
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
            : List<WorkPermit>.from(
                json["blser_blser_workpermit_blser_workpermititem_WorkPermit"]!
                    .map((x) => WorkPermit.fromJson(x))),
        relatedUnit: json["blser_RelatedUnit"] == null
            ? null
            : Unit.fromJson(json["blser_RelatedUnit"]),
      contractor: json["blser_Contractor"] == null ? null : Account.fromJson(json["blser_Contractor"]),
      );

  Map<String, dynamic> toJson() => {
        "blser_subject": subject,
        "new_type": type,
        "blser_seefcomments": comment,
        "_blser_contractor_value": contractorId,
        "_blser_customer_value": customerId,
        "blser_startdate": startDate?.toIso8601String(),
        "blser_enddate": endDate?.toIso8601String(),
        "statuscode": statusCode,
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
