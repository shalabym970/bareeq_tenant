import 'package:Bareeq/app/models/project.dart';
import 'package:Bareeq/app/models/unit.dart';

import 'message.dart';

class Case {
  Case({
    this.priority,
    this.status,
    this.title,
    this.propertyLeaseId,
    this.state,
    this.caseNumber,
    this.type,
    this.submittedOn,
    this.completedOn,
    this.unitLeaseId,
    this.id,
    this.description,
    this.accountId,
    this.messages,
    this.unit,
    this.property,
  });

  int? priority;
  int? status;
  String? title;
  String? propertyLeaseId;
  int? state;
  String? caseNumber;
  int? type;
  DateTime? submittedOn;
  DateTime? completedOn;
  String? unitLeaseId;
  String? id;
  String? description;
  String? accountId;
  List<MessageModel>? messages;

  Unit? unit;
  Project? property;

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        priority: json["new_prioritycode"],
        status: json["statuscode"],
        title: json["blser_title"],
        propertyLeaseId: json["_blser_propertylease_value"],
        state: json["statecode"],
        caseNumber: json["blser_caseserial"],
        type: json["blser_casetypecode"],
        submittedOn: json["createdon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["createdon"]),
        completedOn: json["blser_datecompleted"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["blser_datecompleted"]),
        unitLeaseId: json["_blser_leaseunit_value"],
        id: json["blser_caseid"],
        description: json["blser_description"],
        accountId: json["_blser_account_value"],
        messages: json["blser_case_blser_portalmessageses"] == null
            ? []
            : List<MessageModel>.from(json["blser_case_blser_portalmessageses"]
                .map((x) => MessageModel.fromJson(x))),
        unit: Unit.fromJson(json["blser_LeaseUnit"]),
        property: Project.fromJson(json["blser_RelatedProject"]),
      );

  Map<String, dynamic> toJson() => {
        "new_prioritycode": priority,
        "statuscode": status,
        "blser_title": title,
        "_blser_propertylease_value": propertyLeaseId,
        "statecode": state,
        "blser_caseserial": caseNumber,
        "blser_casetypecode": type,
        "createdon": submittedOn?.toIso8601String(),
        "blser_datecompleted": completedOn?.toIso8601String(),
        "_blser_leaseunit_value": unitLeaseId,
        "blser_caseid": id,
        "blser_description": description,
        "_blser_account_value": accountId,
        "blser_LeaseUnit": unit?.toJson(),
        //  "blser_RelatedProject": relatedProject?.toJson(),
      };
}
