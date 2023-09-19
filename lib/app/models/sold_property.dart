class SoldProperty {
  int? agreementType;
  DateTime? transferDate;
  DateTime? agreementDate;
  String? agreementRef;
  String? name;
  int? agreementStatus;
  String? id;

  SoldProperty({
    this.agreementType,
    this.transferDate,
    this.agreementDate,
    this.agreementRef,
    this.name,
    this.agreementStatus,
    this.id,
  });

  factory SoldProperty.fromJson(Map<String, dynamic> json) => SoldProperty(
        agreementType: json["blser_agreementtype"],
        transferDate: json["blser_transferdate"] == null
            ? null
            : DateTime.parse(json["blser_transferdate"]),
        agreementDate: json["blser_agreementdate"] == null
            ? null
            : DateTime.parse(json["blser_agreementdate"]),
        agreementRef: json["blser_agreementref"],
        name: json["blser_name"],
        agreementStatus: json["blser_agreementstatus"],
        id: json["blser_propertyagreementid"],
      );
}
