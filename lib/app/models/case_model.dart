import 'package:bareeq/app/models/project.dart';
import 'package:bareeq/app/models/unit.dart';
import 'package:bareeq/app/services/session_services.dart';
import 'package:get/get.dart';
import 'message.dart';

class Case {
  Case(
      {this.priority,
      this.title,
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
      this.natureOfComplaint,
      this.relatedProperty});

  int? priority;
  int? natureOfComplaint;
  String? title;
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
  Unit? relatedProperty;
  Project? property;

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        relatedProperty: json["blser_PropertyLease"] != null
            ? Unit.fromJson(json["blser_PropertyLease"])
            : null,
        priority: json["new_prioritycode"],
        title: json["blser_title"],
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
        natureOfComplaint: json["blser_natureofcomplaint"],
        messages: json["blser_case_blser_portalmessageses"] == null
            ? []
            : List<MessageModel>.from(json["blser_case_blser_portalmessageses"]
                .map((x) => MessageModel.fromJson(x))),
        unit: json["blser_LeaseUnit"] != null
            ? Unit.fromJson(json["blser_LeaseUnit"])
            : null,
        property: json["blser_RelatedProject"] != null
            ? Project.fromJson(json["blser_RelatedProject"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "blser_title": title.toString(),
        "blser_description": description.toString(),
        "blser_casetypecode": type.toString(),
        "blser_RelatedProject@odata.bind":
            "/advanced_projects(${unit!.contract!.first.propertyID.toString()})",
        "blser_PropertyLease@odata.bind":
            "/advanced_propertycontracts(${unit!.contract!.first.id.toString()})",
        "blser_LeaseUnit@odata.bind": "/advanced_units(${unit!.id.toString()})",
        "blser_Account@odata.bind":
            "/accounts(${Get.find<SessionServices>().currentUser.value.accountCustomerId})",
        "blser_Contact@odata.bind":
            "/contacts(${Get.find<SessionServices>().currentUser.value.id})",
        "new_prioritycode": priority, // Choice
        "blser_natureofcomplaint": natureOfComplaint,
      };
}
