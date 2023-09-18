class Contract {
  String? id;
  String? propertyID;
  String? unitId;
  String? contactId;

  Contract({
    this.id,
    this.propertyID,
    this.unitId,
    this.contactId,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        id: json["advanced_propertycontractid"],
        propertyID: json["_blser_property_value"],
        unitId: json["_advanced_unitid_value"],
        contactId: json["advanced_contactid"],
      );
}
