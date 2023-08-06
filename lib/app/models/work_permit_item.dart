class WorkPermitItem {
  int? stateCode;
  String? workPermitItemId;
  String? id;
  DateTime? createdOn;
  String? workPermitId;
  String? ownerId;
  String? owningBusinessUnitId;
  String? createdById;
  String? description;
  int? type;

  WorkPermitItem({
    this.stateCode,
    this.workPermitItemId,
    this.id,
    this.createdOn,
    this.workPermitId,
    this.ownerId,
    this.owningBusinessUnitId,
    this.createdById,
    this.description,
    this.type,
  });

  factory WorkPermitItem.fromJson(
      Map<String, dynamic> json) =>
      WorkPermitItem(
        stateCode: json["statecode"],
        workPermitItemId: json["blser_workpermititemid"],
        id: json["blser_id"],
        createdOn: json["createdon"] == null ? null : DateTime.parse(
            json["createdon"]),
        workPermitId: json["_blser_workpermit_value"],
        ownerId: json["_ownerid_value"],
        owningBusinessUnitId: json["_owningbusinessunit_value"],
        createdById: json["_createdby_value"],
        description: json["blser_workdescription"],
        type: json["blser_worktype"],
      );

  Map<String, dynamic> toJson() =>
      {
        "statecode": stateCode,
        "blser_workpermititemid": workPermitItemId,
        "blser_id": id,
        "createdon": createdOn?.toIso8601String(),
        "_blser_workpermit_value": workPermitId,
        "_ownerid_value": ownerId,
        "_owningbusinessunit_value": owningBusinessUnitId,
        "_createdby_value": createdById,
        "blser_workdescription": description,
        "blser_worktype": type,
      };
}