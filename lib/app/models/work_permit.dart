import 'package:Bareeq/app/models/unit.dart';
import 'package:Bareeq/app/models/work_permit_item.dart';

import 'account_model.dart';
import 'contract.dart';

class WorkPermit {
  String? subject;
  bool? type;
  String? contractorId;
  String? customerId;
  DateTime? startDate;
  DateTime? endDate;
  int? statusCode;
  String? description;
  String? id;
  int? numberOfWorkers;
  bool? riskAssessment;
  String? ownerId;
  String? comment;
  List<WorkPermitItem>? workPermitItems;
  Unit? relatedUnit;
  Account? contractor;
  Contract? contract;

  WorkPermit(
      {this.subject,
      this.type,
      this.contractorId,
      this.customerId,
      this.startDate,
      this.endDate,
      this.statusCode,
      this.description,
      this.id,
      this.numberOfWorkers,
      this.riskAssessment,
      this.ownerId,
      this.workPermitItems,
      this.relatedUnit,
      this.comment,
      this.contractor,
      this.contract});

  factory WorkPermit.fromJson(Map<String, dynamic> json) => WorkPermit(
        subject: json["blser_subject"],
        type: json["new_type"],
        contractorId: json["_blser_contractor_value"],
        customerId: json["_blser_customer_value"],
        startDate: json["blser_startdate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_startdate"]),
        endDate: json["blser_enddate"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_enddate"]),
        statusCode: json["statuscode"],
        description: json["blser_descriptionofwork"],
        id: json["blser_workpermitid"],
        numberOfWorkers: json["blser_numberofworkers"],
        riskAssessment: json["blser_riskassessment"],
        ownerId: json["_ownerid_value"],
        comment: json["blser_Bareeqcomments"],
        relatedUnit: json["blser_RelatedUnit"] == null
            ? null
            : Unit.fromJson(json["blser_RelatedUnit"]),
        contractor: Account.fromJson(json["blser_Contractor"]),
      );

  Map<String, dynamic> toJson() => {
        "blser_subject": subject,
        "new_type": type,
        "blser_Contractor@odata.bind": "accounts(${contractor!.id})",
        "blser_Customer_account@odata.bind": "/accounts($customerId)",
        "blser_startdate": startDate?.toIso8601String(),
        "blser_enddate": endDate?.toIso8601String(),
        "statuscode": 1,
        "blser_descriptionofwork": description,
        "blser_numberofworkers": numberOfWorkers,
        "blser_PropertyContract@odata.bind":
            "advanced_propertycontracts(${contract!.id})",
        "blser_RelatedProject@odata.bind":
            "advanced_projects(${contract!.propertyID})",
        "blser_RelatedUnit@odata.bind": "advanced_units(${relatedUnit!.id})",
      };
}
