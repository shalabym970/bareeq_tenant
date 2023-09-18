class WorkPermitItem {
  String? workPermitItemId;
  String? id;
  DateTime? createdOn;
  String? workPermitId;
  String? ownerId;
  String? owningBusinessUnitId;
  String? createdById;
  String? description;
  int? statusCode;
  int? type;

  WorkPermitItem({
    this.workPermitItemId,
    this.id,
    this.createdOn,
    this.workPermitId,
    this.ownerId,
    this.owningBusinessUnitId,
    this.createdById,
    this.description,
    this.statusCode,
    this.type,
  });

  factory WorkPermitItem.fromJson(Map<String, dynamic> json) => WorkPermitItem(
        workPermitItemId: json["blser_workpermititemid"],
        id: json["blser_id"],
        createdOn:json["createdon"] == null
            ? DateTime(0000, 00, 00)
            : DateTime.parse(json["createdon"]),
        workPermitId: json["_blser_workpermit_value"],
        ownerId: json["_ownerid_value"],
        owningBusinessUnitId: json["_owningbusinessunit_value"],
        createdById: json["_createdby_value"],
        description: json["blser_workdescription"],
        statusCode: json["statuscod"],
        type: json["blser_worktype"],
      );

  Map<String, dynamic> toJson() => {
        "blser_WorkPermit@odata.bind": "/blser_workpermits($workPermitId)",
        "blser_workdescription": description,
        "blser_worktype": type,
      };
}
